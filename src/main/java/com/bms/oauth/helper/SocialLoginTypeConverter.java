package com.bms.oauth.helper;

import org.springframework.context.annotation.Configuration;
import com.bms.oauth.helper.SocialLoginType;
import org.springframework.core.convert.converter.Converter;

//controller에서 socialLoginType 파라미터(@PathVariable을통해)받는데 enum타입의 대문자 값을 소문자로 mapping가능하도록하기위해 생성
@Configuration
public class SocialLoginTypeConverter implements Converter<String,SocialLoginType> {
	@Override
	public SocialLoginType convert(String s) {
		return SocialLoginType.valueOf(s.toUpperCase());
	}

}
