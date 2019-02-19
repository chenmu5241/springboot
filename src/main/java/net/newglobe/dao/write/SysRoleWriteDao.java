package net.newglobe.dao.write;

import net.newglobe.model.SysRole;
import net.newglobe.mybatis.BaseDao;
import net.newglobe.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysRoleWriteDao extends BaseDao<SysRole> {
	int update();
}