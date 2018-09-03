package com.rise.util;

import com.rise.entity.common.RiseUser;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/6/9 17:44
 * @Description 存放用户session数据的内存数据类，管理用户session
 */
public class SessionMap {
    private static Map<RiseUser, HttpSession> sessionMap = new HashMap<>();

    public static Map<RiseUser, HttpSession> getSessionMap() {
        return sessionMap;
    }

    public static boolean containsKey(RiseUser riseUser) {
        return sessionMap.containsValue(riseUser);
    }

    public static void putSession(RiseUser riseUser, HttpSession session) {
        sessionMap.put(riseUser, session);
    }

    public static boolean containsValue(HttpSession httpSession) {
        return sessionMap.containsKey(httpSession);
    }

    //注销session
    public static void removeSession(RiseUser riseUser,HttpSession httpSession) {
        if (containsKey(riseUser) == true) {
            sessionMap.remove(riseUser);
        }
        httpSession.invalidate();
    }

    public static void removeSession(HttpSession httpSession){
        if(containsValue(httpSession) == true){
            RiseUser riseUser = (RiseUser) httpSession.getAttribute("user");
            sessionMap.remove(riseUser);
            httpSession.invalidate();
        }
    }

}
