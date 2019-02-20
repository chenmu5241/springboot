package net.newglobe.config;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.Filter;

import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import net.newglobe.shiro.CaptchaFormAuthenticationFilter;
import net.newglobe.shiro.ShiroDbRealm;

@Configuration
public class ShiroConfiguration {

	private static final Logger log = LoggerFactory.getLogger(ShiroConfiguration.class);

	/**
	 * SecurityManager
	 * 
	 * @param shiroDbRealm
	 * @return
	 */
	@Bean(name = "securityManager")
	public SecurityManager securityManager(@Qualifier("shiroDbRealm") ShiroDbRealm shiroDbRealm) {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		// 设置realm
		securityManager.setRealm(shiroDbRealm);
		// 设置rememberMe管理器
		securityManager.setRememberMeManager(rememberMeManager());
		securityManager.setSessionManager(sessionManager());
		securityManager.setCacheManager(shiroEhcacheManager());
		return securityManager;
	}

	/**
	 * shiroDbRealm
	 * 
	 * @param matcher
	 * @return
	 */
	@Bean(name = "shiroDbRealm")
	public ShiroDbRealm myAuthRealm(@Qualifier("hashedCredentialsMatcher") HashedCredentialsMatcher matcher) {
		ShiroDbRealm myShiroRealm = new ShiroDbRealm();
		// 设置密码凭证匹配器
		myShiroRealm.setCredentialsMatcher(matcher);
		myShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
		return myShiroRealm;
	}

	/**
	 * ShiroFilterFactoryBean
	 * 
	 * @param securityManager
	 * @return
	 */
	@Bean
	public ShiroFilterFactoryBean shiroFilter(@Qualifier("securityManager") SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
		// 必须设置 SecurityManager
		shiroFilterFactoryBean.setSecurityManager(securityManager);
		Map<String, Filter> filters = new HashMap<String, Filter>();
		filters.put("kaptchaFilter", new CaptchaFormAuthenticationFilter());
		shiroFilterFactoryBean.setFilters(filters);

		// 拦截器.
		Map<String, String> map = new LinkedHashMap<String, String>();
		
		// 配置不会被拦截的链接 顺序判断
		map.put("/getCode", "anon");
		map.put("/static/**", "anon");
		map.put("/js/**", "anon");
		map.put("/assets/**", "anon");
		map.put("/images/**", "anon");
		map.put("/favicon.ico", "anon");
		// 配置退出 过滤器,其中的具体的退出代码Shiro已经替我们实现了
		map.put("/logout", "logout");
		//<!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问; user”表示访问该地址的用户是身份验证通过或RememberMe登录的都可以-->
		map.put("/login","kaptchaFilter");
		map.put("/**", "user");
		
		// 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
		shiroFilterFactoryBean.setLoginUrl("/login");
		// 登录成功后要跳转的链接
		shiroFilterFactoryBean.setSuccessUrl("/index");
		// 未授权界面;
		shiroFilterFactoryBean.setUnauthorizedUrl("/error/403");
		
		
//		LinkedHashMap<String, Filter> filtsMap=new LinkedHashMap<String, Filter>();
//        filtsMap.put("authc",captchaFormAuthenticationFilter());
//        shiroFilterFactoryBean.setFilters(filtsMap);

		shiroFilterFactoryBean.setFilterChainDefinitionMap(map);
		return shiroFilterFactoryBean;
	}

	/**
	 * 开启shiro aop注解支持. 使用代理方式;所以需要开启代码支持; Controller才能使用@RequiresPermissions
	 * 
	 * @param securityManager
	 * @return
	 */
	@Bean
	public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(
			@Qualifier("securityManager") SecurityManager securityManager) {
		AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
		authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
		return authorizationAttributeSourceAdvisor;
	}

	/**
	 * shiroEhcacheManager
	 * 
	 * @return
	 */
	@Bean(value = "shiroEhcacheManager")
	public EhCacheManager shiroEhcacheManager() {
		EhCacheManager cacheManager = new EhCacheManager();
		cacheManager.setCacheManagerConfigFile("classpath:ehcache-shiro.xml");
		return cacheManager;
	}

	/**
	 * captchaFormAuthenticationFilter
	 * 
	 * @return
	 */
//	@Bean(name = "captchaFormAuthenticationFilter")
//	public CaptchaFormAuthenticationFilter captchaFormAuthenticationFilter() {
//		return new CaptchaFormAuthenticationFilter();
//	}

	/**
	 * 密码匹配凭证管理器
	 * 
	 * @return
	 */
	@Bean(name = "hashedCredentialsMatcher")
	public HashedCredentialsMatcher hashedCredentialsMatcher() {
		HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
		hashedCredentialsMatcher.setHashAlgorithmName("MD5");// 散列算法:这里使用MD5算法;
		hashedCredentialsMatcher.setHashIterations(1);// 散列的次数，比如散列两次，相当于
		return hashedCredentialsMatcher;
	}

	/**
	 * cookie对象;
	 * 
	 * @return
	 */
	@Bean
	public SimpleCookie rememberMeCookie() {
		// 这个参数是cookie的名称，对应前端的checkbox 的name = rememberMe
		SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
		// <!-- 记住我cookie生效时间30天（259200） ,单位秒;-->
		simpleCookie.setMaxAge(259200);
		return simpleCookie;
	}

	/**
	 * 记住我管理器 cookie管理对象;
	 * 
	 * @return
	 */
	@Bean(name = "rememberMeManager")
	public CookieRememberMeManager rememberMeManager() {
		CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
		cookieRememberMeManager.setCookie(rememberMeCookie());
		return cookieRememberMeManager;
	}

	/**
	 * sessionManager
	 * 
	 * @return
	 */
	@Bean
	public SessionManager sessionManager() {
		DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
		// 设置session过期时间为1小时(单位：毫秒)，默认为30分钟
		sessionManager.setGlobalSessionTimeout(1000 * 60 * 4);
		sessionManager.setSessionValidationSchedulerEnabled(true);
		return sessionManager;
	}

}