package com.colin.ssm.controller;

import com.colin.ssm.pojo.Meal;
import com.colin.ssm.service.KfcService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 控制层
 */
@Controller
public class KfcController {

    @Autowired
    private KfcService kfcService;

    /**
     *
     * @param meal
     * @param pageNum
     * @param model
     * @return
     */
    @RequestMapping("queryMeal.do")
    public String queryMeal(Meal meal, @RequestParam(name = "pageNum",defaultValue = "1") Integer pageNum, Model model){
        model.addAttribute("page",kfcService.queryMeal(meal,pageNum));
        return "mealList";
    }
    @RequestMapping("delMeal.do")
    @ResponseBody
    private Integer delMeal(@RequestParam(name = "ids" ,required=false) List<Integer> ids){
        return kfcService.delMeal(ids);
    }
    @RequestMapping("toAdd.do")
    private String selFood(Model model){
        model.addAttribute("foods",kfcService.selFood(null));
        return "add";
    }
    @RequestMapping("add.do")
    @ResponseBody
    private Integer add(Meal meal,@RequestParam(name = "fids" ,required=false) List<Integer> fids){
        return kfcService.addMeal(meal,fids);
    }

    @RequestMapping("queryOne.do")
    private String queryOne(Model model,Integer mid){
        kfcService.selFood(mid);
        model.addAttribute("meal",kfcService.queryOne(mid));
        model.addAttribute("foods",kfcService.selFood(mid));
        return "upMeal";
    }
    @RequestMapping("up.do")
    @ResponseBody
    public Integer up(Meal meal,@RequestParam(name = "fids" ,required=false) List<Integer> fids){
        return kfcService.upMeal(meal,fids);
    }
}
