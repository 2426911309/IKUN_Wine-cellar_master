package com.itheima.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.dao.WineDao;
import com.itheima.domain.Wine;
import com.itheima.service.IWineService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WineServiceImpl extends ServiceImpl<WineDao, Wine> implements IWineService {

    @Autowired
    private WineDao wineDao;



    @Override
    public boolean saveWine(Wine wine) {
        return wineDao.insert(wine) > 0;
    }

    @Override
    public boolean modify(Wine wine) {
        return wineDao.updateById(wine) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return wineDao.deleteById(id) > 0;
    }

    @Override
    public List<Wine> getAll() {
        return wineDao.selectList(null);
    }

    @Override
    public IPage<Wine> getPage(int currentPage, int pageSize) {
        IPage page = new Page(currentPage,pageSize);
        wineDao.selectPage(page,null);
        return page;
    }

    @Override
    public IPage<Wine> getPage(int currentPage, int pageSize, Wine wine) {
        LambdaQueryWrapper<Wine> lqw = new LambdaQueryWrapper<Wine>();
        lqw.like(Strings.isNotEmpty(wine.getIsbn()), Wine::getIsbn, wine.getIsbn());
        lqw.like(Strings.isNotEmpty(wine.getWineName()),Wine::getWineName,wine.getWineName());
        lqw.like(Strings.isNotEmpty(wine.getAuthor()),Wine::getAuthor,wine.getAuthor());
        lqw.like(Strings.isNotEmpty(wine.getNotes()),Wine::getNotes,wine.getNotes());
        lqw.like(Strings.isNotEmpty(wine.getPublisher()),Wine::getPublisher,wine.getPublisher());
        lqw.like(Strings.isNotEmpty(wine.getSynopsis()),Wine::getSynopsis,wine.getSynopsis());
        lqw.like(Strings.isNotEmpty((CharSequence) wine.getPublicationDate()),Wine::getPublicationDate,wine.getPublicationDate());
        lqw.like(Strings.isNotEmpty(wine.getLast()),Wine::getLast,wine.getLast());



        IPage page = new Page(currentPage,pageSize);
        wineDao.selectPage(page,lqw);
        return page;
    }
}
