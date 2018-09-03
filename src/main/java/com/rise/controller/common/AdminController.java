package com.rise.controller.common;

import com.rise.controller.base.BaseController;
import com.rise.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * @Author xiaolong
 * @Date 2018/6/9 22:04
 * @Description
 */
@Controller
@RequestMapping(value = "/api")
public class AdminController extends BaseController {
    @Resource(name = "adminServiceImpl")
    private AdminService adminServiceImpl;


}
