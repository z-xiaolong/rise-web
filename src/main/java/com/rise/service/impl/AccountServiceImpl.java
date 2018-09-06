package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.RiseAdmin;
import com.rise.service.AccountService;
import com.rise.util.MD5;
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
    public List<RiseAdmin> getAllAdmin(PageData pageData) {
        List<RiseAdmin> riseAdmins = new ArrayList<>();
        try {
            riseAdmins = (List<RiseAdmin>) dao.findForList("AccountServiceMapper.getAllAdmin", pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return riseAdmins;
    }

    @Override
    public int getAdminCount(PageData pageData) {
        int total = 0;
        try {
            total = (int) dao.findForObject("AccountServiceMapper.getAdminCount", pageData);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }

    @Override
    public String addAdmin(RiseAdmin riseAdmin) {
        int num = -1;
        try {
            num = (int) dao.findForObject("AccountServiceMapper.getAdminByAccount", riseAdmin.getAccount());
            if (num == 0) {
                dao.insert("AccountServiceMapper.addAdmin", riseAdmin);
                return "success";
            } else {
                return "repeat";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public String deleteAdmin(int adminID) {
        try {
            dao.delete("AccountServiceMapper.deleteAdmin",adminID);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public String enabledAdmin(int adminID) {
        try {
            dao.update("AccountServiceMapper.enabledAdmin",adminID);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public String disableAdmin(int adminID) {
        try {
            dao.update("AccountServiceMapper.disableAdmin",adminID);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @Override
    public RiseAdmin getAdminById(int adminID) {
        try {
            return (RiseAdmin) dao.findForObject("AccountServiceMapper.getAdminById",adminID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public String updateAdminById(RiseAdmin riseAdmin) {
        try {
            dao.update("AccountServiceMapper.updateAdminById",riseAdmin);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }

    @Override
    public String resetAdminPassword(int adminID) {
        RiseAdmin riseAdmin = this.getAdminById(adminID);
        if(riseAdmin == null){
            return "error";
        }
        String password = MD5.md5(riseAdmin.getAccount());
        riseAdmin.setPassword(password);//重置密码
        try {
            dao.update("AccountServiceMapper.resetAdminPassword",riseAdmin);
            return "success";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
}
