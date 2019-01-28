package com.wangsong;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Decoder;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.UUID;


@Controller
public class MUserController {


    @RequestMapping(value = "/age")
    @ResponseBody
    public HashMap age() throws IOException {
        HashMap hm=new HashMap();
        hm.put("i1","/qy.jpg");
        hm.put("i2","/qrcode.jpg");
        hm.put("text","飒飒大师飒飒大师大师大ascscasca请问发过去飒飒大师asdadsadq大师大风啊请问发过去飒飒大师大师大风啊请问发过q去飒wd飒大师大scascasca师大师大风啊请问发过去大师大风啊请问发过去a");

        return hm;
    }

    @RequestMapping(value = "/imgsrc")
    @ResponseBody
    public String up(@RequestParam("imageName") MultipartFile imageName) throws IOException {
        String imgFilePath = "D:\\test\\"+UUID.randomUUID() +".jpg";//新生成的图片
        byte[] bytes = imageName.getBytes();
        Path path = Paths.get(imgFilePath);
        Files.write(path, bytes);
        return imgFilePath;
    }



}
