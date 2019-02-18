package com.newglobe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.newglobe.model.SysRole;
import com.newglobe.service.SysRoleService;

@Controller
public class IndexController {
	@Autowired
	private SysRoleService sysRoleService;

	@RequestMapping("/index")
	public String toIndex() {
		List<SysRole> list = sysRoleService.selectAll();
		System.out.println(JSON.toJSONString(list));
		System.out.println(sysRoleService.selectList());
		return "index";
	}
}
