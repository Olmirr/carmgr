package com.hzdl.car.carmgr.util;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 15:51
 */
public class HzdlResultJson {
    private Integer code = 0;
    private String msg;
    private Object data;
    private Long count;

    public HzdlResultJson(Object data) {
        this.data = data;
        this.msg ="操作成功";
    }
    public HzdlResultJson(Long count,Object data) {
        this.count = count;
        this.data = data;
        this.msg ="操作成功";
    }
    public HzdlResultJson(Integer code, String message) {
        this.code = code;
        this.msg = message;
    }
    public static HzdlResultJson ok(Object o){
        return  new HzdlResultJson(o);
    }
    public static HzdlResultJson ok(Long count,Object o){
        return  new HzdlResultJson(count,o);
    }

    public static HzdlResultJson error(Integer code, String message){
        return  new HzdlResultJson(code,message);
    }

    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
