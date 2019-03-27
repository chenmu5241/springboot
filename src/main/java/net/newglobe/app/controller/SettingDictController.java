package net.newglobe.app.controller;

import java.util.Date;
import java.util.List;

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

import com.github.pagehelper.PageHelper;

import net.newglobe.app.model.SettingsDict;
import net.newglobe.app.model.SysAccount;
import net.newglobe.app.model.vo.ListDataResult;
import net.newglobe.app.model.vo.PageVo;
import net.newglobe.app.model.vo.PagingDataResult;
import net.newglobe.app.model.vo.Result;
import net.newglobe.app.service.SettingsDictService;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Controller
@RequestMapping(value = "/settingsDict")
public class SettingDictController {
	private Logger logger = LoggerFactory.getLogger(SettingDictController.class);
	@Autowired
	private SettingsDictService settingsDictService;
	
	@RequestMapping(value = "/toList")
	public String toSettingDictList(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/settings_dict/list";
	}

	@RequestMapping("toEdit")
	public String toEdit(HttpServletRequest request, Long id) {
		try {
			SettingsDict dict = settingsDictService.selectById(id);
			SettingsDict settingsDict = new SettingsDict();
			settingsDict.setStatus(1);
			settingsDict.setDictType(1);
			List<SettingsDict> settingsDicts = settingsDictService.selectList(settingsDict);
			request.setAttribute("dict", dict);
			request.setAttribute("settingsDicts", settingsDicts);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/settings_dict/edit";
	}

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request) {
		try {
			SettingsDict settingsDict = new SettingsDict();
			settingsDict.setStatus(1);
			settingsDict.setDictType(1);
			List<SettingsDict> settingsDicts = settingsDictService.selectList(settingsDict);
			request.setAttribute("settingsDicts", settingsDicts);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/settings_dict/add";
	}

	@RequestMapping("getList")
	@ResponseBody
	public PagingDataResult<SettingsDict> getData(@ModelAttribute SettingsDict t, PageVo pageVo) {
		PagingDataResult<SettingsDict> result = null;
		try {
			t.setStatus(1);
			t.setDictType(1);
			Example example = new Example(SettingsDict.class);
			Criteria criteria = example.createCriteria();
			criteria.andCondition("status=1")
											.andCondition("dict_type=1");
			if(!StringUtils.isBlank(t.getName())){
				criteria.andLike("name", "%"+t.getName()+"%");
			}
											
			result = settingsDictService.selectListByExample(pageVo, example);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("查询数据异常!");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("loadChildren")
	@ResponseBody
	public ListDataResult<SettingsDict> loadChildren(@ModelAttribute SettingsDict t) {
		ListDataResult<SettingsDict> result = new ListDataResult<SettingsDict>();
		try {
			t.setStatus(1);
			PageHelper.orderBy("sort  asc");
			List<SettingsDict> data = settingsDictService.selectList(t);
			result.setData(data);
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
			settingsDictService.deleteByIds(SettingsDict.class, ids);
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
	public Result update(SettingsDict t) {
		Result result = new Result();
		SysAccount sysAccount = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		try {
			t.setUpdateTime(new Date());
			t.setUpdator(sysAccount.getId());
			settingsDictService.updateByIdSelective(t);
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
	public Result insert(SettingsDict t) {
		Result result = new Result();
		SysAccount sysAccount = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		try {
			t.setDictType(2);
			t.setUpdateTime(new Date());
			t.setUpdator(sysAccount.getId());
			t.setCreateTime(new Date());
			t.setCreator(sysAccount.getId());
			settingsDictService.insertSelective(t);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

}
