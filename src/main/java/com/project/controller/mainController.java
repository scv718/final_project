package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {
	
	@RequestMapping(value = "/introDuce.do")
	public String introDuce() {
		System.out.println("소개하기");
		return "WEB-INF/view/introduce.jsp";
	}
	
	
	@RequestMapping(value = "/wineSearch.do")
	public String search() {
		System.out.println("소개하기");
		return "WEB-INF/view/winesearch.jsp";
	}
	
	@RequestMapping(value = "/subscribe.do")
	public String subscribe() {
		System.out.println("구독하기");
		return "WEB-INF/view/subscribe/subscribe.jsp";
	}
	
	public String community() {
		System.out.println("소개하기");
		return "WEB-INF/view/introduce.jsp";
	}
	
	
	@RequestMapping(value = "/loginForm.do")
	public String loginFrom() {
		System.out.println("로그인폼이동");
		return "WEB-INF/view/user/loginform.jsp";
	}
	
	

}
