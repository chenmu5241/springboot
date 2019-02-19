package net.newglobe.model;

import java.util.List;

import javax.persistence.Transient;

import net.newglobe.model.vo.BaseModel;

public class SysAccount extends BaseModel {
	
	protected static final long serialVersionUID = 5172776809901424891L;

	private String username;

    private String password;

    private String salt;

    private String loginIp;
    
    @Transient
    private boolean isRoot;//是否为超级管理员
    @Transient//瞬时的，不作为数据库字段
    private List<SysPower> powers;//所有权限
    @Transient//瞬时的，不作为数据库字段
    private List<SysRole> roles;//菜单权限
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp == null ? null : loginIp.trim();
    }

	public List<SysPower> getPowers() {
		return powers;
	}

	public void setPowers(List<SysPower> powers) {
		this.powers = powers;
	}

	public List<SysRole> getRoles() {
		return roles;
	}

	public void setRoles(List<SysRole> roles) {
		this.roles = roles;
	}

	public boolean isRoot() {
		return isRoot;
	}

	public void setRoot(boolean isRoot) {
		this.isRoot = isRoot;
	}

}