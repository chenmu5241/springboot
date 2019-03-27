package net.newglobe.app.model.vo;

import java.io.Serializable;

public class Result implements Serializable {
	private static final long serialVersionUID = -4192087809568619922L;
	public Result() {
		super();
	}
	protected boolean success;//是否成功
	protected String code;//结果码
	protected String status;//结果状态
	protected String message;//消息
	protected String detail;//详情
	
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public boolean getSuccess() {
		return success;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
}