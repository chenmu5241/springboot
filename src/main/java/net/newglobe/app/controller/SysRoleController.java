package net.newglobe.app.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.newglobe.app.model.SysAccount;
import net.newglobe.app.model.SysRole;
import net.newglobe.app.model.vo.DataResult;
import net.newglobe.app.model.vo.PageVo;
import net.newglobe.app.model.vo.PagingDataResult;
import net.newglobe.app.model.vo.Result;
import net.newglobe.app.service.SysRolePowerService;
import net.newglobe.app.service.SysRoleService;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Controller
@RequestMapping(value = "/role")
public class SysRoleController {
	private Logger logger = LoggerFactory.getLogger(SysRoleController.class);
	@Autowired
	private SysRoleService sysRoleService;
	@Autowired
	private SysRolePowerService sysRolePowerService;
	//@Operation(title="查看角色列表")
	@RequestMapping(value = "/toList")
	public String toRoleList(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/role/list";
	}

	@RequestMapping("toEdit")
	public String toEdit(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/role/edit";
	}

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request) {
		try {

		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/role/add";
	}

	@RequestMapping("toPowerManage")
	public String toPowerManage(HttpServletRequest request) {
		try {

		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/role/power";
	}

	@RequestMapping("getList")
	@ResponseBody
	public PagingDataResult<SysRole> getData(@ModelAttribute SysRole t, PageVo pageVo) {
		PagingDataResult<SysRole> result = null;
		try {
			t.setStatus(1);
			Example example = new Example(SysRole.class);
			Criteria criteria = example.createCriteria();
			if(StringUtils.isNotEmpty(t.getName())) {
				criteria.andCondition("name like '%"+t.getName()+"%'");
			}
			if(StringUtils.isNotEmpty(t.getDescription())) {
				criteria.andCondition("description like '%"+t.getDescription()+"%'");
			}
			result = sysRoleService.selectListByExample(pageVo, example);
//					selectListByExample(t, pageVo);
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
			sysRoleService.deleteByIds(SysRole.class, ids);
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
	public Result update(SysRole t) {
		Result result = new Result();
		SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		try {
			t.setUpdateTime(new Date());
			t.setUpdator(user.getId());
			sysRoleService.updateByIdSelective(t);
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
	public Result insert(SysRole t) {
		Result result = new Result();
		SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		try {
			t.setUpdateTime(new Date());
			t.setUpdator(user.getId());
			t.setCreateTime(new Date());
			t.setCreator(user.getId());
			sysRoleService.insertSelective(t);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("addPowers")
	@ResponseBody
	public Result addPowers(Long id, Long[] powerIds) {
		Result result = new Result();
		try {
			sysRolePowerService.addRolePowers(id, powerIds);
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
	public DataResult<SysRole> loadData(Long id) {
		DataResult<SysRole> result = new DataResult<SysRole>();
		try {
			result.setData(sysRoleService.selectById(id));
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("checkRole")
	@ResponseBody
	public DataResult<Map<String, String>> checkAccount(SysRole t) {
		DataResult<Map<String, String>> result = new DataResult<Map<String, String>>();
		try {
			SysRole account = sysRoleService.selectOne(t);
			Map<String, String> map = new HashMap<String, String>();
			if (account != null) {
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
