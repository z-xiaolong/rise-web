package com.rise.service;


import com.rise.entity.common.News;


import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/6/11 20:35
 * @Description
 */
public interface NewsService {

    public List<News> getAllNewsList() throws Exception;

    public void deleteNewsList(List<News> list) throws Exception;

    public void uploadNewsList(List<News> list) throws Exception;

    public void updateNews(News news) throws Exception;

    public News getNewsById(int id) throws Exception;

    public void addNews(News news) throws Exception;

}
