package net.newglobe.dao.read;

import java.util.List;

import net.newglobe.model.SysRole;
import net.newglobe.mybatis.BaseDao;
import net.newglobe.mybatis.MyBatisRepository;
@MyBatisRepository
public interface SysRoleDao extends BaseDao<SysRole>{
	List<SysRole> getAccountRoles(Long id);
}