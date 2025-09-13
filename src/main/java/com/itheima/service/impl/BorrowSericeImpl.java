package com.itheima.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.itheima.dao.WineDao;
import com.itheima.dao.AccessDao;

import com.itheima.domain.Access;
import com.itheima.service.IBorrwoService;
import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccessSericeImpl  extends ServiceImpl<AccessDao, Access> implements IBorrwoService {

    @Autowired
    private AccessDao accessDao;


    @Autowired
    private WineDao wineDao;


    @Override
    public List<Access> addaccess(Access access) {
        return accessDao.addaccess(access);
    }

    @Override
    public boolean update(Access access) {
        return accessDao.updateById(access) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return accessDao.deleteById(id) > 0;
    }

    @Override
    public List<Access> getAll() {
        return accessDao.selectList(null);
    }

    @Override
    public IPage<Access> getPage(int currentPage, int pageSize) {
        IPage page = new Page(currentPage,pageSize);
        accessDao.selectPage(page,null);
        return page;
    }

    @Override
    public IPage<Access> getPage(int currentPage, int pageSize, Access access) {
        LambdaQueryWrapper<Access> lqw = new LambdaQueryWrapper<Access>();
        lqw.like(Strings.isNotEmpty(access.getIsbnLog()), Access::getIsbnLog, access.getIsbnLog());
        lqw.like(Strings.isNotEmpty(access.getWinenameLog()), Access::getWinenameLog, access.getWinenameLog());
        lqw.like(Strings.isNotEmpty(access.getWorkeridLog()), Access::getWorkeridLog, access.getWorkeridLog());
        lqw.like(Strings.isNotEmpty(access.getWorkernameLog()), Access::getWorkernameLog, access.getWorkernameLog());
        lqw.like(Strings.isNotEmpty(access.getCardidLog()), Access::getCardidLog, access.getCardidLog());
      /*  lqw.like(Strings.isNotEmpty((CharSequence) borrow.getBeginTime()), Borrow::getBeginTime, borrow.getBeginTime());
        lqw.like(Strings.isNotEmpty((CharSequence)borrow.getEndTime()), Borrow::getBeginTime, borrow.getBeginTime());*/
        lqw.like(Strings.isNotEmpty(access.getNum()), Access::getNum, access.getNum());


        IPage page = new Page(currentPage,pageSize);
        accessDao  .selectPage(page,lqw);
        return page;
    }


}
