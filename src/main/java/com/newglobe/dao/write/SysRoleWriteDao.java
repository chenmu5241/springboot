package com.newglobe.dao.write;

import com.newglobe.model.SysRole;
import com.newglobe.mybatis.BaseDao;
import com.newglobe.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysRoleWriteDao extends BaseDao<SysRole> {
	int update();
}