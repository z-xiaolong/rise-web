package com.rise.service;

import com.rise.entity.common.RiseAdmin;
import com.rise.util.PageData;

import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/3 16:23
 * @Description
 */
public interface AccountService {

    public List<RiseAdmin> getAllAdmin(PageData pageData);
    public int getAdminCount(PageData pageData);
}
