package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.Menu;
import com.rise.service.BasicService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author xiaolong
 * @Date 2018/9/2 10:54
 * @Description
 */

@Service("basicServiceImpl")
public class BasicServiceImpl implements BasicService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public List<Menu> getMenuList(String typeID) throws Exception {
        return (List<Menu>) dao.findForList("BasicServiceMapper.getMenuList",typeID);
    }
}
