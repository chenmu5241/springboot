package net.newglobe.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.beans.factory.annotation.Autowired;

import net.newglobe.service.SysPowerService;
import net.newglobe.service.SysRoleService;

public class CaptchaFormAuthenticationFilter extends FormAuthenticationFilter {
	@Autowired
	private SysRoleService roleService;

	@Autowired
	private SysPowerService powerService;
//	@Autowired
//	private HttpClientUtil httpClientUtil;

	protected boolean onAccessDenied(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
		HttpServletRequest httpServletRequest = (HttpServletRequest)request;
		// 从session获取正确的验证码
		HttpSession session = httpServletRequest.getSession();
/*		String sessionUuid = (String) session.getAttribute("uuid");
		String parameter = request.getParameter("uuid");
		if(parameter != null && !parameter.equals(sessionUuid)){
			request.setAttribute("shiroLoginFailure", "longTimeSession");
			// 拒绝访问，不再校验账号和密码
			return true;
		}*/
		
//		// 页面输入的验证码
//		String randomcode = request.getParameter("randomcode");
//		// 从session中取出验证码
//		String validateCode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
//		if (randomcode != null && validateCode != null) {
//			if (!randomcode.equalsIgnoreCase(validateCode)) {
//				// randomCodeError表示验证码错误
//				request.setAttribute("shiroLoginFailure", "randomCodeError");
//				// 拒绝访问，不再校验账号和密码
//				return true;
//			}
//		}
		return super.onAccessDenied(request, response, mappedValue);
	}

	/**
	 * 这个方法决定了是否能让用户登录
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		try {
//			HttpClientUtil.requestURL=httpServletRequest.getRequestURL().toString();
//			HttpClientUtil.name="电信产品分析";
//			httpClientUtil.start();
		} catch (Exception e) {
		}
		Subject subject = getSubject(request, response);
		return subject.isAuthenticated() || subject.isRemembered();
	}
	

}
