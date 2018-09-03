package com.rise.filter;

/**
 * @Author xiaolong
 * @Date 2018/6/6 19:26
 */

import com.rise.controller.base.BaseController;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * 登录验证过滤器
 */
public class LoginFilter extends BaseController implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("++++++++++  登录过滤器初始化  ++++++++++");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        System.out.println("+++++  登录过滤  +++++");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpSession session = request.getSession();
        System.out.println("sessionID = " + session.getId());
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        System.out.println("++++++++++  登录过滤器销毁     ++++++++++");
    }
}
