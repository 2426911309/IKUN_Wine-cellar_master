package com.itheima.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.domain.Wine;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public interface IWineService extends IService<Wine> {

    boolean saveWine(Wine wine);

    boolean modify(Wine wine);

    boolean delete(Integer id);

    List<Wine> getAll();

    IPage<Wine> getPage(int currentPage, int pageSize);

    IPage<Wine> getPage(int currentPage, int pageSize, Wine wine);

}
