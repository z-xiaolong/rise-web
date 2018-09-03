package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.News;
import com.rise.service.NewsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/6/11 21:28
 * @Description
 */
@Service("newsServiceImpl")
public class NewsServiceImpl implements NewsService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public List<News> getAllNewsList() throws Exception {
        List<News> list = new ArrayList<>();
        list = (List<News>) dao.findForList("NewsServiceMapper.getAllNewsList", null);
        return list;
    }

    @Override
    public void deleteNewsList(List<News> list) throws Exception {
        dao.batchDelete("NewsServiceMapper.deleteNewsList", list);
    }

    @Override
    public void uploadNewsList(List<News> list) throws Exception {
        dao.batchUpdate("NewsServiceMapper.uploadNewsStatus", list);
    }

    @Override
    public void updateNews(News news) throws Exception {
        dao.update("NewsServiceMapper.updateNews", news);
    }

    @Override
    public News getNewsById(int id) throws Exception {
        return (News) dao.findForObject("NewsServiceMapper.getNewsById",id);
    }

    @Override
    public void addNews(News news) throws Exception {
        dao.insert("NewsServiceMapper.addNews", news);
    }


}
