package net.newglobe.app.dao.write;

import net.newglobe.app.model.SysRole;
import net.newglobe.app.mybatis.BaseDao;
import net.newglobe.app.mybatis.MyBatisRepository;

@MyBatisRepository
public interface SysRoleWriteDao extends BaseDao<SysRole> {
	int update();
}