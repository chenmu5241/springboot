package net.newglobe.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.newglobe.app.model.SysAccount;
import net.newglobe.app.service.SysPowerService;
import net.newglobe.app.service.SysRoleService;

@Controller
public class HomeController {
	public Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SysRoleService roleService;
	@Autowired
	private SysPowerService powerService;
	
	@RequestMapping("home")
	public String index(HttpServletRequest request) {
		SysAccount sysAccount = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		return "home";
	}
	
	
}
