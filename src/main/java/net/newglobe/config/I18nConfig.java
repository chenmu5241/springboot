package net.newglobe.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

/**
 * Created by zhenglian on 2016/10/12.
 */
@Configuration
public class I18nConfig implements WebMvcConfigurer {
	/**
	 * session区域解析器
	 * 
	 * @return
	 */
	@Bean
	public LocaleResolver localeResolver() {
//		SessionLocaleResolver resolver = new SessionLocaleResolver();
//		// 这里通过设置China.US可以进行中英文转化
//		resolver.setDefaultLocale(Locale.US);
//		Locale locale = new Locale("zh", "cn");
		
		SessionLocaleResolver resolver = new SessionLocaleResolver();
//		resolver.setDefaultLocale(Locale.US);
		resolver.setDefaultLocale(Locale.SIMPLIFIED_CHINESE);
//		resolver.setDefaultLocale(locale);  
        return resolver;  
	}

	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor lci = new LocaleChangeInterceptor();
		// 设置请求地址的参数,默认为：locale
		// language=zh_cn
		// language=en_us
		lci.setParamName("language");
		return lci;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(localeChangeInterceptor());
	}

}
