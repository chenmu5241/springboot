package net.newglobe.model;

import net.newglobe.model.vo.BaseModel;

public class SysOauthAccount extends BaseModel {
	
	protected static final long serialVersionUID = 5172776809901424891L;

	private String oauthType;

    private String oauthUid;

    private Long accountId;
    
	public String getOauthType() {
		return oauthType;
	}


	public void setOauthType(String oauthType) {
		this.oauthType = oauthType;
	}


	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}


	public String getOauthUid() {
		return oauthUid;
	}


	public void setOauthUid(String oauthUid) {
		this.oauthUid = oauthUid;
	}

}