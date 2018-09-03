package com.rise.entity.common;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.rise.util.DateSerializer;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author xiaolong
 * @Date 2018/6/11 20:35
 * @Description
 */
public class News implements Serializable {

    private static final long serialVersionUID = -4014398048916853145L;
    private int id;
    private int status;
    private int views;
    private String title;
    private String author;
    private String tag;
    private String content;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createTime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date uploadTime;


    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @JsonSerialize(using = DateSerializer.class)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @JsonSerialize(using = DateSerializer.class)
    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", status=" + status +
                ", views=" + views +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", tag='" + tag + '\'' +
                ", content='" + content + '\'' +
                ", createTime=" + createTime +
                ", uploadTime=" + uploadTime +
                '}';
    }
}
