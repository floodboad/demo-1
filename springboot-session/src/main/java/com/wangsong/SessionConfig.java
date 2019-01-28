package com.wangsong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.session.data.redis.config.annotation.web.http.EnableRedisHttpSession;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

//这个类用配置redis服务器的连接
//maxInactiveIntervalInSeconds为SpringSession的过期时间（单位：秒）

@Configuration
@EnableRedisHttpSession(maxInactiveIntervalInSeconds= 1800)
public class SessionConfig {
	
}
