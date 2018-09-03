package com.rise.entity.common;

import java.io.Serializable;

/**
 * @Author xiaolong
 * @Date 2018/9/2 10:40
 * @Description
 */
public class Menu implements Serializable {
    private static final long serialVersionUID = -8183164448890403137L;
    private int id;
    private String name;
    private String icon;
    private String link;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", icon='" + icon + '\'' +
                ", link='" + link + '\'' +
                '}';
    }
}
