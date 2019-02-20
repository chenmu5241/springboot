package net.newglobe.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.impl.DefaultKaptcha;

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
				return "redirect:/index";
			} 
			
			String uuid = UUID.randomUUID().toString().replace("_", "");
			request.getSession().setAttribute("uuid", uuid);
			
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

	/**
	 * 1、验证码工具
	 */
	@Autowired
	DefaultKaptcha defaultKaptcha;

	/**
	 * 2、生成验证码
	 * 
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @throws Exception
	 */
	@RequestMapping("/getCode")
	public void defaultKaptcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
			throws Exception {
		byte[] captchaChallengeAsJpeg = null;
		ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();
		try {
			// 生产验证码字符串并保存到session中
			String createText = defaultKaptcha.createText();
			httpServletRequest.getSession().setAttribute("randomcode", createText);
			// 使用生产的验证码字符串返回一个BufferedImage对象并转为byte写入到byte数组中
			BufferedImage challenge = defaultKaptcha.createImage(createText);
			ImageIO.write(challenge, "jpg", jpegOutputStream);
		} catch (IllegalArgumentException e) {
			httpServletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		// 定义response输出类型为image/jpeg类型，使用response输出流输出图片的byte数组
		captchaChallengeAsJpeg = jpegOutputStream.toByteArray();
		httpServletResponse.setHeader("Cache-Control", "no-store");
		httpServletResponse.setHeader("Pragma", "no-cache");
		httpServletResponse.setDateHeader("Expires", 0);
		httpServletResponse.setContentType("image/jpeg");
		ServletOutputStream responseOutputStream = httpServletResponse.getOutputStream();
		responseOutputStream.write(captchaChallengeAsJpeg);
		responseOutputStream.flush();
		responseOutputStream.close();
	}

}