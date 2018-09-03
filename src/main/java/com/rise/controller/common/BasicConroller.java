package com.rise.controller.common;

import com.rise.controller.base.BaseController;
import com.rise.service.LogService;
import com.rise.util.PageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/9/2 20:34
 * @Description
 */

@Controller
@RequestMapping(value = "")
public class BasicConroller extends BaseController {
    @Resource(name = "logServiceImpl")
    private LogService logServiceImpl;

    @ResponseBody
    @RequestMapping("/getAllLogs")
    public Object getAllLogs(HttpServletRequest request) throws Exception {

        logBefore(logger, "++++++++++ 获取操作日志 ++++++++++");

        PageData pd = new PageData(request);
        Map<String,Object> map = logServiceImpl.getAllLogs(pd);
        logAfter(logger);
        return map;
    }

}
