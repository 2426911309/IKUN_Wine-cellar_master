package com.itheima.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.itheima.domain.Wine;
import com.itheima.domain.Access;
import com.itheima.service.impl.AccessSericeImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class WineServiceTest {

    @Autowired
    private IWineService wineService;

    @Autowired
    IWorkerService iWorkerService;

    @Autowired
    AccessSericeImpl iBorrwoServiceL;

    @Test
    void testGetById(){
        System.out.println(wineService.getById(4));
    }


    @Test
    void testSave(){
        System.out.println(iBorrwoServiceL.getAll());
       // iBorrwoServiceL.delete(1);
       // System.out.println(iReaderService.getAll());
    }

    @Test
    void testUpdate(){
        Access access=new Access();
        access.setIsbnLog("9000000000000");

        access.setWinenameLog("null");
        access.setNum("8");
        iBorrwoServiceL.addaccess(access);

    }

    @Test
    void testDelete(){
        wineService.removeById(18);
    }

    @Test
    void testGetAll(){
        wineService.list();
    }

    @Test
    void testGetPage(){
        IPage<Wine> page = new Page<Wine>(2,5);
        wineService.page(page);
        System.out.println(page.getCurrent());
        System.out.println(page.getSize());
        System.out.println(page.getTotal());
        System.out.println(page.getPages());
        System.out.println(page.getRecords());
    }

}
