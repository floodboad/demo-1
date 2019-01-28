package com.wangsong.model;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Length;

import com.wangsong.groups.Age;
import com.wangsong.groups.Name;
import com.wangsong.validator.PhoneNo;

public class User {
	@Length(min=3,max=3, groups = { Name.class })
	@PhoneNo(groups = { Name.class }, message = "手机号错误")
	private String name;
	@Max(value = 100, message = "年龄不能大于100岁", groups = { Name.class,Age.class  }) 
	@Min(value= 18 ,message= "必须年满18岁！", groups = { Name.class,Age.class } )  
	private String age;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	
}
