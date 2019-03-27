package net.newglobe.app.model.vo;

import java.util.List;

public class ListDataResult<T> extends Result {
    private static final long serialVersionUID = -2387266379975586929L;
    
    protected List<T> data;//数据列表

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

}