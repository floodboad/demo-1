package com.wangsong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangsong.groups.Age;
import com.wangsong.groups.Name;
import com.wangsong.model.User;


@Controller
public class MUserController {
	
	
	@RequestMapping(value="/name")
	@ResponseBody
	public Object name(@Validated({Name.class}) User user,BindingResult bindingResult) {
		return "1";	
	}
	
	@RequestMapping(value="/age")
	@ResponseBody
	public Object age(@Validated({Age.class}) User user,BindingResult bindingResult) {
		return "2";	
	}
	
	
	
}
