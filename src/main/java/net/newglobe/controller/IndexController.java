package net.newglobe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;

import net.newglobe.model.SysAccount;
import net.newglobe.model.SysPower;
import net.newglobe.model.SysRole;
import net.newglobe.service.SysPowerService;
import net.newglobe.service.SysRoleService;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Controller
public class IndexController {
	public Logger logger = LoggerFactory.getLogger(IndexController.class);

	@Autowired
	private SysRoleService roleService;
	@Autowired
	private SysPowerService powerService;

	@RequestMapping({ "index", "","/" })
	public String index(HttpServletRequest request) {
		SysAccount sysAccount = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		if (sysAccount != null) {
			// 设置用户的角色和权限
			boolean flag = false;
			// 查询用户拥有的角色的权限
			List<SysRole> roles = roleService.getAccountRoles(sysAccount.getId());
			for (SysRole role : roles) {
				if (role.getId() == 1) {
					flag = true;
					break;
				}
			}

			List<SysPower> powers = null;
			SysPower power = new SysPower();
			power.setParentId(-1L);
			power.setStatus(1);
			power.setIsShow(1);
			if (flag) {// 超级管理员拥有所有菜单权限
				powers = powerService.selectRootTree(power);
			} else {
				power.setAccountId(sysAccount.getId());
				powers = powerService.selectTree(power);
			}
			sysAccount.setRoot(flag);
			sysAccount.setRoles(roles);
			sysAccount.setPowers(powers);
		}
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		httpRequest.getSession().setAttribute("account", sysAccount);
		return "index";
	}

	public void digui(List<SysPower> parents, String ids) {
		for (SysPower power : parents) {
			// temp.setParentId(power.getId());
			PageHelper.orderBy("layer_code asc");// 排序
			Example example = new Example(SysPower.class);
			Criteria criteria = example.createCriteria();
			criteria.andCondition("status=1").andCondition("is_show=1").andCondition("parent_id=" + power.getId())
					.andCondition("FIND_IN_SET(id,'" + ids + "')");
			List<SysPower> children = powerService.selectListByExample(example);
			if (children.size() > 0) {
				power.setChildren(children);
				digui(children, ids);
			} else {
				continue;
			}
		}
	}

}
