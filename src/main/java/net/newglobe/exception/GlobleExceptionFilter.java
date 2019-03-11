package net.newglobe.exception;

import java.sql.SQLException;
import java.util.List;

import org.springframework.validation.BindException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import net.newglobe.model.vo.Result;

@ControllerAdvice
public class GlobleExceptionFilter {

	@ResponseBody
	@ExceptionHandler(value = java.lang.Exception.class)
	public Result myException(Exception ex) {
		Result result = new Result();
		result.setSuccess(false);
		result.setMessage("遇到异常");
		return result;
	}

	@ResponseBody
	@ExceptionHandler(value = BindException.class)
	public Result BindException(BindException ex) {
		List<FieldError> fieldErrors = ex.getFieldErrors();
//		for(FieldError f : fieldErrors) {
//			System.out.println(JSON.toJSONString(f));
//			System.out.println(f.getField()+":"+f.getDefaultMessage());
//		}
		Result result = new Result();
		result.setSuccess(false);
		result.setMessage("<font style='color:red'>"+fieldErrors.get(0).getDefaultMessage()+"</font>");
		return result;
	}

	@ResponseBody
	@ExceptionHandler(value = SQLException.class)
	public Result nullException(Exception ex) {
		Result result = new Result();
		result.setSuccess(false);
		result.setMessage("数据操作异常");
		return result;
	}

}
