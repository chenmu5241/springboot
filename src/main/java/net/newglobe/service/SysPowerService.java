package net.newglobe.service;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.newglobe.dao.read.SysPowerDao;
import net.newglobe.model.SysAccount;
import net.newglobe.model.SysPower;
import net.newglobe.mybatis.BaseService;

@Service
public class SysPowerService extends BaseService<SysPower, SysPowerDao> {
	@Autowired
	private SysPowerDao sysPowerDao;

	public List<SysPower> getAccountPowers(Long id) {
		return sysPowerDao.getAccountPowers(id);
	}

	public List<SysPower> queryByRoleId(Long id) {
		return sysPowerDao.queryByRoleId(id);
	}

	public Long selectMaxIdChildren(SysPower t) {
		return sysPowerDao.selectMaxIdChildren(t);
	}
	
	@Cacheable(value="powers")
	public List<SysPower> selectTree(SysPower t){
		return sysPowerDao.queryTree(t);
	}
	
	@Cacheable(value="powers")
	public List<SysPower> selectRootTree(SysPower t) {
		return sysPowerDao.queryRootTree(t);
	}

	@Transactional
	public synchronized void insertNewPower(SysPower t) {
		SysAccount sysAccount = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		Long id = null;
		int layer = 1;
		Date date = new Date();
		SysPower parent = null;
		if (t.getParentId() != -1) {
			parent = this.selectById(t.getParentId());
			layer = parent.getLayer() + 1;
//			Long maxId = this.selectMaxIdChildren(t);
//			if (maxId == null) {// 没有子类
//				id = new Long(t.getParentId().toString() + "01");
//			} else {
//				id = maxId + 1;
//			}
		} else {
//			Long maxId = this.selectMaxIdChildren(t);
//			if (maxId == null) {// 没有子类
//				id = 10L;
//			} else {
//				id = maxId + 10;
//			}
		}
		t.setLayer(layer);
		t.setId(id);
		t.setUpdateTime(date);
		t.setCreateTime(date);
		t.setCreator(sysAccount.getId());
		t.setUpdator(sysAccount.getId());
		this.insertSelective(t);
		if(t.getLayer()==1){
			t.setLayerCode(t.getId().toString());
		}else{
			t.setLayerCode(parent.getLayerCode()+"_"+t.getId());
		}
		this.updateByIdSelective(t);//设置layercode
	}


}