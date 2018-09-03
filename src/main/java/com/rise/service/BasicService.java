package com.rise.service;

import com.rise.entity.common.Menu;

import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/2 10:45
 * @Description
 */
public interface BasicService {

    public List<Menu> getMenuList(String typeID) throws Exception;
}
