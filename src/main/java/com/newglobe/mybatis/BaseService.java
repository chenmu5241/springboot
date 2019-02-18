package com.newglobe.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newglobe.model.vo.BaseModel;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.entity.Example;

@Service
public abstract class BaseService<T extends BaseModel, D extends Mapper<T>> {
	@Autowired
	private D dao;
	
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


}
