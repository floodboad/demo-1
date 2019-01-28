package com.wangsong.alibaba.dao;

import com.wangsong.alibaba.model.Alibaba;
import org.apache.ibatis.annotations.Mapper;

public interface AlibabaMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alibaba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    int deleteByPrimaryKey(Integer ali);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alibaba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    int insert(Alibaba record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alibaba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    int insertSelective(Alibaba record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alibaba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    Alibaba selectByPrimaryKey(Integer ali);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alibaba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    int updateByPrimaryKeySelective(Alibaba record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alibaba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    int updateByPrimaryKey(Alibaba record);
}