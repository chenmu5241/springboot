package net.newglobe.app.model;

import net.newglobe.app.model.vo.BaseModel;

public class SysAccountRole extends BaseModel{
	
	protected static final long serialVersionUID = 5172776809901424893L;
	
    private Long roleId;

    private Long accountId;


	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

}