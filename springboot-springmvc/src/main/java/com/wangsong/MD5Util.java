package com.wangsong;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

public class MD5Util {
    public static String key = "666";


    public static String md5(String string) {
        byte[] hash;
        try {
            hash = MessageDigest.getInstance("MD5").digest(string.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 is unsupported", e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MessageDigest不支持MD5Util", e);
        }
        StringBuilder hex = new StringBuilder(hash.length * 2);
        for (byte b : hash) {
            if ((b & 0xFF) < 0x10) hex.append("0");
            hex.append(Integer.toHexString(b & 0xFF));
        }
        return hex.toString();
    }


    /**
     * md5签名
     * <p>
     * 按参数名称升序，将参数值进行连接 签名
     *
     * @param appSecret
     * @param params
     * @return
     */
    public static String sign(String appSecret, TreeMap<String, String> params) {
        StringBuilder paramValues = new StringBuilder();
        params.put("appSecret", appSecret);

        for (Map.Entry<String, String> entry : params.entrySet()) {
            if (!entry.getKey().equals("sign")) {
                paramValues.append(entry.getValue());
            }
        }
        return md5(paramValues.toString());
    }

    public static void main(String[] args) {
        TreeMap<String, String> params =new TreeMap();
        params.put("name","123");
        params.put("age",null);
        System.out.println(sign(key,params));
    }


    /**
     * 请求参数签名验证
     *
     * @param appSecret
     * @param request
     * @return true 验证通过 false 验证失败
     * @throws Exception
     */
    public static boolean verifySign(String appSecret, HttpServletRequest request) throws Exception {
        TreeMap<String, String> params = new TreeMap<String, String>();

        String signStr = request.getParameter("sign");
        if (StringUtils.isBlank(signStr)) {
            throw new RuntimeException("There is no signature field in the request parameter!");
        }

        Enumeration<String> enu = request.getParameterNames();
        while (enu.hasMoreElements()) {
            String paramName = enu.nextElement().trim();
            if (!paramName.equals("sign")) {
                params.put(paramName, URLDecoder.decode(request.getParameter(paramName), "UTF-8"));
            }
        }

        if (!sign(appSecret, params).equals(signStr)) {
            return false;
        }
        return true;
    }


    public static boolean verifySignMap(String appSecret, JSONObject request) throws Exception {
        TreeMap<String, String> params = new TreeMap<String, String>();

        String signStr = request.getString("sign");
        if (StringUtils.isBlank(signStr)) {
            throw new RuntimeException("There is no signature field in the request parameter!");
        }

        Set<String> enu =  request.keySet();
        for (Iterator iter = enu.iterator(); iter.hasNext();) {
            String paramName = (String)iter.next();
            if (!paramName.equals("sign")) {
                params.put(paramName, URLDecoder.decode(request.getString(paramName), "UTF-8"));
            }
        }

        if (!sign(appSecret, params).equals(signStr)) {
            return false;
        }
        return true;
    }
}

