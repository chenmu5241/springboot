package net.newglobe.app.dao.read;

import java.util.List;

import net.newglobe.app.model.SysPower;
import net.newglobe.app.mybatis.BaseDao;
import net.newglobe.app.mybatis.MyBatisRepository;
@MyBatisRepository
public interface SysPowerDao extends BaseDao<SysPower>{
	List<SysPower> getAccountPowers(Long id);

	List<SysPower> queryByRoleId(Long id);

	Long selectMaxIdChildren(SysPower t);
	
	List<SysPower> queryTree(SysPower t);

	List<SysPower> queryRootTree(SysPower t);
}