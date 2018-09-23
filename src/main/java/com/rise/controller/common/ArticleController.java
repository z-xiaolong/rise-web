package com.rise.controller.common;

import com.rise.annotation.SystemLog;
import com.rise.entity.common.ArticleType;
import com.rise.entity.common.RiseAdmin;
import com.rise.entity.common.RiseArticle;
import com.rise.entity.common.SubArticleType;
import com.rise.service.ArticleService;
import com.rise.util.PageData;
import com.rise.util.Uploader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/9/5 17:46
 * @Description
 */
@Controller
@RequestMapping(value = "articleManage")
public class ArticleController extends BasicConroller {
    @Resource(name = "articleServiceImpl")
    private ArticleService articleServiceImpl;

    @RequestMapping(value = "/toArticleManagePage")
    public ModelAndView toArticleManagePage(HttpServletRequest request) {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("common/articleManage");
        return mv;
    }

    @RequestMapping(value = "/toAddArticlePage")
    public ModelAndView toAddArticlePage(HttpServletRequest request) {
        ModelAndView mv = this.getModelAndView();
        List<ArticleType> articleTypes = articleServiceImpl.getArticleTypeList();
        mv.setViewName("common/addArticle");
        mv.addObject("articleTypes", articleTypes);
        return mv;
    }

    @RequestMapping(value = "/toEditArticlePage", method = RequestMethod.GET)
    public ModelAndView toEditArticlePage(int articleID, HttpServletRequest request) {
        System.out.println("+++++++++++++++++articleID:"+articleID);
        ModelAndView mv = this.getModelAndView();
        List<ArticleType> articleTypes = articleServiceImpl.getArticleTypeList();
        RiseArticle article = articleServiceImpl.getArticleById(articleID);
        int typeID = articleServiceImpl.getArticleTypeId(articleID);
        int subTypeID = articleServiceImpl.getArticleSubTypeId(articleID);
        List<SubArticleType> subTypes = articleServiceImpl.getSubArticleTypeList(typeID);
        mv.setViewName("common/editArticle");
        mv.addObject("articleTypes", articleTypes);
        mv.addObject("article",article);
        mv.addObject("typeID",typeID);
        mv.addObject("subTypeID",subTypeID);
        mv.addObject("subTypes",subTypes);
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/getArticleList")
    public Object getArticleList() {
        PageData pd = this.getPageData();
        Map<String, Object> map = new HashMap<String, Object>();
        pd.put("start", Integer.parseInt(pd.get("start").toString()));//dataTable的分页参数
        pd.put("length", Integer.parseInt(pd.get("length").toString()));//dataTable的分页参数
        List<RiseArticle> riseArticles = articleServiceImpl.getArticleList(pd);
        int recordsTotal = articleServiceImpl.getArticleCount(pd);
        map.put("data", riseArticles);
        map.put("status", 1);
        map.put("recordsTotal", recordsTotal);   //dataTable分页需要
        map.put("recordsFiltered", recordsTotal);//dataTable分页需要
        map.put("draw", pd.get("draw").toString());//dataTable分页需要
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteArticle")
    @SystemLog(method = "删除新闻")
    public Object deleteArticle(int articleID) {
        Map<String, Object> map = new HashMap<>();
        String msg = articleServiceImpl.deleteArticle(articleID);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/publishArticle")
    @SystemLog(method = "发布新闻")
    public Object publishArticle(int articleID) {
        Map<String, Object> map = new HashMap<>();
        String msg = articleServiceImpl.publishArticle(articleID);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/cancelPublishArticle")
    @SystemLog(method = "取消发布新闻")
    public Object cancelPublishArticle(int articleID) {
        Map<String, Object> map = new HashMap<>();
        String msg = articleServiceImpl.cancelPublishArticle(articleID);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/getSubArticleTypeList")
    public Object getSubArticleTypeList(int articleTypeID) {
        Map<String, Object> map = new HashMap<>();
        List<SubArticleType> list = articleServiceImpl.getSubArticleTypeList(articleTypeID);
        map.put("data", list);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/addArticle")
    @SystemLog(method = "添加新闻")
    public Object addArticle(RiseArticle article, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        HttpSession session = request.getSession();
        RiseAdmin user = (RiseAdmin) session.getAttribute("user");
        article.setPublisher(user.getUserName());
        article.setAuthor(user.getUserName());
        String msg = articleServiceImpl.addArticle(article);
        System.out.println(article);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/editArticle")
    @SystemLog(method = "编辑新闻")
    public Object editArticle(RiseArticle article, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        String msg = articleServiceImpl.updateArticle(article);
        map.put("Msg", msg);
        return map;
    }


}
