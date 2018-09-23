package com.rise.controller.common;

import com.rise.entity.common.FileType;
import com.rise.entity.common.RiseArticle;
import com.rise.entity.common.RiseFile;
import com.rise.service.FileService;
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
 * @Date 2018/9/14 16:39
 * @Description
 */

@Controller
@RequestMapping(value = "fileManage")
public class FileController extends BasicConroller {
    @Resource(name = "fileServiceImpl")
    private FileService fileServiceImpl;

    @RequestMapping(value = "/toFileManagePage")
    public ModelAndView toArticleManagePage(HttpServletRequest request) {
        ModelAndView mv = this.getModelAndView();
        List<FileType> fileTypes = fileServiceImpl.getFileTypeList();
        mv.addObject("fileTypes",fileTypes);
        mv.setViewName("common/fileManage");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/getFileList")
    public Object getFileList() {
        PageData pd = this.getPageData();
        Map<String, Object> map = new HashMap<String, Object>();
        pd.put("start", Integer.parseInt(pd.get("start").toString()));//dataTable的分页参数
        pd.put("length", Integer.parseInt(pd.get("length").toString()));//dataTable的分页参数
        List<RiseFile> riseFiles = fileServiceImpl.getFileList(pd);
        int recordsTotal = fileServiceImpl.getFileCount(pd);
        map.put("data", riseFiles);
        map.put("status", 1);
        map.put("recordsTotal", recordsTotal);   //dataTable分页需要
        map.put("recordsFiltered", recordsTotal);//dataTable分页需要
        map.put("draw", pd.get("draw").toString());//dataTable分页需要
        return map;
    }
}
