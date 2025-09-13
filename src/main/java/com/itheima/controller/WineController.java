package com.itheima.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.itheima.controller.utils.M;
import com.itheima.controller.utils.R;
import com.itheima.domain.Wine;
import com.itheima.service.IWineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/wines")
public class WineController {

    @Autowired
    private IWineService wineService;

    @GetMapping
    public R getAll(){
        return new R(true, wineService.list());
    }

    @PostMapping
    public M save(@RequestBody Wine wine) throws IOException {
//        R r = new R();
//        boolean flag = bookService.save(book);
//        r.setFlag(flag);
        if (wine.getWineName().equals("123") ) throw new IOException();
        boolean flag = wineService.save(wine);
        return new M(flag, flag ? "添加成功^_^" : "添加失败-_-!");
    }

    @PutMapping
    public R update(@RequestBody Wine wine) throws IOException {
        if (wine.getWineName().equals("123") ) throw new IOException();
        boolean flag = wineService.modify(wine);
        return new R(flag, flag ? "修改成功^_^" : "修改失败-_-!,数据不匹配");
    }

    @DeleteMapping("{id}")
    public R delete(@PathVariable Integer id){
        return new R(wineService.delete(id));
    }

    @GetMapping("{id}")
    public R getById(@PathVariable Integer id){
        return new R(true, wineService.getById(id));
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
    public R getPage(@PathVariable int currentPage,@PathVariable int pageSize,Wine wine){
//        System.out.println("参数==>"+book);

        IPage<Wine> page = wineService.getPage(currentPage, pageSize,wine);
        //如果当前页码值大于了总页码值，那么重新执行查询操作，使用最大页码值作为当前页码值
        if( currentPage > page.getPages()){
            page = wineService.getPage((int)page.getPages(), pageSize,wine);
        }
        return new R(true, page);
    }

}

















