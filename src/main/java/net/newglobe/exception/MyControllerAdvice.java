package net.newglobe.exception;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class MyControllerAdvice {
	
	@ResponseBody
	@ExceptionHandler(value=java.lang.Exception.class)
	public Map<String,Object> myException(Exception ex){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("code", 500);
		map.put("msg", "出错了");
		return map;
	}
	
	@ResponseBody
	@ExceptionHandler(value=java.lang.NullPointerException.class)
	public Map<String,Object> nullException(Exception ex){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("code", 500);
		map.put("msg", "出错了");
		return map;
	}

}
