package net.newglobe.app.model.vo;

public class DataResult<T> extends Result {
	private static final long serialVersionUID = -2387266379975586929L;
	protected T data;

	public DataResult() {
		super();
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}