package net.newglobe.app.model;

import javax.persistence.Transient;

import net.newglobe.app.model.vo.BaseModel;

public class SettingsDict extends BaseModel {

	private Integer parentId;

	private String name;

	private String value;

	private Integer sort;
	
	private String description;
	
	private Integer dictType;
	
	private Integer readonly;
	@Transient
	private String parentName;

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value == null ? null : value.trim();
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public Integer getReadonly() {
		return readonly;
	}

	public void setReadonly(Integer readonly) {
		this.readonly = readonly;
	}

	public Integer getDictType() {
		return dictType;
	}

	public void setDictType(Integer dictType) {
		this.dictType = dictType;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

}