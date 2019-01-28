package com.wangsong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

import java.util.List;

@Configuration
public class MyWebMvc extends WebMvcConfigurationSupport {


    @Autowired
    private MyMessageConverter myMessageConverter;

    @Autowired
    private MyInterceptor myInterceptor;

    @Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
        converters.add(myMessageConverter);
        super.addDefaultHttpMessageConverters(converters);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        registry.addInterceptor(myInterceptor).addPathPatterns("/age/**");


    }
}


