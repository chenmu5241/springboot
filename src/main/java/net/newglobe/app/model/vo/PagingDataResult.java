package net.newglobe.app.model.vo;

public class PagingDataResult<T> extends ListDataResult<T> {
    private static final long serialVersionUID = -2277202067450184358L;
    private Long total;
    private int pages;//总页数
    public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
    
}
