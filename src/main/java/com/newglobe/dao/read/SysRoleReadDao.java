package com.newglobe.dao.read;

import java.util.List;

import com.newglobe.model.SysRole;
import com.newglobe.mybatis.BaseDao;
import com.newglobe.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysRoleReadDao extends BaseDao<SysRole> {
	List<SysRole> selectList();
}