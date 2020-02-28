package com.hzdl.car.carmgr.vo;

import com.hzdl.car.carmgr.bean.Menu;
import lombok.Data;

import java.io.Serializable;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 9:41
 */
@Data
public class MenuVo extends Menu implements Serializable {
    private Integer page;
    private Integer limit;
}
