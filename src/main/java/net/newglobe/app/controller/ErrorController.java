package net.newglobe.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("error")
public class ErrorController {
	public Logger logger = LoggerFactory.getLogger(ErrorController.class);

	@RequestMapping("{errorCode}")
	public String index(HttpServletRequest request, @PathVariable String errorCode) {
		return "error/" + errorCode;
	}
	
	public static void main(String[] args) {
			long sum = 1;
		 for(int i=1;i<10;i++){
			 sum *= i;
	        }
		 System.out.println(sum);
	}

}
