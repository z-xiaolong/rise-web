package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.ArticleType;
import com.rise.entity.common.RiseArticle;
import com.rise.entity.common.SubArticleType;
import com.rise.service.ArticleService;
import com.rise.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
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
        List<RiseArticle> list = null;
        try {
            list = (List<RiseArticle>) dao.findForList("ArticleServiceMapper.getArticleList", pageData);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getArticleCount(PageData pageData) {
        try {
            return (int) dao.findForObject("ArticleServiceMapper.getArticleCount", pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public String deleteArticle(int articleID) {
        try {
            dao.delete("ArticleServiceMapper.deleteArticle", articleID);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public String publishArticle(int articleID) {
        try {
            dao.update("ArticleServiceMapper.publishArticle",articleID);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public String cancelPublishArticle(int articleID) {
        try {
            dao.update("ArticleServiceMapper.cancelPublishArticle",articleID);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public List<ArticleType> getArticleTypeList() {
        List<ArticleType> list = new ArrayList<>();
        try {
            list = (List<ArticleType>) dao.findForList("ArticleServiceMapper.getArticleTypeList",null);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<SubArticleType> getSubArticleTypeList(int articleTypeID) {
        List<SubArticleType> list = new ArrayList<>();
        try {
            list = (List<SubArticleType>) dao.findForList("ArticleServiceMapper.getSubArticleTypeList",articleTypeID);
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String addArticle(RiseArticle riseArticle) {
        int typeID = Integer.parseInt(riseArticle.getType());
        int subTypeID = Integer.parseInt(riseArticle.getSubType());
        String type = getTypeById(typeID);
        String subType = getSubTypeById(subTypeID);
        riseArticle.setType(type);
        riseArticle.setSubType(subType);
        riseArticle.setStatus(0);
        riseArticle.setCreateTime(new Date());
        riseArticle.setTitleImage("");

        try {
            dao.insert("ArticleServiceMapper.addArticle",riseArticle);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public String getTypeById(int typeID) {
        try {
            return (String) dao.findForObject("ArticleServiceMapper.getTypeById",typeID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public String getSubTypeById(int subTypeID) {
        try {
            return (String) dao.findForObject("ArticleServiceMapper.getSubTypeById",subTypeID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public RiseArticle getArticleById(int articleID) {
        try {
            return (RiseArticle) dao.findForObject("ArticleServiceMapper.getArticleById", articleID);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int getArticleTypeId(int articleID) {
        try {
            return (int) dao.findForObject("ArticleServiceMapper.getArticleTypeId",articleID);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public int getArticleSubTypeId(int articleID) {
        try {
            return (int) dao.findForObject("ArticleServiceMapper.getArticleSubTypeId",articleID);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    @Override
    public String updateArticle(RiseArticle article) {
        try {
            int typeID = Integer.parseInt(article.getType());
            int subTypeID = Integer.parseInt(article.getSubType());
            String type = getTypeById(typeID);
            String subType = getSubTypeById(subTypeID);
            article.setType(type);
            article.setSubType(subType);
            System.out.println("update+++++++++"+article);
            dao.update("ArticleServiceMapper.updateArticle",article);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}
