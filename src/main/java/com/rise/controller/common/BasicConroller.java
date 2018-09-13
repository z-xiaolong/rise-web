package com.rise.controller.common;

import com.rise.controller.base.BaseController;
import com.rise.service.LogService;
import com.rise.util.PageData;
import com.rise.util.Uploader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        Map<String, Object> map = logServiceImpl.getAllLogs(pd);
        logAfter(logger);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/uploadImage")
    public Object editFileUpload(MultipartFile upfile, HttpServletRequest request) {
        Uploader up = new Uploader(request);
        up.setSavePath("uploadImage");
        String[] fileType = {".gif", ".png", ".jpg", ".jpeg", ".bmp"};
        up.setAllowFiles(fileType);
        up.setMaxSize(10000); //单位KB
        try {
            up.upload(upfile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String callback = request.getParameter("callback");

        String result = "{\"name\":\"" + up.getFileName() + "\", \"originalName\": \"" + up.getOriginalName() + "\", \"size\": " + up.getSize() + ", \"state\": \"" + up.getState() + "\", \"type\": \"" + up.getType() + "\", \"url\": \"" + up.getUrl() + "\"}";

        result = result.replaceAll("\\\\", "\\\\");

        if (callback == null) {
            return result;
        } else {
            return "<script>" + callback + "(" + result + ")</script>";
        }

    }

}
