package com.wangsong.alibaba.service;

import com.wangsong.alibaba.dao.AlibabaMapper;
import com.wangsong.alibaba.model.Alibaba;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AlibabaService {
    @Autowired
    private AlibabaMapper alibabaMapper;

    @Transactional
    public int updateByPrimaryKey(Alibaba alibaba) {
        System.out.println(alibabaMapper.selectByPrimaryKey(1));
        System.out.println(alibabaMapper.updateByPrimaryKey(alibaba));
        System.out.println(alibabaMapper.selectByPrimaryKey(1));
        throw new RuntimeException();

    }
}