package com.wangsong;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author wuweifeng wrote on 2017/10/18.
 */
@Configuration
public class UserConfig {


    @Bean
    public User user() {
        return new User();
    }
}