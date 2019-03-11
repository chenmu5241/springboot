package net.newglobe.model;

import java.util.List;

import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;

import net.newglobe.model.vo.BaseModel;

public class SysPower extends BaseModel{

	private String name;

    private String flag;

    private Integer sort;

    private Integer layer;
    
    private String  layerCode;
    
    private String url;

    private Integer type;

    private Long parentId;

    private Integer isShow;
    
    private String icon;
    
    @Transient
    private List<SysPower> children;
    @Transient
    private Long accountId;


    public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag == null ? null : flag.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getLayer() {
        return layer;
    }

    public void setLayer(Integer layer) {
        this.layer = layer;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

	public Integer getIsShow() {
		return isShow;
	}

	public void setIsShow(Integer isShow) {
		this.isShow = isShow;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public List<SysPower> getChildren() {
		return children;
	}

	public void setChildren(List<SysPower> children) {
		this.children = children;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getLayerCode() {
		return layerCode;
	}

	public void setLayerCode(String layerCode) {
		this.layerCode = layerCode;
	}

}