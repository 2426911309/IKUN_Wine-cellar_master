package com.itheima.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.itheima.dao.WineDao;
import com.itheima.dao.WorkerDao;
import com.itheima.domain.Wine;
import com.itheima.domain.Worker;
import com.itheima.domain.User;
import com.itheima.service.IWineService;
import com.itheima.service.IWorkerService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class WorkerServiceImpl extends ServiceImpl<WorkerDao, Worker> implements IWorkerService {
  @Autowired
   private WorkerDao workerDao;

    @Override
    public boolean saveWorker(Worker worker) {
        return workerDao.insert(worker) > 0;
    }

    @Override
    public boolean update(Worker worker) {
        return workerDao.updateById(worker) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return workerDao.deleteById(id) > 0;
    }

    @Override
    public List<Worker> getAll() {
        return workerDao.selectList(null);
    }

    @Override
    public IPage<Worker> getPage(int currentPage, int pageSize) {
        IPage page = new Page(currentPage,pageSize);
        workerDao.selectPage(page,null);
        return page;
    }

    @Override
    public IPage<Worker> getPage(int currentPage, int pageSize, Worker worker) {

        LambdaQueryWrapper<Worker> lqw = new LambdaQueryWrapper<Worker>();
        lqw.like(Strings.isNotEmpty(worker.getWorkerId()), Worker::getWorkerId, worker.getWorkerId());
        lqw.like(Strings.isNotEmpty(worker.getWorkerName()),Worker::getWorkerName,worker.getWorkerName());
        lqw.like(Strings.isNotEmpty(worker.getCardId()), Worker::getCardId, worker.getCardId());
        lqw.like(Strings.isNotEmpty(worker.getEducation()), Worker::getEducation, worker.getEducation());


        IPage page = new Page(currentPage,pageSize);
        workerDao.selectPage(page,lqw);
        return page;
    }


}
