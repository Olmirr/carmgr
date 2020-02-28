package com.hzdl.car.carmgr.util;

/**
 * @author 伴你时光尽头
 * @create 2020-02-28 14:15
 */
public class Common {
    public static boolean chkStringEmpty(String str){
        if(str == null || "".equals(str)){
            return true;
        }
        return false;
    }
}
