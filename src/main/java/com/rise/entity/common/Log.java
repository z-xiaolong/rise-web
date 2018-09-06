package com.rise.entity.common;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.rise.util.DateSerializerPlus;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author xiaolong
 * @Date 2018/6/14 10:55
 * @Description
 */
public class Log implements Serializable {
    private static final long serialVersionUID = -3691353350301065565L;
    private int id;
    private int status;  //1代表成功，0代表失败
    private String ip;
    private String account;
    private String userName;
    private String description;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date operationTime;
    private String responseTime;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String desc) {
        this.description = desc;
    }

    public String getResponseTime() {
        return responseTime;
    }

    public void setResponseTime(String responseTime) {
        this.responseTime = responseTime;
    }

    @JsonSerialize(using = DateSerializerPlus.class)
    public Date getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(Date operationTime) {
        this.operationTime = operationTime;
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", status=" + status +
                ", ip='" + ip + '\'' +
                ", account='" + account + '\'' +
                ", userName='" + userName + '\'' +
                ", description='" + description + '\'' +
                ", operationTime=" + operationTime +
                ", responseTime='" + responseTime + '\'' +
                '}';
    }
}
