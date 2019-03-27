package net.newglobe.app.service;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.newglobe.app.dao.read.SysRolePowerDao;
import net.newglobe.app.model.SysAccount;
import net.newglobe.app.model.SysRolePower;
import net.newglobe.app.mybatis.BaseService;
@Service
public class SysRolePowerService  extends BaseService<SysRolePower, SysRolePowerDao>{
	@Autowired
	private SysRolePowerDao sysRolePowerDao;

	@Transactional
	public void addRolePowers(Long roleId, Long[] powerIds) {
		SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		Date date = new Date();
		SysRolePower sysRolePower = new SysRolePower();
		sysRolePower.setRoleId(roleId);
		this.delete(sysRolePower);//删除之前的关联数据
		sysRolePower.setCreateTime(date);
		sysRolePower.setUpdateTime(date);
		sysRolePower.setCreator(user.getId());
		sysRolePower.setUpdator(user.getId());
		sysRolePower.setStatus(1);
		for(Long powerId: powerIds){
			sysRolePower.setPowerId(powerId);
			sysRolePower.setId(null);
			sysRolePowerDao.insertSelective(sysRolePower);
		}
	}
}