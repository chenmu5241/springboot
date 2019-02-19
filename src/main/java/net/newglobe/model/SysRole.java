package net.newglobe.model;

import net.newglobe.model.vo.BaseModel;

public class SysRole extends BaseModel {
	
	protected static final long serialVersionUID = 5172776809901424894L;

	private String name;

	private String description;

	private Integer type;

	private Integer rolePredef;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}


	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getRolePredef() {
		return rolePredef;
	}

	public void setRolePredef(Integer rolePredef) {
		this.rolePredef = rolePredef;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}