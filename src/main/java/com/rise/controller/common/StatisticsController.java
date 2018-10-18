package com.rise.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author xiaolong
 * @Date 2018/9/23 20:27
 * @Description
 */

@Controller
@RequestMapping(value = "statisticsManage")
public class StatisticsController extends BasicConroller{

    @RequestMapping(value = "/toStatisticsManagePage")
    public ModelAndView toStatisticsManagePage(HttpServletRequest request) {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("common/statisticsManage");
        return mv;
    }
}
