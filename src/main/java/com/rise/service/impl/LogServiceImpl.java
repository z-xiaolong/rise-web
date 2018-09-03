package com.rise.service.impl;

import com.rise.dao.DaoSupport;
import com.rise.entity.common.Log;
import com.rise.service.LogService;
import com.rise.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/6/14 17:27
 * @Description
 */

@Service("logServiceImpl")
public class LogServiceImpl implements LogService {
    @Resource(name = "daoSupport")
    private DaoSupport dao;

    @Override
    public void saveLog(Log log) throws Exception{
        dao.insert("LogServiceMapper.saveLog",log);
    }

    @Override
    public Map<String, Object> getAllLogs(PageData pd) throws Exception {
        Map<String,Object> map = new HashMap<String, Object>();

        pd.put("start", Integer.parseInt( pd.get("start").toString() ) );
        pd.put("length", Integer.parseInt( pd.get("length").toString() ) );

        List<Log> logList = (List<Log>) dao.findForList("LogServiceMapper.getAllLogs", pd);
        int logTotal = getAllLogsCount(pd);

        map.put("data", logList);
        map.put("recordsTotal", logTotal);   //dataTable分页需要
        map.put("recordsFiltered", logTotal);//dataTable分页需要
        map.put("draw", pd.get("draw").toString());//dataTable分页需要

        return map;
    }

    @Override
    public int getAllLogsCount(PageData pd) throws Exception {
        return (int) dao.findForObject("LogServiceMapper.getAllLogsCount", pd);
    }
}
