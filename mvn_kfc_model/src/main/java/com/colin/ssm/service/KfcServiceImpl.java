package com.colin.ssm.service;

import com.colin.ssm.mapper.KfcMapper;
import com.colin.ssm.pojo.Food;
import com.colin.ssm.pojo.Meal;
import com.colin.ssm.pojo.Middle;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class KfcServiceImpl implements KfcService{
    @Autowired
    public KfcMapper kfcMapper;
    @Override
    public PageInfo<Meal> queryMeal(Meal meal, Integer pageNum) {
        PageHelper.startPage(pageNum,2);
        PageInfo<Meal> pageInfo = new PageInfo<Meal>(kfcMapper.queryMeal(meal));
        return pageInfo;
    }

    @Override
    public int delMeal(List<Integer> ids) {
        int i = kfcMapper.delMeal(ids);
        if(i>0){
            kfcMapper.delMiddle(ids);
        }
        return i;
    }

    @Override
    public List<Food> selFood(Integer mid) {
        return kfcMapper.selFood(mid);
    }

    @Override
    public int addMeal(Meal meal, List<Integer> fids) {
        int i = kfcMapper.addMeal(meal);
        if (i > 0) {
            for (Integer fid : fids) {
                kfcMapper.addMiddle(new Middle(meal.getMid(),fid));
            }
        }
        return i;
    }

    @Override
    public int upMeal(Meal meal ,List<Integer> fids) {
        int i = kfcMapper.upMeal(meal);
        if(i>0){
            kfcMapper.delMiddle(Arrays.asList(meal.getMid()));
            for (Integer fid : fids) {
                kfcMapper.addMiddle(new Middle(fid,meal.getMid()));
            }
        }
        return i;
    }

    @Override
    public Meal queryOne(Integer mid) {
        return kfcMapper.queryOne(mid);
    }


}
