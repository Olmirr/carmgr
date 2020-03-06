package com.hzdl.car.carmgr.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 伴你时光尽头
 * @create 2020-03-02 0:13
 */
@Data
public class Role implements Serializable {
    private Integer roleId;
    private String roleName;
    private String roleDesc;
    private Integer available;
}
