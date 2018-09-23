package com.rise.entity.common;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.rise.util.DateSerializerPlus;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @Author xiaolong
 * @Date 2018/9/14 15:43
 * @Description
 */
public class RiseFile {
    private int id;
    private int downloadCounts;
    private int authority;  //权限
    private double size;  //文件大小
    private String fileName;
    private String fileType; //文件类别
    private String uploader;
    private String flag;  //文件标签
    private String extension;  //文件扩展名
    private String url;  //文件存储路径
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date uploadTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDownloadCounts() {
        return downloadCounts;
    }

    public void setDownloadCounts(int downloadCounts) {
        this.downloadCounts = downloadCounts;
    }

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileClass) {
        this.fileType = fileClass;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @JsonSerialize(using = DateSerializerPlus.class)
    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    @Override
    public String toString() {
        return "RiseFile{" +
                "id=" + id +
                ", downloadCounts=" + downloadCounts +
                ", authority=" + authority +
                ", size=" + size +
                ", fileName='" + fileName + '\'' +
                ", fileType='" + fileType + '\'' +
                ", uploader='" + uploader + '\'' +
                ", flag='" + flag + '\'' +
                ", extension='" + extension + '\'' +
                ", url='" + url + '\'' +
                ", uploadTime=" + uploadTime +
                '}';
    }
}
