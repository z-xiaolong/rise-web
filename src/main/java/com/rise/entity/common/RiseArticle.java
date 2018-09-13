package com.rise.entity.common;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.rise.util.DateSerializerPlus;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @Author xiaolong
 * @Date 2018/9/5 15:56
 * @Description
 */
public class RiseArticle implements Serializable {
    private static final long serialVersionUID = 7541480660751905047L;
    private int id;
    private int browseCounts;
    private int sliderFlag;
    private int status;
    private String title;
    private String type;
    private String subType;
    private String author;
    private String publisher;
    private String content;
    private String titleImage;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    private String publishTime;

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @JsonSerialize(using = DateSerializerPlus.class)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBrowseCounts() {
        return browseCounts;
    }

    public void setBrowseCounts(int browseCounts) {
        this.browseCounts = browseCounts;
    }

    public int getSliderFlag() {
        return sliderFlag;
    }

    public void setSliderFlag(int sliderFlag) {
        this.sliderFlag = sliderFlag;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getSubType() {
        return subType;
    }

    public void setSubType(String subType) {
        this.subType = subType;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitleImage() {
        return titleImage;
    }

    public void setTitleImage(String titleImage) {
        this.titleImage = titleImage;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    @Override
    public String toString() {
        return "RiseArticle{" +
                "id=" + id +
                ", browseCounts=" + browseCounts +
                ", sliderFlag=" + sliderFlag +
                ", status=" + status +
                ", title='" + title + '\'' +
                ", type='" + type + '\'' +
                ", subType='" + subType + '\'' +
                ", publisher='" + publisher + '\'' +
                ", content='" + content + '\'' +
                ", titleImage='" + titleImage + '\'' +
                ", publishTime=" + publishTime +
                '}';
    }
}
