package net.newglobe.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;

import net.newglobe.app.model.SysPower;
import net.newglobe.app.model.vo.DataResult;
import net.newglobe.app.model.vo.ListDataResult;
import net.newglobe.app.model.vo.Result;
import net.newglobe.app.service.SysPowerService;

@Controller
@RequestMapping(value = "/power")
public class SysPowerController {
	private Logger logger = LoggerFactory.getLogger(SysAccountController.class);
	@Autowired
	private SysPowerService sysPowerService;
	//@Operation(title="查看权限列表")
	@RequestMapping(value = "/toList")
	public String toAccountList() {
		try {
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/power/list";
	}

	@RequestMapping("toEdit")
	public String toEdit(HttpServletRequest request, Long id) {
		try {
			SysPower power = sysPowerService.selectById(id);
			request.setAttribute("power", power);
			
			SysPower temp = new SysPower();
			temp.setStatus(1);
			List<SysPower> powers = sysPowerService.selectList(temp);
			request.setAttribute("powers", powers);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/power/edit";
	}

	@RequestMapping("toAdd")
	public String toAdd(HttpServletRequest request) {
		try {
			SysPower power = new SysPower();
			power.setStatus(1);
			List<SysPower> powers = sysPowerService.selectList(power);
			request.setAttribute("powers", powers);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage(), e);
		}
		return "app/power/add";
	}

	@RequestMapping("getList")
	@ResponseBody
	public ListDataResult<SysPower> getData(SysPower sysPower) {
		ListDataResult<SysPower> result = new ListDataResult<SysPower>();
		try {
			sysPower.setStatus(1);
			//sysPower.setParentId(-1L);
			PageHelper.orderBy("layer_code asc");
			
			List<SysPower> sysPowers = sysPowerService.selectList(sysPower);
//			List<SysPower> newList = new LinkedList<SysPower>();
//			digui(sysPowers, sysPower, newList);
			result.setData(sysPowers);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("查询数据异常!");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

//	public void digui(List<SysPower> parent, SysPower sysPower, List<SysPower> newList) {
//		for (SysPower power : parent) {
//			newList.add(power);
//			sysPower.setParentId(power.getId());
//			List<SysPower> children = sysPowerService.selectList(sysPower);
//			digui(children, sysPower, newList);
//		}
//	}

	@RequestMapping("delete")
	@ResponseBody
	public Result delete(String ids) {
		Result result = new Result();
		try {
			sysPowerService.deleteByIds(SysPower.class, ids);
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
	public Result update(SysPower t) {
		Result result = new Result();
		try {
			int layer = 1;
			if (t.getParentId() != -1) {
				SysPower parent = sysPowerService.selectById(t.getParentId());
				layer = parent.getLayer() + 1;
				t.setLayerCode(parent.getLayerCode()+"_"+t.getId());
			}else{
				t.setLayerCode(t.getId().toString());
			}
			t.setLayer(layer);
			sysPowerService.updateByIdSelective(t);
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
	public Result insert(SysPower t) {
		Result result = new Result();
		try {
			sysPowerService.insertNewPower(t);
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("checkPower")
	@ResponseBody
	public DataResult<Map<String, String>> checkAccount(SysPower t) {
		DataResult<Map<String, String>> result = new DataResult<Map<String, String>>();
		try {
			t.setStatus(1);
			Long count = sysPowerService.selectCount(t);
			Map<String, String> map = new HashMap<String, String>();
			if (count != 0) {
				map.put("error", "权限已存在");
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

	@RequestMapping("selectAll")
	@ResponseBody
	public ListDataResult<SysPower> loadData() {
		ListDataResult<SysPower> result = new ListDataResult<SysPower>();
		SysPower power = new SysPower();
		power.setStatus(1);
		try {
			result.setData(sysPowerService.selectList(power));
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

	@RequestMapping("loadDataByRoleId")
	@ResponseBody
	public ListDataResult<SysPower> loadDataByRoleId(Long id) {
		ListDataResult<SysPower> result = new ListDataResult<SysPower>();
		SysPower power = new SysPower();
		power.setStatus(1);
		try {
			result.setData(sysPowerService.queryByRoleId(id));
			result.setSuccess(true);
		} catch (Exception e) {
			result.setMessage("遇到问题");
			result.setSuccess(false);
			logger.error(e.getLocalizedMessage(), e);
		}
		return result;
	}

}
