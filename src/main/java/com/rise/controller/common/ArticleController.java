package com.rise.controller.common;

import com.rise.entity.common.RiseAdmin;
import com.rise.entity.common.RiseArticle;
import com.rise.service.ArticleService;
import com.rise.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView toBannerPage(HttpServletRequest request) {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("common/articleManage");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/getArticleList")
    public Object getAdminList() {
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
}
