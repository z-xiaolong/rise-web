package com.rise.service;

import com.rise.entity.common.RiseArticle;
import com.rise.util.PageData;

import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/5 17:47
 * @Description
 */
public interface ArticleService {
    public List<RiseArticle> getArticleList(PageData pageData);

    public int getArticleCount(PageData pageData);
}
