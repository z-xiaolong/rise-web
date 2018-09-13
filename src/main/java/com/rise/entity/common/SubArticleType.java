package com.rise.entity.common;

import java.io.Serializable;

/**
 * @Author xiaolong
 * @Date 2018/9/7 17:11
 * @Description
 */
public class SubArticleType implements Serializable {
    private static final long serialVersionUID = 6033862371694676604L;
    private int id;
    private String parentType;
    private String subType;
    private String subTypeName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParentType() {
        return parentType;
    }

    public void setParentType(String parentType) {
        this.parentType = parentType;
    }

    public String getSubType() {
        return subType;
    }

    public void setSubType(String subType) {
        this.subType = subType;
    }

    public String getSubTypeName() {
        return subTypeName;
    }

    public void setSubTypeName(String subTypeName) {
        this.subTypeName = subTypeName;
    }

    @Override
    public String toString() {
        return "SubArticleType{" +
                "id=" + id +
                ", parentType='" + parentType + '\'' +
                ", subType='" + subType + '\'' +
                ", subTypeName='" + subTypeName + '\'' +
                '}';
    }
}
