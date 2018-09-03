package com.rise.controller.common;

import com.rise.entity.common.RiseAdmin;
import com.rise.service.AccountService;
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
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("common/accountManage");
        pd.put("parentId", 1);
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
}
