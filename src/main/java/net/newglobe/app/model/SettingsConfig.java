package net.newglobe.app.model;

import net.newglobe.app.model.vo.BaseModel;


public class SettingsConfig  extends BaseModel {

    private String keyName;

    private String keyValue;

    private String confType;

    private String rwValue;

    private String description;

    public String getKeyName() {
        return keyName;
    }

    public void setKeyName(String keyName) {
        this.keyName = keyName;
    }

    public String getKeyValue() {
        return keyValue;
    }

    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }

    public String getConfType() {
        return confType;
    }

    public void setConfType(String confType) {
        this.confType = confType;
    }

    public String getRwValue() {
        return rwValue;
    }

    public void setRwValue(String rwValue) {
        this.rwValue = rwValue;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}