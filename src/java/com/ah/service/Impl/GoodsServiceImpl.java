package com.ah.service.Impl;

import com.ah.dao.GoodsMapper;
import com.ah.pojo.Goods;
import com.ah.service.GoodsService;
import com.ah.utils.UploadUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
    @Resource
    private GoodsMapper goodsDao;

    @Override
    public int addGoods(Goods goods, MultipartFile file) {
        UploadUtils uploadUtils = new UploadUtils();
        String pic = "";
        if (!file.isEmpty()) {
            pic = uploadUtils.uploadImage(file);
            goods.setPic(pic);
        }
        return goodsDao.addGoods(goods);
    }

    @Override
    public int deleteById(Integer id) {
        return goodsDao.deleteById(id);
    }

    @Override
    public List<Goods> findAll() {
        return goodsDao.findAll();
    }

    @Override
    public int updateById(Goods good, MultipartFile file) {
        UploadUtils uploadUtils = new UploadUtils();
        String pic = "";
        if (!file.isEmpty()) {
            pic = uploadUtils.uploadImage(file);
            good.setPic(pic);
        }
        return goodsDao.updateById(good);
    }
}
