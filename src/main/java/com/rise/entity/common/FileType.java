package com.rise.entity.common;

/**
 * @Author xiaolong
 * @Date 2018/9/14 19:39
 * @Description
 */
public class FileType {
    private int id;
    private String type;
    private String typeName;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    @Override
    public String toString() {
        return "FileType{" +
                "id=" + id +
                ", typeName='" + typeName + '\'' +
                '}';
    }
}
