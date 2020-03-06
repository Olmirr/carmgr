package com.hzdl.car.carmgr.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 15:41
 */
@Data
public class Customer implements Serializable {

    private String identity;
    private String custname;
    private Integer sex;
    private String address;
    private String phone;
    private String career;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date createtime;
}
