package com.itheima.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.itheima.controller.utils.R;
import com.itheima.domain.Wine;
import com.itheima.domain.Access;
import com.itheima.service.IAccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@RequestMapping("/access")
public class AccessControler {
    @Autowired
    private IAccessService AccessService;

    @GetMapping
    public R getAll(){
        return new R(true, AccessService.list());
    }


    @PostMapping
    public R save(@RequestBody Access access) throws IOException {
//        R r = new R();
//        boolean flag = bookService.save(book);
//        r.setFlag(flag);
        if (access.getWorkeridLog().equals("123") ) throw new IOException();
        boolean flag = AccessService.save(access);
        return new R(flag, flag ? "添加成功^_^" : "添加失败-_-!");
    }

    @PutMapping
    public R update(@RequestBody Access access) throws IOException {
        if (access.getWorkeridLog().equals("123") ) throw new IOException();
        boolean flag = AccessService.update(access);
        return new R(flag, flag ? "修改成功^_^" : "修改失败-_-!");
    }

    @DeleteMapping("{id}")
    public R delete(@PathVariable Integer id){
        return new R(AccessService.delete(id));
    }

    @GetMapping("{id}")
    public R getById(@PathVariable Integer id){
        return new R(true, AccessService.getById(id));
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
    public R getPage(@PathVariable int currentPage,@PathVariable int pageSize,Access access){
//        System.out.println("参数==>"+book);

        IPage<Access> page = AccessService.getPage(currentPage, pageSize,access);
        //如果当前页码值大于了总页码值，那么重新执行查询操作，使用最大页码值作为当前页码值
        if( currentPage > page.getPages()){
            page = AccessService.getPage((int)page.getPages(), pageSize,access);
        }
        return new R(true, page);
    }


}
