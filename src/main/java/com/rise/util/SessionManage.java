package com.rise.util;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/9/6 20:52
 * @Description
 */
public class SessionManage extends HashMap implements Map {
    private static final long serialVersionUID = -5227806205814076389L;
    private static Map<String, HttpSession> sessionMap = new HashMap<>();

    public static void addSession(String type, String account, HttpSession session) {

        if (validate(type, account) == true) {
            removeSession(type, account);
        }
        account = type + account;
        sessionMap.put(account, session);
    }

    private static boolean validate(String type, String account) {
        account = type + account;
        return sessionMap.containsKey(account);
    }

    public static void removeSession(String type, String account) {
        account = type + account;
        HttpSession session = sessionMap.get(account);
        if (session == null) {
            System.out.println("+++++++++++++++++accountKey" + account);


        }
        session.invalidate();
        sessionMap.remove(account);

    }

    public static void printMap() {
        for (Map.Entry<String, HttpSession> entry : sessionMap.entrySet()) {
            System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
            System.out.println("Key: " + entry.getKey() + " Value: " + entry.getValue());
            System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
        }
    }
}
