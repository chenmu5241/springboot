package net.newglobe.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.newglobe.model.SysAccount;

@Controller
public class LoginController {

	public Logger logger = LoggerFactory.getLogger("LoginController");

	@RequestMapping(value = "/login")
	public String login(HttpServletResponse response, HttpServletRequest request) {
		try {
			request.setAttribute("username", request.getParameter("username"));
			SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
			if (null != user) {
				return "redirect:index";
			} else {
				// 查询第三方登录url,以百度为例
				String uuid = UUID.randomUUID().toString().replace("_", "");
				request.getSession().setAttribute("uuid", uuid);
			}
			// 如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
			String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
			// 根据shiro返回的异常类路径判断，抛出指定异常信息
			if (exceptionClassName != null) {
				if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
					// 最终会抛给异常处理器
					request.setAttribute("loginErrorMsg", "账号不存在");
				} else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
					request.setAttribute("loginErrorMsg", "用户名/密码错误");
				} else if ("randomCodeError".equals(exceptionClassName)) {
					request.setAttribute("loginErrorMsg", "验证码错误");
				} else if ("longTimeSession".equals(exceptionClassName)) {
					request.setAttribute("loginErrorMsg", "session无效刷新重试");
				} else {
					request.setAttribute("loginErrorMsg", "其他错误");
				}
			}
		} catch (Exception e) {
			logger.error("登录异常:", e);
		}
		// 登陆失败还到login页面
		return "login";
	}

}