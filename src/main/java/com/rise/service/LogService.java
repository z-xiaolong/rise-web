package com.rise.service;

import com.rise.entity.Page;
import com.rise.entity.common.Log;
import com.rise.util.PageData;

import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/6/14 17:26
 * @Description
 */
public interface LogService {

    public void saveLog(Log log) throws Exception;

    public Map<String, Object> getAllLogs(PageData pd) throws Exception;

    public int getAllLogsCount(PageData pd) throws Exception;
}
