package net.newglobe.service;

import java.util.Date;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.newglobe.dao.read.SysAccountDao;
import net.newglobe.model.SysAccount;
import net.newglobe.model.SysAccountRole;
import net.newglobe.model.SysOauthAccount;
import net.newglobe.mybatis.BaseService;
import net.newglobe.util.Md5;
@Service
public class SysAccountService extends BaseService<SysAccount, SysAccountDao>{
	@Autowired
	SysAccountRoleService sysAccountRoleService;
	@Autowired
	private SysOauthAccountService sysOauthAccountService;
	
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

	@Transactional
	public void insertAccountAndOauth(SysAccount account, SysOauthAccount oauth) {
		Date date = new Date();
		account.setSalt(Md5.getSalt());
		account.setPassword(Md5.getMD5(account.getPassword(), account.getSalt()));
		account.setStatus(1);
		account.setCreateTime(date);
		account.setUpdateTime(date);
		this.insertSelective(account);
		
		SysOauthAccount existOauth = sysOauthAccountService.selectOne(oauth);
		if(existOauth != null){
			oauth.setAccountId(account.getId());
			oauth.setUpdateTime(date);
			oauth.setId(existOauth.getId());
			sysOauthAccountService.updateByIdSelective(oauth);
		}else{
			oauth.setAccountId(account.getId());
			oauth.setCreateTime(date);
			oauth.setUpdateTime(date);
			oauth.setStatus(1);
			sysOauthAccountService.insertSelective(oauth);
		}
	}
	
}