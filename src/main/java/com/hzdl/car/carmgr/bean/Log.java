package com.hzdl.car.carmgr.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:02
 */
@Data
public class Log implements Serializable {
    private Integer id;
    private String loginname;
    private String loginip;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date logintime;
}
