package com.ah.dao;

import com.ah.pojo.Goods;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsMapper {
    //添加
    int addGoods(Goods goods);

    //删除
    int deleteById(@Param("id") Integer id);

    //查找全部
    List<Goods> findAll();

    //更改
    int updateById(Goods good);
}
