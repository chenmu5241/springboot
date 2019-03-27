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
import net.newglobe.app.model.SysLog;
import net.newglobe.app.model.vo.DataResult;
import net.newglobe.app.model.vo.PageVo;
import net.newglobe.app.model.vo.PagingDataResult;
import net.newglobe.app.model.vo.Result;
import net.newglobe.app.service.SysLogService;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Controller
@RequestMapping(value = "/sysLog")
public class SysLogController {
	private Logger logger = LoggerFactory.getLogger(SysLogController.class);
	@Autowired
	private SysLogService sysLogService;

	@RequestMapping(value = "/toList")
	public String toRoleList(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/log/list";
	}

	@RequestMapping("toEdit")
	public String toEdit(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/log/edit";
	}

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request) {
		try {

		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/log/add";
	}

	@RequestMapping("getList")
	@ResponseBody
	public PagingDataResult<SysLog> getData(@ModelAttribute SysLog t, PageVo pageVo) {
		PagingDataResult<SysLog> result = null;
		try {
			t.setStatus(1);
			
			Example example = new Example(SysLog.class);
			Criteria criteria = example.createCriteria();
			if(StringUtils.isNotEmpty(t.getUsername())) {
				criteria.andCondition("username like '%"+t.getUsername()+"%'");
			}
			result = sysLogService.selectListByExample(pageVo, example);
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
			sysLogService.deleteByIds(SysLog.class, ids);
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
	public Result update(SysLog t) {
		Result result = new Result();
		SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		try {
			t.setUpdateTime(new Date());
			t.setUpdator(user.getId());
			sysLogService.updateByIdSelective(t);
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
	public Result insert(SysLog t) {
		Result result = new Result();
		SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		try {
			t.setUpdateTime(new Date());
			t.setUpdator(user.getId());
			t.setCreateTime(new Date());
			t.setCreator(user.getId());
			sysLogService.insertSelective(t);
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
	public DataResult<SysLog> loadData(Long id) {
		DataResult<SysLog> result = new DataResult<SysLog>();
		try {
			result.setData(sysLogService.selectById(id));
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
	public DataResult<Map<String, String>> checkAccount(SysLog t) {
		DataResult<Map<String, String>> result = new DataResult<Map<String, String>>();
		try {
			SysLog account = sysLogService.selectOne(t);
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
