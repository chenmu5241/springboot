package net.newglobe.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.newglobe.app.model.SettingsConfig;
import net.newglobe.app.model.vo.DataResult;
import net.newglobe.app.model.vo.PageVo;
import net.newglobe.app.model.vo.PagingDataResult;
import net.newglobe.app.model.vo.Result;
import net.newglobe.app.service.SettingsConfigService;
import tk.mybatis.mapper.entity.Example;

@Controller
@RequestMapping(value = "/settingsConfig")
public class SettingsConfigController {
	private Logger logger = LoggerFactory.getLogger(SettingsConfigController.class);
	@Autowired
	private SettingsConfigService settingsConfigService;

	//@Operation(title="查看系统配置")
	@RequestMapping(value = "/toList")
	public String toList(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/settingsConfig/list";
	}

	@RequestMapping("toEdit")
	public String toEdit(HttpServletRequest request) {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/settingsConfig/edit";
	}

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request) {
		try {
			SettingsConfig ettingsConfig = new SettingsConfig();
			ettingsConfig.setStatus(1);
			List<SettingsConfig> sysRoles = settingsConfigService.selectList(ettingsConfig);
			request.setAttribute("sysRoles", sysRoles);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/settingsConfig/add";
	}

	@RequestMapping("getList")
	@ResponseBody
	public PagingDataResult<SettingsConfig> getData(@ModelAttribute SettingsConfig t, PageVo pageVo) {
		PagingDataResult<SettingsConfig> result = null;
		try {
			t.setStatus(1);
			Example example = new Example(SettingsConfig.class);
			if(null != t.getKeyName() && !"".equals(t.getKeyName())){
				example.createCriteria().andLike("keyName", "%"+t.getKeyName()+"%");
			}
			result = settingsConfigService.selectListByExample(pageVo, example);
					
					//.selectList(t, pageVo);
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
			settingsConfigService.deleteByIds(SettingsConfig.class, ids);
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
	public Result update(SettingsConfig t, BindingResult results) {
		Result result = new Result();
		try {
			settingsConfigService.updateByIdSelective(t);
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
	public Result insert(SettingsConfig t, Integer[] roleids) {
		Result result = new Result();
		try {
			settingsConfigService.insertSelective(t);
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
	public DataResult<SettingsConfig> loadData(Long id) {
		DataResult<SettingsConfig> result = new DataResult<SettingsConfig>();
		try {
			SettingsConfig settingsConfig = settingsConfigService.selectById(id);
			// 查询用户拥有的角色的权限
			result.setData(settingsConfig);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("checkSettingsConfig")
	@ResponseBody
	public DataResult<Map<String, String>> checkSettingsConfig(SettingsConfig t) {
		DataResult<Map<String, String>> result = new DataResult<Map<String, String>>();
		try {
			Long count = settingsConfigService.selectCount(t);
			Map<String, String> map = new HashMap<String, String>();
			if (count != 0) {
				map.put("error", "重复的配置");
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
