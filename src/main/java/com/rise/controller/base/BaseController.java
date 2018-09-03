package com.rise.controller.base;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.rise.entity.Page;
import com.rise.util.Logger;
import com.rise.util.PageData;
import com.rise.util.UuidUtil;

public class BaseController {

    protected Logger logger = Logger.getLogger(this.getClass());

    private static final long serialVersionUID = 6357869213649815390L;


    /**
     * 得到PageData
     */
    public PageData getPageData() {
        return new PageData(this.getRequest());
    }

    /**
     * 得到ModelAndView
     */
    public ModelAndView getModelAndView() {
        return new ModelAndView();
    }

    /**
     * 得到request对象
     */
    public HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    /**
     * 得到32位的uuid
     *
     * @return
     */
    public String get32UUID() {
        return UuidUtil.get32UUID();
    }

    /**
     * 得到分页列表的信息
     */
    public Page getPage() {

        return new Page();
    }

    /**
     * 用于计算接口的响应时间（多线程时除外）
     *
     * @author zhouxiaolong
     */
    private static long startTime = 0;
    private static long endTime = 0;

    public static void logBefore(Logger logger, String interfaceName) {
        logger.info("");
        logger.info("++++++++++  start  ++++++++++");
        logger.info(interfaceName);
        startTime = System.currentTimeMillis();
    }

    public static void logAfter(Logger logger) {
        endTime = System.currentTimeMillis();
        logger.info("++++++++++   " + (endTime - startTime) + "毫秒   ++++++++++");
        logger.info("++++++++++   end   ++++++++++");
        logger.info("");

    }


}
