package com.hzdl.car.carmgr.service.iml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Menu;
import com.hzdl.car.carmgr.mapper.MenuMapper;
import com.hzdl.car.carmgr.service.MenuService;
import com.hzdl.car.carmgr.vo.MenuVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 9:45
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public List<Menu> findAllMenu(MenuVo menuVo) {
        return menuMapper.findAllMenu(menuVo);
    }

    @Override
    public PageInfo<Menu> findMenu(MenuVo menuVo) {
        PageHelper.startPage(menuVo.getPage(),menuVo.getLimit());
        List<Menu> list= menuMapper.findMenu(menuVo);
        PageInfo<Menu> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(MenuVo menuVo) {
        return menuMapper.add(menuVo);
    }

    @Override
    public int update(MenuVo menuVo) {
        return menuMapper.update(menuVo);
    }

    @Override
    public int delById(Integer id) {
        return menuMapper.delById(id);
    }

    @Override
    public int exitsChildren(Integer id) {
        return menuMapper.exitsChildren(id);
    }
}
