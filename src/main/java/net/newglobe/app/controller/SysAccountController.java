package net.newglobe.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.newglobe.app.model.SysAccount;
import net.newglobe.app.model.SysRole;
import net.newglobe.app.model.vo.DataResult;
import net.newglobe.app.model.vo.PageVo;
import net.newglobe.app.model.vo.PagingDataResult;
import net.newglobe.app.model.vo.Result;
import net.newglobe.app.service.SysAccountService;
import net.newglobe.app.service.SysRoleService;
import net.newglobe.util.Md5;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Controller
@RequestMapping(value = "/account")
public class SysAccountController {
	private Logger logger = LoggerFactory.getLogger(SysAccountController.class);
	@Autowired
	private SysAccountService sysAccountService;
	@Autowired
	private SysRoleService sysRoleService;
	
	
	@RequestMapping(value = "/toResetpwd")
	public String toResetpwd(HttpServletRequest request) {
		return "resetpwd";
	}
	
	/***
	 * 修改密码
	 **/
	@RequestMapping(value = "/resetpwd")
	@ResponseBody
	public Result resetpwd(String password) {
		Result result = new Result();
		try {
			Subject subject = SecurityUtils.getSubject();
			SysAccount user = (SysAccount) subject.getPrincipal();
			user.setSalt(Md5.getSalt());
			user.setPassword(Md5.getMD5(password, user.getSalt()));
			sysAccountService.updateByIdSelective(user);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage("修改密码失败！");
			logger.error("修改密码", e);
		}
		return result;
	}
	
	//@Operation(title="查看账号列表")
	@RequestMapping(value = "/toList")
	public String toAccountList(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/account/list";
	}

	@RequestMapping("toEdit")
	public String toEdit(HttpServletRequest request) {
		try {
			SysRole sysRole = new SysRole();
			sysRole.setStatus(1);
			List<SysRole> sysRoles = sysRoleService.selectList(sysRole);
			request.setAttribute("sysRoles", sysRoles);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/account/edit";
	}

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request) {
		try {
			SysRole sysRole = new SysRole();
			sysRole.setStatus(1);
			List<SysRole> sysRoles = sysRoleService.selectList(sysRole);
			request.setAttribute("sysRoles", sysRoles);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/account/add";
	}

	@RequestMapping("getList")
	@ResponseBody
	public PagingDataResult<SysAccount> getData(@ModelAttribute SysAccount t, PageVo pageVo) {
		PagingDataResult<SysAccount> result = null;
		try {
			t.setStatus(1);
			
			Example example = new Example(SysAccount.class);
			Criteria criteria = example.createCriteria();
			criteria.andCondition("status=1");
			if(!StringUtils.isEmpty(t.getUsername())) {
				criteria.andCondition("username like '%"+t.getUsername()+"%'");
			}
			result = sysAccountService.selectListByExample(pageVo, example);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("查询数据异常!");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("delete")
	@ResponseBody
	public Result delete(String ids) {
		Result result = new Result();
		try {
			sysAccountService.deleteByIds(SysAccount.class, ids);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("update")
	@ResponseBody
	public Result update(SysAccount t,Long[] roleids,BindingResult results) {
		Result result = new Result();
		try {
			sysAccountService.updateAccount(t,roleids);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("insert")
	@ResponseBody
	public Result insert(SysAccount t,Long[] roleids) {
		Result result = new Result();
		try {
			sysAccountService.insertAccount(t,roleids);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("loadData")
	@ResponseBody
	public DataResult<SysAccount> loadData(Long id) {
		DataResult<SysAccount> result = new DataResult<SysAccount>();
		try {
			SysAccount sysAccount = sysAccountService.selectById(id);
			// 查询用户拥有的角色的权限
			List<SysRole> roles = sysRoleService.getAccountRoles(sysAccount.getId());		
			sysAccount.setRoles(roles);
			result.setData(sysAccount);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("checkAccount")
	@ResponseBody
	public DataResult<Map<String, String>> checkAccount(SysAccount t) {
		DataResult<Map<String, String>> result = new DataResult<Map<String, String>>();
		try {
			 Long count = sysAccountService.selectCount(t);
			Map<String, String> map = new HashMap<String, String>();
			if (count != 0) {
				map.put("error", "用户名已存在");
			} else {
				map.put("ok", "可以使用");
			}
			result.setData(map);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

}
