package com.colin.ssm.service;

import com.colin.ssm.pojo.Food;
import com.colin.ssm.pojo.Meal;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface KfcService {
    public PageInfo<Meal> queryMeal(Meal meal,Integer pageNum);
    public int delMeal(List<Integer> ids);
    public List<Food> selFood(Integer mid);
    public int addMeal(Meal meal,List<Integer> fids);
    public int upMeal(Meal meal,List<Integer> fids);
    public Meal queryOne(Integer mid);
}
