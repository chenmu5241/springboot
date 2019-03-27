package net.newglobe.app.model.vo;

public class PageVo {
	
	private Integer pageNumber;
	private Integer pageSize;
	private String sortName;
	private String sortOrder;
	
	public Integer getPageNumber() {
		return pageNumber;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public String getSortName() {
		return sortName;
	}
	public String getSortOrder() {
		return sortOrder;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

}
