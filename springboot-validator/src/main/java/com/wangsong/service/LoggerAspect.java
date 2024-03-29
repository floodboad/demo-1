package com.wangsong.service;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;


@Aspect
@Component
public class LoggerAspect {
    
    //环绕增强
    @Around(value="execution(* com.wangsong.controller.*.*(..)) && args(..,bindingResult)")
    public Object around(ProceedingJoinPoint pj,BindingResult bindingResult) throws Throwable{
    	 Object retVal;
         if (bindingResult.hasErrors()) {
             retVal = resultToList(bindingResult);
         } else {
             retVal = pj.proceed();
         }
         System.out.println(retVal+"1111");
         return retVal;
    }
	public  List<String> resultToList (BindingResult result){
		List<FieldError>  err=result.getFieldErrors();
	    FieldError fe;
	    List<String> list=new ArrayList<String>();
	    for (int i = 0; i < err.size(); i++) {
	        fe=err.get(i);
	        list.add(fe.getDefaultMessage());//得到错误消息
	    }
		return list;
	}
	
}
