package net.newglobe.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import net.newglobe.model.vo.BaseModel;

@JsonIgnoreProperties(ignoreUnknown = true)
public class TestModel extends BaseModel {
	
	protected static final long serialVersionUID = 517277680990142482L;

	private String username;
	
	private SysAccount sysAccount;


	public SysAccount getSysAccount() {
		return sysAccount;
	}

	public void setSysAccount(SysAccount sysAccount) {
		this.sysAccount = sysAccount;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}