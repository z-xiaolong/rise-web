package com.rise.controller.login;

import com.rise.annotation.SystemLog;
import com.rise.controller.base.BaseController;
import com.rise.controller.base.InterfaceResult;
import com.rise.entity.common.Menu;
import com.rise.entity.common.RiseAdmin;
import com.rise.entity.common.RiseTeacher;
import com.rise.service.AdminService;
import com.rise.service.BasicService;
import com.rise.util.MD5;
import com.rise.util.PageData;
import com.rise.util.SessionManage;
import com.rise.util.UuidUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "")
public class LoginController extends BaseController {
    @Resource(name = "adminServiceImpl")
    private AdminService adminServiceImpl;
    @Resource(name = "basicServiceImpl")
    private BasicService basicServiceImpl;

    @RequestMapping(value = "/tologin")
    public ModelAndView tologin() throws Exception {
        logBefore(logger, "++++++++++ welcomeToShare-Login ++++++++++");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("common/login");
        mv.addObject("pd", pd);
        logAfter(logger);
        return mv;
    }

    @RequestMapping(value = "login")
    @SystemLog(method = "登录系统")
    public ModelAndView login(@RequestParam(required = false) String account,
                              @RequestParam(required = false) String password,
                              @RequestParam(required = false) String type,
                              HttpServletRequest request) throws Exception {
        logBefore(logger, "++++++++++ 管理员登录 ++++++++++account=" + account);

        //在session中加入参数
        HttpSession session = request.getSession();
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("common/login");

        //处理已经进入首页后刷新  当前 地址栏
        if (account == null || account == "") {
            logger.info("++++++++++ 用户名为空,即在首页地址栏刷新 ++++++++++");
            if (session.getAttribute("user") == null) {
                return mv;
            } else {
                mv.setViewName("common/main");
                return mv;
            }
        }

        //管理员登录
        if ("1".equals(type)) {
            RiseAdmin user = adminServiceImpl.getRiseAdmin(account);
            System.out.println(user);
            if (user == null || !user.getPassword().equals(MD5.md5(password))) {
                mv.addObject("Msg", "用户名或密码错误！");
                return mv;
            }
            mv.setViewName("common/main");
            List<Menu> menus = basicServiceImpl.getMenuList("1");
            session.setAttribute("Menus", menus);
            user.setPassword("***");
            session.setAttribute("user", user);
            session.setAttribute("account", account);
            session.setAttribute("type", user.getType());
            SessionManage.addSession(user.getType(), account, session);
            SessionManage.printMap();
            return mv;
        }
        //教师登录
        if ("2".equals(type)) {
            RiseTeacher user = adminServiceImpl.getRiseTeacher(account);
            System.out.println(user);
            if (user == null) {
                mv.addObject("Msg", "用户名或密码错误！");
                return mv;
            }
        }
        //学生登录
        if ("3".equals(type)) {

        }

        return mv;
    }

    @RequestMapping(value = "/toWelcomePage")
    public ModelAndView toWelcomePage() throws Exception {
        logBefore(logger, "++++++++++ 欢迎来到后台主页 ++++++++++");
        ModelAndView mv = this.getModelAndView();
        //PageData pd = new PageData();
        //pd = this.getPageData();
        mv.setViewName("common/welcome");
        // mv.addObject("pd", pd);
        logAfter(logger);
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/logout")
    public Object hrsscLoginOut(HttpServletRequest request) {
        logBefore(logger, "++++++++++ 退出登录 ++++++++++");
        Map<String, Object> data = new HashMap<String, Object>();
        try {
            //清空session
            HttpSession session = request.getSession();
            String type = (String) session.getAttribute("type");
            String account = (String) session.getAttribute("account");
            System.out.println("+++++++++++++++++++++session" + session);
            SessionManage.printMap();
            SessionManage.removeSession(type, account);
            SessionManage.printMap();
        } catch (Exception e) {
            e.printStackTrace();
            return InterfaceResult.returnFailure();
        }
        logAfter(logger);
        return InterfaceResult.returnSuccess(data);
    }

    @ResponseBody
    @RequestMapping(value = "/changePassword")
    @SystemLog(method = "修改密码")
    public Object hrsscChangePassword(@RequestParam(required = true) String oldPassword,
                                      @RequestParam(required = true) String newPassword,
                                      HttpServletRequest request) {
        logBefore(logger, "++++++++++ 管理员修改自己的密码 ++++++++++");
        Map<String, Object> data = new HashMap<String, Object>();
        try {
            RiseAdmin user = (RiseAdmin) request.getSession().getAttribute("user");

            user.setPassword(MD5.md5(newPassword));

            RiseAdmin riseAdmin = adminServiceImpl.getRiseAdmin(user.getAccount());
            if (null != riseAdmin && !riseAdmin.getPassword().equals(MD5.md5(oldPassword))) {
                return InterfaceResult.returnResult(3, "原始密码错误", data);
            }

            adminServiceImpl.updateAdminPassword(user);
        } catch (Exception e) {
            e.printStackTrace();
            return InterfaceResult.returnFailure();
        }
        logAfter(logger);
        return InterfaceResult.returnSuccess(data);
    }

}
