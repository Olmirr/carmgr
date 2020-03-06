package com.hzdl.car.carmgr.service.iml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.News;
import com.hzdl.car.carmgr.mapper.NewsMapper;
import com.hzdl.car.carmgr.service.NewsService;
import com.hzdl.car.carmgr.vo.NewsVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:50
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Resource
    private NewsMapper newsMapper;

    @Override
    public PageInfo<News> findNews(NewsVo newsVo) {
        PageHelper.startPage(newsVo.getPage(),newsVo.getLimit());
        List<News> list= newsMapper.findNews(newsVo);
        PageInfo<News> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<News> findNewsWhere(NewsVo newsVo) {
        PageHelper.startPage(newsVo.getPage(),newsVo.getLimit());
        List<News> list= newsMapper.findNewsWhere(newsVo);
        PageInfo<News> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int delById(Integer id) {
        return newsMapper.del(id);
    }

    @Override
    public void delBatch(Integer[] ids) {
        for(Integer integer: ids){
            delById(integer);
        }
    }

    @Override
    public int add(NewsVo newsVo) {
        return newsMapper.add(newsVo);
    }

    @Override
    public int update(NewsVo newsVo) {
        return newsMapper.update(newsVo);
    }

    @Override
    public List<News> findNewsLatest() {
        return newsMapper.findNewsLatest();
    }
}
