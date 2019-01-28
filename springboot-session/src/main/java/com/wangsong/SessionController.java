package com.wangsong;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;


@RestController
public class SessionController {


    @RequestMapping(value = "/session")
    public Object session(HttpServletRequest request, String name) {
        if (request.getSession().getAttribute(name) == null) {
            request.getSession().setAttribute(name, name);
            return Thread.currentThread().getName() + "set:" + name;
        } else {
            return Thread.currentThread().getName() + "get:" + request.getSession().getAttribute(name);
        }

    }


}
