package net.newglobe.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.newglobe.model.SysAccount;

@Controller
public class HomeController {
	public Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping("home")
	public String index(HttpServletRequest request) {
		SysAccount sysAccount = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		System.out.println("hello world");
		return "home";
	}

}
