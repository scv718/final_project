package com.project.controller;

import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class ErrorController {
	

	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException e){
		return "WEB-INF/view/error/errorPage404.jsp";
	}
    // 데이터베이스오류
	@ExceptionHandler(DataAccessException.class)
	public String handleDataAccessException(DataAccessException e) {
		e.printStackTrace();
		return "WEB-INF/view/error/errorPage404.jsp";
	}
	// 500에러처리
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		e.printStackTrace();
		return "WEB-INF/view/error/errorPage404.jsp";
	}	
	@ExceptionHandler(NullPointerException.class)
	public String NullPointerException(Exception e) {
		e.printStackTrace();
		return "WEB-INF/view/error/errorPage404.jsp";
	}	

}
