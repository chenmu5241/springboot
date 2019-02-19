package net.newglobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.newglobe.dao.read.SysRoleDao;
import net.newglobe.model.SysRole;
import net.newglobe.mybatis.BaseService;

@Service
public class SysRoleService extends BaseService<SysRole, SysRoleDao> {
	@Autowired
	private SysRoleDao sysRoleDao;

	public List<SysRole> getAccountRoles(Long id) {
		return sysRoleDao.getAccountRoles(id);
	}
}