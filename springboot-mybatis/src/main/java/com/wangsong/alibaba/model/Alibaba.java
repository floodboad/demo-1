package com.wangsong.alibaba.model;

import java.io.Serializable;

public class Alibaba implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column alibaba.ali
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    private Integer ali;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column alibaba.baba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    private String baba;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column alibaba.ali
     *
     * @return the value of alibaba.ali
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    public Integer getAli() {
        return ali;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column alibaba.ali
     *
     * @param ali the value for alibaba.ali
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    public void setAli(Integer ali) {
        this.ali = ali;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column alibaba.baba
     *
     * @return the value of alibaba.baba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    public String getBaba() {
        return baba;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column alibaba.baba
     *
     * @param baba the value for alibaba.baba
     *
     * @mbg.generated Mon Sep 03 22:47:28 CST 2018
     */
    public void setBaba(String baba) {
        this.baba = baba == null ? null : baba.trim();
    }

    @Override
    public String toString() {
        return "Alibaba{" +
                "ali=" + ali +
                ", baba='" + baba + '\'' +
                '}';
    }
}