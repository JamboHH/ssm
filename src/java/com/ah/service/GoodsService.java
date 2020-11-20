package com.ah.service;

import com.ah.pojo.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface GoodsService {
    //添加
    int addGoods(Goods goods, MultipartFile file);

    //删除
    int deleteById(@Param("id") Integer id);

    //查找全部
    List<Goods> findAll();

    //更改
    int updateById(Goods good,MultipartFile file);
}
