package com.newglobe.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newglobe.dao.SysRoleDao;
import com.newglobe.model.SysRole;
import com.newglobe.service.SysRoleService;

@Service
public class SysRoleServiceImpl implements SysRoleService {
	
	@Autowired
	private SysRoleDao dao;

	@Override
	public List<SysRole> selectList() {
		return dao.selectList();
	}

}
