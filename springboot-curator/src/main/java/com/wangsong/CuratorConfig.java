package com.wangsong;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

@Configuration
public class CuratorConfig {

    @Bean
    public CuratorFramework curatorFramework() {
        CuratorFramework client = CuratorFrameworkFactory.builder().connectString("localhost:2181")
                .sessionTimeoutMs(1000)    // 连接超时时间
                .connectionTimeoutMs(1000) // 会话超时时间
                // 刚开始重试间隔为1秒，之后重试间隔逐渐增加，最多重试不超过三次
                .retryPolicy(new ExponentialBackoffRetry(1000, 3))
                .build();
        client.start();
        return client;
    }
}
