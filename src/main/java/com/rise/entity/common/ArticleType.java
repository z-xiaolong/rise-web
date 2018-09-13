package com.rise.entity.common;

import java.io.Serializable;

/**
 * @Author xiaolong
 * @Date 2018/9/7 17:10
 * @Description
 */
public class ArticleType implements Serializable {
    private static final long serialVersionUID = -2880334293890096818L;
    private int id;
    private String type;
    private String typeName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "ArticleType{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
