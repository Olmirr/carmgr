package com.hzdl.car.carmgr.util;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 9:52
 */
@Data
public class TreeNode {
    private Integer id;
    @JsonProperty("parentId")
    private Integer pid;

    // 参考navs.js来设定属性
    private String title;
    private String icon;
    private String href;
    private Boolean spread;
    private String target;

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
}

