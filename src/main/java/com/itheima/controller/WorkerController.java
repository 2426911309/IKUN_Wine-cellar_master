package com.itheima.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.itheima.controller.utils.R;
import com.itheima.domain.Wine;
import com.itheima.domain.Worker;
import com.itheima.domain.User;
import com.itheima.service.IWineService;
import com.itheima.service.IWorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/worker")
public class WorkerController {


    @Autowired
    private IWorkerService iWorkerService;


    @GetMapping
    public R getAll(){
        return new R(true, iWorkerService.list());
    }

    @PostMapping
    public R save(@RequestBody Worker worker) throws IOException {
//        R r = new R();
//        boolean flag = bookService.save(book);
//        r.setFlag(flag);
        if (worker.getWorkerName().equals("123") ) throw new IOException();
        boolean flag = iWorkerService.save(worker);
        return new R(flag, flag ? "添加成功^_^" : "添加失败-_-!");
    }

    @PutMapping
    public R update(@RequestBody Worker worker) throws IOException {
        if (worker.getWorkerName().equals("123") ) throw new IOException();
        boolean flag = iWorkerService.update(worker);
        return new R(flag, flag ? "修改成功^_^" : "修改失败-_-!");
    }

    @DeleteMapping("{id}")
    public R delete(@PathVariable Integer id){
        return new R(iWorkerService.delete(id));
    }

    @GetMapping("{id}")
    public R getById(@PathVariable Integer id){
        return new R(true, iWorkerService.getById(id));
    }

//    @GetMapping("{currentPage}/{pageSize}")
//    public R getPage(@PathVariable int currentPage,@PathVariable int pageSize){
//        IPage<Book> page = bookService.getPage(currentPage, pageSize);
//        //如果当前页码值大于了总页码值，那么重新执行查询操作，使用最大页码值作为当前页码值
//        if( currentPage > page.getPages()){
//            page = bookService.getPage((int)page.getPages(), pageSize);
//        }
//        return new R(true, page);
//    }

    @GetMapping("{currentPage}/{pageSize}")
    public R getPage(@PathVariable int currentPage,@PathVariable int pageSize,Worker worker){
//        System.out.println("参数==>"+book);

        IPage<Worker> page = iWorkerService.getPage(currentPage, pageSize,worker);
        //如果当前页码值大于了总页码值，那么重新执行查询操作，使用最大页码值作为当前页码值
        if( currentPage > page.getPages()){
            page = iWorkerService.getPage((int)page.getPages(), pageSize,worker);
        }
        return new R(true, page);
    }
}
