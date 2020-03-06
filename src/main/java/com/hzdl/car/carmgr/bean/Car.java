package com.hzdl.car.carmgr.bean;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 15:41
 */
@Data
public class Car implements Serializable {

    private String carNumber;
    private String carType;
    private String color;
    private BigDecimal price;
    private BigDecimal rentPrice;
    private BigDecimal deposit;
    private int isRenting;
    private String description ;
    private String carImg ;
    private Date createTime ;
}
