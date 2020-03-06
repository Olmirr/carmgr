package com.hzdl.car.carmgr.vo;

import com.hzdl.car.carmgr.bean.Role;
import lombok.Data;

/**
 * @author 伴你时光尽头
 * @create 2020-03-02 9:58
 */
@Data
public class RoleVo extends Role {
    private Integer page;
    private Integer limit;

    private Integer[] ids;
}
