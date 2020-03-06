package com.hzdl.car.carmgr.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hzdl.car.carmgr.bean.News;
import lombok.Data;

import java.io.Serializable;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:04
 */
@Data
public class NewsVo extends News implements Serializable {
    private Integer page;
    private Integer limit;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private String startTime;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private String endTime;

    private Integer[] ids;
}
