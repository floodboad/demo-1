package com.wangsong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.support.atomic.RedisAtomicLong;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@Service
public class RedisService {

    @Autowired
    private RedisTemplate redisTemplate;

    @Cacheable(value = "test3", key = "#id")
    public Object test3list(String id) {
        System.out.println("查询数据库");
        return id;
    }

    @CacheEvict(value = "test3", key = "#id")
    public Object test3del(String id) {
        System.out.println("删除数据库");
        return id;
    }


    @CachePut(value = "test3", key = "#id")
    public Object test3add(String id) {
        System.out.println("增加数据库");
        return id;
    }

    public synchronized Long idG(String key){
        Integer liveTime=getRemainSecondsOneDay();
        RedisAtomicLong entityIdCounter = new RedisAtomicLong(key, redisTemplate.getConnectionFactory());
        if(entityIdCounter.get()==0){
            entityIdCounter.expire(liveTime, TimeUnit.SECONDS);
        }
        entityIdCounter.getAndIncrement();
        return entityIdCounter.get();
    }

    private Integer getRemainSecondsOneDay() {
        Date currentDate=new Date();
        Calendar midnight=Calendar.getInstance();
        midnight.setTime(currentDate);
        midnight.add(midnight.DAY_OF_MONTH,1);
        midnight.set(midnight.HOUR_OF_DAY,0);
        midnight.set(midnight.MINUTE,0);
        midnight.set(midnight.SECOND,0);
        midnight.set(midnight.MILLISECOND,0);
        Integer seconds=(int)((midnight.getTime().getTime()-currentDate.getTime())/1000);
        return seconds;
    }
}
