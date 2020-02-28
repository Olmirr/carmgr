package com.hzdl.car.carmgr.bean;

import lombok.*;

import java.io.Serializable;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 15:41
 */
@Data
public class User implements Serializable {
    private Integer userid;
    private String loginname;
    private String identity;
    private String realname;
    private Integer sex;
    private String address;
    private String phone;
    private String pwd;
    private String position;
    private Integer type;
    private Integer available;
}
