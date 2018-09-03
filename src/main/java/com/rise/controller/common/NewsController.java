package com.rise.controller.common;

import com.rise.annotation.SystemLog;
import com.rise.controller.base.BaseController;
import com.rise.entity.common.News;
import com.rise.entity.common.NewsList;
import com.rise.service.NewsService;
import com.rise.util.FileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/6/11 20:33
 * @Description
 */
@Controller
@RequestMapping(value = "/api")
public class NewsController extends BaseController {

    @Resource(name = "newsServiceImpl")
    private NewsService newsServiceImpl;

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    @ResponseBody
    public Object getAllNewsList() {
        Map<String, Object> map = new HashMap<>();
        List<News> list = null;
        try {
            list = newsServiceImpl.getAllNewsList();
            map.put("status", "success");
            map.put("dataList", list);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", "error");
        }
        return map;
    }

    @RequestMapping(value = "/news/delete", method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(method = "删除新闻")
    public Object deleteNewsList(@RequestBody NewsList newsList) {
        Map<String, Object> map = new HashMap<>();
        List<News> list = newsList.getNews();
        System.out.println("+++++++++++++list: " + list);
        try {
            newsServiceImpl.deleteNewsList(list);
            map.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", "error");
        }
        return map;
    }

    @RequestMapping(value = "/news/upload", method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(method = "发布新闻")
    public Object uploadNewsList(@RequestBody NewsList newsList) {
        Map<String, Object> map = new HashMap<>();
        List<News> list = newsList.getNews();
        System.out.println("+++++++++++++list: " + list);
        try {
            newsServiceImpl.uploadNewsList(list);
            map.put("status", "success");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", "error");
        }
        return map;
    }


    @RequestMapping(value = "/news/edit", method = RequestMethod.GET)
    @ResponseBody
    @SystemLog(method = "编辑新闻")
    public Object editNews(int id) {
        Map<String, Object> map = new HashMap<>();
        if (id == -1 || id == 0) {
            map.put("status", "error");
            return map;
        }
        try {
            News news = newsServiceImpl.getNewsById(id);
            map.put("status", "success");
            map.put("news", news);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("status", "error");
        }
        return map;
    }

    @RequestMapping(value = "news/publish", method = RequestMethod.POST)
    @ResponseBody
    @SystemLog(method = "文章信息发布、保存")
    public Object publish(@RequestBody News news) {
        Map<String, Object> map = new HashMap<>();
        int id = news.getId();
        int status = news.getStatus();
        if (id == -1) {
            try {
                newsServiceImpl.addNews(news);
                map.put("status", "success");
            } catch (Exception e) {
                e.printStackTrace();
                map.put("status", "error");
            }
        } else {
            try {
                newsServiceImpl.updateNews(news);
                map.put("status", "success");
            } catch (Exception e) {
                e.printStackTrace();
                map.put("status", "error");
            }
        }
        return map;
    }

    @RequestMapping(value = "/upload/image", method = RequestMethod.POST)
    @ResponseBody
    //@SystemLog(method = "上传图片")
    public Object upload(MultipartFile file, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        System.out.println("fileName：" + file.getOriginalFilename());
        try {
            String path = FileUpload.uploadFile(file, request);
            System.out.println("Path: " + path);
            map.put("status", "success");
            map.put("path",path);
        } catch (IOException e) {
            e.printStackTrace();
            map.put("status", "error");
        }
        return map;
    }


}
