package com.rise.entity.common;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/6/13 16:27
 * @Description
 */
public class NewsList implements Serializable {
    private static final long serialVersionUID = -7457730961438816574L;
    private List<News> news = new ArrayList<>();

    public List<News> getNews() {
        return news;
    }

    public void setNews(List<News> news) {
        this.news = news;
    }

    @Override
    public String toString() {
        return "NewsList{" +
                "news=" + news +
                '}';
    }
}
