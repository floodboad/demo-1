package com.wangsong;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.stereotype.Component;
import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.nio.charset.Charset;
import java.util.TreeMap;

@Component
public class MyMessageConverter extends AbstractHttpMessageConverter<Object> {

    public MyMessageConverter() {
        // 构造方法中指明consumes（req）和produces（resp）的类型，指明这个类型才会使用这个converter
        super(MediaType.APPLICATION_JSON);


    }

    @Override
    protected boolean supports(Class aClass) {
        return User.class.equals(aClass);
    }

    @Override
    protected Object readInternal(Class aClass, HttpInputMessage httpInputMessage) throws IOException, HttpMessageNotReadableException {
        String temp = StreamUtils.copyToString(httpInputMessage.getBody(), Charset.forName("UTF-8"));
        JSONObject jsonObject = JSON.parseObject(temp);
        try {
            if (!MD5Util.verifySignMap(MD5Util.key, jsonObject)) {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //解密
        return JSON.parseObject(jsonObject.toString(), aClass);
    }

    @Override
    protected void writeInternal(Object object, HttpOutputMessage outputMessage) throws IOException, HttpMessageNotWritableException {
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(object);
        JSONObject jsonObject = JSON.parseObject(json);

        //加密
        TreeMap<String, String> params = JSON.parseObject(jsonObject.toString(), TreeMap.class);
        jsonObject.put("sign", MD5Util.sign(MD5Util.key, params));
        String result = JSON.parseObject(jsonObject.toString()).toString();
        outputMessage.getBody().write(result.getBytes());
    }
}
