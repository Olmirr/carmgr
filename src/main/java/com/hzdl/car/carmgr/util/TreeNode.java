package com.hzdl.car.carmgr.util;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 9:52
 */
@Data
public class TreeNode implements Serializable {
    private Integer id;
    @JsonProperty("parentId")
    private Integer pid;

    // 参考navs.js来设定属性
    private String title;
    private String icon;
    private String href;
    private Boolean spread;
    private String target;

    private String checkArr="0";

    // 需要创建号对象，防止空指针
    private List<TreeNode> children = new ArrayList<>();

    public TreeNode(Integer id, Integer pid, String title, String icon, String href, Boolean spread, String target) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.icon = icon;
        this.href = href;
        this.spread = spread;
        this.target = target;
    }

    public TreeNode(Integer id, Integer pid, String title, Boolean spread, String checkArr) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.spread = spread;
        this.checkArr = checkArr;
    }
}

