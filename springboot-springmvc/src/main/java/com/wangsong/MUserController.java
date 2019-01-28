package com.wangsong;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.beans.PropertyEditorSupport;


@Controller
public class MUserController extends BaseController {
    @RequestMapping(value = "/name")
    @ResponseBody
    public User name(@RequestBody User user) {
        return user;
    }

    @RequestMapping(value = "/age")
    @ResponseBody
    public User age(User user) {
        return user;
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public String save(User user) {
        return user.toString();
    }

    @RequestMapping(value = "/save2")
    @ResponseBody
    public String save(String s) {
        return "<a href=" + s + ">aaa</a>";
    }


}
