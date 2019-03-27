package net.newglobe.app.service;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.newglobe.app.dao.read.SysAccountDao;
import net.newglobe.app.model.SysAccount;
import net.newglobe.app.model.SysAccountRole;
import net.newglobe.app.mybatis.BaseService;
import net.newglobe.util.Md5;
@Service
public class SysAccountService extends BaseService<SysAccount, SysAccountDao>{
	@Autowired
	SysAccountRoleService sysAccountRoleService;
	
	@Transactional
	public void insertAccount(SysAccount t, Long[] roleids) {
		Date date = new Date();
		SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		t.setSalt(Md5.getSalt());
		t.setPassword(Md5.getMD5(t.getPassword(), t.getSalt()));
		t.setUpdateTime(date);
		t.setUpdator(user.getId());
		t.setCreateTime(date);
		t.setCreator(user.getId());
		insertSelective(t);
		SysAccountRole sysAccountRole = new SysAccountRole();
		sysAccountRole.setCreateTime(date);
		sysAccountRole.setUpdateTime(date);
		sysAccountRole.setCreator(user.getId());
		sysAccountRole.setUpdator(user.getId());
		sysAccountRole.setAccountId(t.getId());
		sysAccountRole.setStatus(1);
		for(Long roleId: roleids){
			sysAccountRole.setRoleId(roleId);
			sysAccountRoleService.insertSelective(sysAccountRole);
		}
	}
	
	@Transactional
	public void updateAccount(SysAccount t, Long[] roleids) {
		SysAccount user = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		Date date = new Date();
		if (t.getPassword() != null && !"".equals(t.getPassword())) {// 修改密码
			t.setSalt(Md5.getSalt());
			t.setPassword(Md5.getMD5(t.getPassword(), t.getSalt()));
		}else{
			t.setPassword(null);
		}
		t.setUpdateTime(new Date());
		t.setUpdator(user.getId());
		updateByIdSelective(t);
		SysAccountRole sysAccountRole = new SysAccountRole();
		sysAccountRole.setAccountId(t.getId());
		sysAccountRoleService.delete(sysAccountRole);//删除关联
		sysAccountRole.setCreateTime(date);
		sysAccountRole.setUpdateTime(date);
		sysAccountRole.setCreator(user.getId());
		sysAccountRole.setUpdator(user.getId());
		sysAccountRole.setStatus(1);
		for(Long roleId: roleids){
			sysAccountRole.setRoleId(roleId);
			sysAccountRoleService.insertSelective(sysAccountRole);
			sysAccountRole.setId(null);
		}
	}

	
}