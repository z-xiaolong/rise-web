package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.FileType;
import com.rise.entity.common.RiseFile;
import com.rise.service.FileService;
import com.rise.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/14 16:41
 * @Description
 */

@Service("fileServiceImpl")
public class FileServiceImpl implements FileService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public List<RiseFile> getFileList(PageData pageData) {
        try {
            List<RiseFile> list = (List<RiseFile>) dao.findForList("FileServiceMapper.getFileList",pageData);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getFileCount(PageData pageData) {
        try {
            return (int) dao.findForObject("FileServiceMapper.getFileCount",pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<FileType> getFileTypeList() {
        try {
            return (List<FileType>) dao.findForList("FileServiceMapper.getFileTypeList",null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
