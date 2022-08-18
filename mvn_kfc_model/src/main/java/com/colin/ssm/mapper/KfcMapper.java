package com.colin.ssm.mapper;

import com.colin.ssm.pojo.Food;
import com.colin.ssm.pojo.Meal;
import com.colin.ssm.pojo.Middle;

import java.util.List;

public interface KfcMapper {
    public List<Meal> queryMeal(Meal meal);
    public int delMeal(List<Integer> ids);
    public int delMiddle(List<Integer> middles);
    public List<Food> selFood(Integer mid);
    public int addMeal(Meal meal);
    public int addMiddle(Middle middle);
    public Meal queryOne(Integer mid);
    public int upMeal(Meal meal);
}
