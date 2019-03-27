package net.newglobe.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import net.newglobe.app.dao.read.SysRoleDao;
import net.newglobe.app.model.SysRole;
import net.newglobe.app.mybatis.BaseService;

@Service
public class SysRoleService extends BaseService<SysRole, SysRoleDao> {
	@Autowired
	private SysRoleDao sysRoleDao;
	
	@Cacheable(value="users")
	public List<SysRole> getAccountRoles(Long id) {
		return sysRoleDao.getAccountRoles(id);
	}
}