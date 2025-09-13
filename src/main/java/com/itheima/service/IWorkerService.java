package com.itheima.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.itheima.dao.WorkerDao;
import com.itheima.domain.Wine;
import com.itheima.domain.Worker;
import com.itheima.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
public interface IWorkerService extends IService<Worker> {

    boolean saveWorker(Worker worker);

    boolean update(Worker worker);

    boolean delete(Integer id);

    List<Worker> getAll();

    IPage<Worker> getPage(int currentPage, int pageSize);

    IPage<Worker> getPage(int currentPage, int pageSize, Worker worker);


}
