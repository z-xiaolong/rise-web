package com.rise.filter;

/**
 * @Author xiaolong
 * @Date 2018/6/6 19:26
 */

import com.rise.controller.base.BaseController;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


/**
 * 登录验证过滤器
 */
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("++++++++++  登录过滤器初始化  ++++++++++");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();
        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
        System.out.println("filterPath: " + path);
        // 从session里取用户账户信息
        String account = (String) session.getAttribute("account");
        System.out.println(account);
        // 登陆页面无需过滤
        if (path.indexOf("login") > -1 || path.indexOf("logout") > -1 || path.indexOf("static") > -1 || path.indexOf("uploadImage") > -1) {
            chain.doFilter(servletRequest, servletResponse);
            return;
        }
        // 判断如果没有取到员工信息,就跳转到登陆页面
        if (account == null || "".equals(account)) {
            // 跳转到登陆页面
            servletResponse.sendRedirect("/login");
        } else {
            // 已经登陆,继续此次请求
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        System.out.println("++++++++++  登录过滤器销毁     ++++++++++");
    }
}
