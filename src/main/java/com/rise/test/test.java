package com.rise.test;

import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.model.CityResponse;
import com.maxmind.geoip2.record.*;
import com.rise.util.SessionMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;
import java.io.File;

import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author xiaolong
 * @Date 2018/6/11 16:55
 * @Description
 */
public class test {

    static Map<String, String> map = new HashMap<>();

    public static void main(String[] args) {
        String type1 = "123";
        String type2 = "234";
        String type3 = "345";
        String type4 = "456";
        String type5 = "567";
        String account1 = "aaa";
        String account2 = "bbb";
        addSession(type1,account1);
        addSession(type2,account2);
        //addSession(type2,account1);

        for (Map.Entry<String, String> entry : map.entrySet()) {
            System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());
        }
    }

    public static void addSession(String type, String account) {
        validate(type,account);
        removeSession(type,account);
        System.out.println(account);
        map.put(type,account);
    }

    private static void validate(String type, String account) {
        account = type + account;
    }

    private static void removeSession(String type, String account) {
        account = type + account;
    }

}
