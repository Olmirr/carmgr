package com.hzdl.car.carmgr.vo;

import com.hzdl.car.carmgr.bean.Customer;
import lombok.Data;

import java.io.Serializable;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 15:51
 */
@Data
public class CustomerVo extends Customer implements Serializable {
    private Integer page;
    private Integer limit;

    private String[] ids;
}
