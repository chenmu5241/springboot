package net.newglobe.mybatis;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import net.newglobe.model.SysAccount;
import net.newglobe.model.vo.BaseModel;
import net.newglobe.model.vo.PageVo;
import net.newglobe.model.vo.PagingDataResult;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

@Service
public abstract class BaseService<T extends BaseModel, D extends Mapper<T>> {
	@Autowired
	private D dao;
	
	// 根据实体类分页查询
	public PagingDataResult<T> selectList(T t, PageVo pageVo) throws Exception {
		PagingDataResult<T> result = new PagingDataResult<T>();
		// 自动设置分页和排序
		Page<T> pageResult = this.setPageHelp(pageVo);
		List<T> list = dao.select(t);
		result.setData(list);
		if(pageResult != null){
			result.setTotal(pageResult.getTotal());
			result.setPages(pageResult.getPages());
		}
		return result;
	}
	// 复杂条件的分页查询
	public PagingDataResult<T> selectListByExample(PageVo pageVo, Example example) throws Exception {
		PagingDataResult<T> result = new PagingDataResult<T>();
		// 自动设置分页和排序sql
		Page<T> pageResult = this.setPageHelp(pageVo);
		// 单表复杂条件查询方法
		/* Example example = new Example(t.getClass());
			example.createCriteria().andLike("name", "%测试2%")
												.andBetween("id", 1,5)
												.andCondition(" 1=1 or 2=2 ");
		查询name like 测试2并且id介于1-5，并且1=1或者2=2的数据*/
		List<T> list = dao.selectByExample(example);
		result.setData(list);
		if(pageResult != null){
			result.setTotal(pageResult.getTotal());
			result.setPages(pageResult.getPages());
		}
		return result;
	}
	//根据id查询
	public T selectById(Long id){
		return dao.selectByPrimaryKey(id);
	}

	// 根据实体查数据总数
	public Long selectCount(T t) {
		return (long) dao.selectCount(t);
	}

	// 根据条件查数据总数
	public Long selectCountByExample(Example example) {
		return (long) dao.selectCountByExample(example);
	}
	//根据条件查数据
	public List<T> selectListByExample(Example example) {
		return dao.selectByExample(example);
	}

	// 查询单个数据
	public T selectOne(T t) {
		return dao.selectOne(t);
	}
	//根据实体查询list
	public List<T> selectList(T t) {
		return dao.select(t);
	}

	// 查询全部
	public List<T> selectAll() {
		return dao.selectAll();
	}

	// 根据id修改所有字段
	public int updateById(T t) {
		return dao.updateByPrimaryKey(t);
	}

	// 根据id修改不为空字段
	public int updateByIdSelective(T t) {
		return dao.updateByPrimaryKeySelective(t);
	}

	// 根据条件修改
	public int updateByExample(T t, Example example) {
		return dao.updateByExample(t, example);
	}

	// 根据条件修改所有属性非空列
	public int updateByExampleSelective(T t, Example example) {
		return dao.updateByExampleSelective(t, example);
	}

	// 根据实体不为空字段删除
	public int delete(T t) {
		return dao.delete(t);
	}

	// 根据id删除
	public int deleteByIds(Class<T> clazz, String ids) throws Exception {
		SysAccount sysAccount = (SysAccount) SecurityUtils.getSubject().getPrincipal();
		T t = clazz.newInstance();
		t.setUpdateTime(new Date());
		t.setUpdator(sysAccount.getId());
		t.setStatus(0);
		Example example = new Example(clazz);
		example.createCriteria().andCondition("id in (" + ids + ")");
		return dao.updateByExampleSelective(t, example);
	}

	// 根据id删除
	public int deleteById(T t) {
		return dao.deleteByPrimaryKey(t);
	}

	// 根据example条件删除
	public int deleteByExample(Example example) {
		return dao.deleteByExample(example);
	}

	// 新增
	public int insert(T t) {
		return dao.insert(t);
	}

	// 根据条件新增
	public int insertSelective(T t) {
		return dao.insertSelective(t);
	}

	// 根据example条件判断是否存在该数据
	public boolean existsByExample(Example example) {
		return dao.existsWithPrimaryKey(example);
	}

	// 设置分页和排序
	@SuppressWarnings("unchecked")
	public Page<T> setPageHelp(PageVo vo) {
		Page<T> pageResult = null;
		// 排序设置
		String orderByStr = "";
		if (vo.getSortName() != null && vo.getSortOrder() != null && !"".equals(vo.getSortName()) && !"".equals(vo.getSortOrder())) {
			orderByStr = vo.getSortName() + " " + vo.getSortOrder();
		}
		// 分页设置
		if(vo.getPageNumber() != null &&  vo.getPageSize() != null){
			pageResult = PageHelper.startPage(vo.getPageNumber(), vo.getPageSize());
		}
		PageHelper.orderBy(orderByStr);
		return pageResult;
	}

}
