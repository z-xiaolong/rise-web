package com.rise.controller.common;

import com.rise.annotation.SystemLog;
import com.rise.entity.common.RiseAdmin;
import com.rise.service.AccountService;
import com.rise.util.MD5;
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
 * @Date 2018/9/3 13:01
 * @Description
 */

@Controller
@RequestMapping(value = "accountManage")
public class AccountController extends BasicConroller {
    @Resource(name = "accountServiceImpl")
    private AccountService accountServiceImpl;

    @RequestMapping(value = "/toAccountManagePage")
    public ModelAndView toBannerPage(HttpServletRequest request) {
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("common/accountManage");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/getAdminList")
    public Object getAdminList() {
        PageData pd = this.getPageData();
        Map<String, Object> map = new HashMap<String, Object>();
        pd.put("start", Integer.parseInt(pd.get("start").toString()));//dataTable的分页参数
        pd.put("length", Integer.parseInt(pd.get("length").toString()));//dataTable的分页参数
        List<RiseAdmin> riseAdmins = accountServiceImpl.getAllAdmin(pd);
        int recordsTotal = accountServiceImpl.getAdminCount(pd);

        map.put("data", riseAdmins);
        map.put("status", 1);
        map.put("recordsTotal", recordsTotal);   //dataTable分页需要
        map.put("recordsFiltered", recordsTotal);//dataTable分页需要
        map.put("draw", pd.get("draw").toString());//dataTable分页需要
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/addAdmin")
    @SystemLog(method = "增加管理员")
    public Object addAdmin(RiseAdmin riseAdmin) {
        Map<String, Object> map = new HashMap<>();
        riseAdmin.setPassword(MD5.md5(riseAdmin.getAccount()));//初始化密码为account
        riseAdmin.setStatus(1);//初始化状态
        System.out.println(riseAdmin);
        String msg = accountServiceImpl.addAdmin(riseAdmin);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/deleteAdmin")
    @SystemLog(method = "删除管理员")
    public Object deleteAdmin(int adminID) {
        Map<String, Object> map = new HashMap<>();
        System.out.println("+++++++++++++adminID:" + adminID);
        String msg = accountServiceImpl.deleteAdmin(adminID);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/disableAdmin")
    @SystemLog(method = "停用管理员账号")
    public Object disableAdmin(int adminID) {
        Map<String, Object> map = new HashMap<>();
        System.out.println("+++++++++++++adminID:" + adminID);
        String msg = accountServiceImpl.disableAdmin(adminID);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/enabledAdmin")
    @SystemLog(method = "启用管理员账号")
    public Object enabledAdmin(int adminID) {
        Map<String, Object> map = new HashMap<>();
        System.out.println("+++++++++++++adminID:" + adminID);
        String msg = accountServiceImpl.enabledAdmin(adminID);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/getAdminById")
    public Object getAdminById(int adminID) {
        Map<String, Object> map = new HashMap<>();
        System.out.println("+++++++++++++adminID:" + adminID);
        RiseAdmin admin = accountServiceImpl.getAdminById(adminID);
        if (admin == null) {
            map.put("admin", "null");
            return map;
        }
        map.put("admin", admin);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/updateAdminById")
    @SystemLog(method = "修改管理员信息" +
            "")
    public Object updateAdminById(RiseAdmin riseAdmin) {
        Map<String, Object> map = new HashMap<>();
        System.out.println("+++++++++++++admin:" + riseAdmin);
        String msg = accountServiceImpl.updateAdminById(riseAdmin);
        map.put("Msg", msg);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/resetAdminPassword")
    @SystemLog(method = "重置管理员密码")
    public Object resetAdminPassword(int adminID) {
        Map<String, Object> map = new HashMap<>();
        System.out.println("+++++++++++++admin:" + adminID);
        String msg = accountServiceImpl.resetAdminPassword(adminID);
        map.put("Msg", msg);
        return map;
    }

}
