package net.newglobe.model;

import net.newglobe.model.vo.BaseModel;

public class SysRolePower extends BaseModel{
	
	protected static final long serialVersionUID = 5172776809901424896L;
	
    private Long roleId;

    private Long powerId;

	public Long getRoleId() {
		return roleId;
	}

	public Long getPowerId() {
		return powerId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public void setPowerId(Long powerId) {
		this.powerId = powerId;
	}


}