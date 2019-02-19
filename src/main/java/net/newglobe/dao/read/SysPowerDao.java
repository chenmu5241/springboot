package net.newglobe.dao.read;

import java.util.List;

import net.newglobe.model.SysPower;
import net.newglobe.mybatis.BaseDao;
import net.newglobe.mybatis.MyBatisRepository;
@MyBatisRepository
public interface SysPowerDao extends BaseDao<SysPower>{
	List<SysPower> getAccountPowers(Long id);

	List<SysPower> queryByRoleId(Long id);

	Long selectMaxIdChildren(SysPower t);
	
	List<SysPower> queryTree(SysPower t);

	List<SysPower> queryRootTree(SysPower t);
}