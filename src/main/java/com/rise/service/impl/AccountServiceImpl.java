package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.RiseAdmin;
import com.rise.service.AccountService;
import com.rise.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/3 19:40
 * @Description
 */

@Service("accountServiceImpl")
public class AccountServiceImpl implements AccountService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public List<RiseAdmin> getAllAdmin(PageData pageData)  {
        List<RiseAdmin> riseAdmins = new ArrayList<>();
        try {
            riseAdmins =  (List<RiseAdmin>) dao.findForList("AccountServiceMapper.getAllAdmin",pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return riseAdmins;
    }

    @Override
    public int getAdminCount(PageData pageData) {
        int total = 0;
        try {
            total = (int) dao.findForObject("AccountServiceMapper.getAdminCount",pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
}
