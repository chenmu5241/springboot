package com.newglobe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newglobe.dao.read.SysRoleReadDao;
import com.newglobe.dao.write.SysRoleWriteDao;
import com.newglobe.model.SysRole;
import com.newglobe.mybatis.BaseService;

@Service
public class SysRoleService extends BaseService<SysRole, SysRoleReadDao> {
	@Autowired
	private SysRoleReadDao readDao;
	@Autowired
	private SysRoleWriteDao writeDao;
	
	public List<SysRole> selectList(){
		return readDao.selectList();
	}
	
	public int update(){
		return writeDao.update();
	}

}