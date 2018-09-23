package com.rise.service;

import com.rise.entity.common.ArticleType;
import com.rise.entity.common.RiseArticle;
import com.rise.entity.common.SubArticleType;
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

    public String deleteArticle(int articleID);

    public String publishArticle(int articleID);

    public String cancelPublishArticle(int articleID);

    public List<ArticleType> getArticleTypeList();

    public List<SubArticleType> getSubArticleTypeList(int articleTypeID);

    public String addArticle(RiseArticle riseArticle);

    public String getTypeById(int typeID);

    public String getSubTypeById(int subTypeID);

    public RiseArticle getArticleById(int articleID);

    public int getArticleTypeId(int articleID);

    public int getArticleSubTypeId(int articleID);

    public String updateArticle(RiseArticle article);
}
