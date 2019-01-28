package com.wangsong.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import org.springframework.beans.factory.annotation.Autowired;

import com.wangsong.service.TestService;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * 手机号码验证
 * User: zhoujingjie
 * Date: 14-11-1
 * Time: 上午10:45
 */
public class PhoneNoValidator implements ConstraintValidator<PhoneNo,String> {
	@Autowired
	private TestService testService;
    @Override
    public void initialize(PhoneNo constraintAnnotation) {
    }


    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
    	testService.test(value);
        if(value.equals("138")){
            return true;
        }
        return false;
    }
}
