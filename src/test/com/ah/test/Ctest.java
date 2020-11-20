package com.ah.test;

import com.ah.pojo.Goods;
import com.ah.service.GoodsService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-context.xml")
public class Ctest {
    @Resource
    private GoodsService goodsService;

    @Test
    public void test01() {
/*
        int i = goodsService.addGoods(goods);
        System.out.println("i = " + i);*/
     /*   int i = goodsService.deleteById(39);
        System.out.println("i = " + i);*/
      /*  List<Goods> all = goodsService.findAll();
        System.out.println("all = " + all);*/
/*        goods.setName("哇哈哈");
        goods.setDes("sss");
        goods.setDiscount(10.0);
        goods.setPrice(100.0);
        goods.setPic("test");
        goods.setId(40);
        goodsService.updateById(goods);*/
    }

}
