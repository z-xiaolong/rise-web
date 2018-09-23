package com.rise.service;

import com.rise.entity.common.FileType;
import com.rise.entity.common.RiseFile;
import com.rise.util.PageData;

import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/14 16:40
 * @Description
 */
public interface FileService {
    public List<RiseFile> getFileList(PageData pageData);

    public int getFileCount(PageData pageData);

    public List<FileType> getFileTypeList();

}
