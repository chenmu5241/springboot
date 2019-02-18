package com.newglobe.model.vo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class BaseModel implements Serializable {
	protected static final long serialVersionUID = 5172776809901424898L;
	@Id
	@GeneratedValue(generator = "JDBC")
    private Long id;
	protected Long creator;//记录创建人
	@Column(name="create_time")
	protected Date createTime;//记录创建时间
	protected Long updator;//记录更新人
	@Column(name="update_time")
	protected Date updateTime;//记录更新时间
	protected Integer status;//记录状态.1，正常，0删除
	protected String ext1;//扩展字段1
	protected String ext2;//扩展字段2
	protected String ext3;//扩展字段3
	
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getExt1() {
		return ext1;
	}
	public void setExt1(String ext1) {
		this.ext1 = ext1;
	}
	public String getExt2() {
		return ext2;
	}
	public void setExt2(String ext2) {
		this.ext2 = ext2;
	}
	public String getExt3() {
		return ext3;
	}
	public void setExt3(String ext3) {
		this.ext3 = ext3;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getCreator() {
		return creator;
	}
	public Long getUpdator() {
		return updator;
	}
	public void setCreator(Long creator) {
		this.creator = creator;
	}
	public void setUpdator(Long updator) {
		this.updator = updator;
	}

}
