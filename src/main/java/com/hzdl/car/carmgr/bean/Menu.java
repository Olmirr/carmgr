package com.hzdl.car.carmgr.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 9:39
 */
@Data
public class Menu implements Serializable {
    private Integer id;
    private Integer pid;
    private String name;
    private String href;
    private Integer open;
    private String target;
    private String icon;
    private Integer available;
}
