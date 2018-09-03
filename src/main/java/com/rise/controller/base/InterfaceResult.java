package com.rise.controller.base;


import java.util.HashMap;
import java.util.Map;

import com.rise.util.Logger;


/**
 * 接口返回信息
 *
 * @author zhouxiaolong
 */
public class InterfaceResult {

    protected Logger logger = Logger.getLogger(this.getClass());

    /**
     * 接口返回状态码
     */
    public static final int FAILURE = 0;//失败

    public static final int SUCCESS = 1;//成功

    public static final int EXPIRE = 2;//token过期


    /**
     * 接口返回提示信息
     */
    public static final String Msg_failure = "操作失败"; //其实就是系统异常

    public static final String Msg_success = "操作成功";

    public static final String Msg_expire = "token过期";


    /**
     * 返回成功结果
     *
     * @param data
     * @return
     * @author zhouxiaolong
     */
    public static Map<String, Object> returnSuccess(Map<String, Object> data) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", SUCCESS);
        map.put("msg", Msg_success);
        map.put("data", data);
        return map;
    }


    /**
     * 返回成功结果  和  自定义成功信息
     *
     * @param data
     * @param msg
     * @return
     */
    public static Map<String, Object> returnSuccessWithMsgAndData(Map<String, Object> data, String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", SUCCESS);
        map.put("msg", msg);
        map.put("data", data);
        return map;
    }

    /**
     * 返回失败结果
     *
     * @return
     * @author zhouxiaolong
     */
    public static Map<String, Object> returnFailure() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", FAILURE);
        map.put("msg", Msg_failure);
        map.put("data", new HashMap<String, Object>());
        new InterfaceResult().logger.error("++++++++++ 调用接口时系统异常  ++++++++++");
        return map;
    }


    /**
     * 返回失败结果   提示信息自己定义
     *
     * @return
     * @author zhouxiaolong
     */
    public static Map<String, Object> returnFailureWithMsg(String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", FAILURE);
        map.put("msg", msg);
        map.put("data", new HashMap<String, Object>());
        new InterfaceResult().logger.error("++++++++++ 返回失败信息 :" + msg + "  ++++++++++");
        return map;
    }


    /**
     * 返回token过期结果
     *
     * @author zhouxiaolong
     */
    public static Map<String, Object> returnExpire() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", EXPIRE);
        map.put("msg", Msg_expire);
        map.put("data", new HashMap<String, Object>());
        new InterfaceResult().logger.warn("++++++++++ 接口调用时token过期  ++++++++++");
        new InterfaceResult().logger.warn("++++++++++   end   ++++++++++");
        return map;
    }


    /**
     * 返回结果自定义
     *
     * @param status
     * @param Msg
     * @param data
     * @return
     * @author zhouxiaolong
     */
    public static Map<String, Object> returnResult(Integer status, String Msg, Map<String, Object> data) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", status);
        map.put("msg", Msg);
        map.put("data", data);
        new InterfaceResult().logger.warn("++++++++++ 状态码：" + status + " - " + Msg + "  ++++++++++");
        new InterfaceResult().logger.warn("++++++++++   end   ++++++++++");
        return map;
    }


}
