package com.ah.controller;

import com.ah.pojo.Goods;
import com.ah.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Resource
    private GoodsService goodsService;

    @RequestMapping("/addGoods")
    public String addGoods(Goods goods, MultipartFile file) {
        goodsService.addGoods(goods, file);
        return "redirect:/goods/findAll";
    }

    @RequestMapping("/deleteGoods")
    public String deleteGoods(Integer id) {
        goodsService.deleteById(id);
        return "redirect:/goods/findAll";
    }

    @RequestMapping("/updateGoods")
    public String updateGoods(Goods goods, MultipartFile file) {
        goodsService.updateById(goods, file);
        return "redirect:/goods/findAll";
    }


    @RequestMapping("/findAll")
    public String findAll(Model model, Integer page) {
        if (page == null) {
            page = 1;
        }
        PageHelper.startPage(page, 5);
        List<Goods> list = goodsService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        model.addAttribute("list", list);
        model.addAttribute("pageInfo", pageInfo);
        return "goodsList";
    }
}
