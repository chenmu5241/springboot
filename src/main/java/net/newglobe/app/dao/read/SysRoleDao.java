package net.newglobe.app.dao.read;

import java.util.List;

import net.newglobe.app.model.SysRole;
import net.newglobe.app.mybatis.BaseDao;
import net.newglobe.app.mybatis.MyBatisRepository;
@MyBatisRepository
public interface SysRoleDao extends BaseDao<SysRole>{
	List<SysRole> getAccountRoles(Long id);
}