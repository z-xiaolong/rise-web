package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.RiseArticle;
import com.rise.service.ArticleService;
import com.rise.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/5 17:48
 * @Description
 */
@Service("articleServiceImpl")
public class ArticleServiceImpl implements ArticleService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public List<RiseArticle> getArticleList(PageData pageData) {
        List<RiseArticle> list = new ArrayList<>();
        try {
            list = (List<RiseArticle>) dao.findForList("ArticleServiceMapper.getArticleList",pageData);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getArticleCount(PageData pageData) {
        try {
            return (int) dao.findForObject("ArticleServiceMapper.getArticleCount",pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
