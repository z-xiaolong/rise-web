package com.rise.entity.common;

import java.io.Serializable;

/**
 * @Author xiaolong
 * @Date 2018/6/14 15:07
 * @Description
 */
public class Total implements Serializable {
    private static final long serialVersionUID = -1393720642219083658L;
    private int news;  //新闻数量
    private int admin; //管理员数量
    private int account; //用户账户数量
    private int picture; //头图数量

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getNews() {
        return news;
    }

    public void setNews(int news) {
        this.news = news;
    }

    public int getAdmin() {
        return admin;
    }

    public void setAdmin(int admin) {
        this.admin = admin;
    }

    public int getAccount() {
        return account;
    }

    public void setAccount(int account) {
        this.account = account;
    }

    public int getPicture() {
        return picture;
    }

    public void setPicture(int picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "Total{" +
                "news=" + news +
                ", admin=" + admin +
                ", account=" + account +
                ", picture=" + picture +
                '}';
    }
}
