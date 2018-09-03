package com.rise.entity.common;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.rise.util.DateSerializer;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author xiaolong
 * @Date 2018/6/9 17:56
 * @Description
 */

public class RiseUser implements Serializable {


    private static final long serialVersionUID = -2885813230865445102L;
    private int id;
    private String userName;
    private String password;
    private int type;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    @JsonSerialize(using = DateSerializer.class)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }



    @Override
    public String toString() {
        return "RiseUser{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", type=" + type +
                ", createTime=" + createTime +
                '}';
    }
}
