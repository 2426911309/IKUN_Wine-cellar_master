package com.itheima.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.domain.Access;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public interface IAccessService extends IService<Access> {
    List<Access> addaccess(Access access);

    boolean update(Access access);

    boolean delete(Integer id);

    List<Access> getAll();

    IPage<Access> getPage(int currentPage, int pageSize);

    IPage<Access> getPage(int currentPage, int pageSize, Access access);

}
