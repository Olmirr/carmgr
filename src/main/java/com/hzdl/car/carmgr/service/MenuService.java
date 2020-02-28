package com.hzdl.car.carmgr.service;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Menu;
import com.hzdl.car.carmgr.vo.MenuVo;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 9:44
 */
public interface MenuService {

    List<Menu> findAllMenu(MenuVo menuVo);

    PageInfo<Menu> findMenu(MenuVo menuVo);

    int add(MenuVo menuVo);

    int update(MenuVo menuVo);

    int delById(Integer id);

    int exitsChildren(Integer id);}
