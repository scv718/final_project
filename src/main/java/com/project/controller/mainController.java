package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {
	
	@RequestMapping(value = "/introDuce.wp")
	public String introDuce() {
		System.out.println("소개하기");
		return "WEB-INF/view/introduce.jsp";
	}
	
	
	@RequestMapping(value = "/wineSearch.wp")
	public String search() {
		System.out.println("소개하기");
		return "WEB-INF/view/winesearch.jsp";
	}
	

<<<<<<< HEAD
<<<<<<< HEAD
	@RequestMapping(value = "/subscribe.do")
=======
	@RequestMapping(value = "/subscribe.wp")
>>>>>>> ef20d685120c0b30dfb65690e3b7ed0179e45953
=======
	@RequestMapping(value = "/subscribe.wp")
>>>>>>> ef20d685120c0b30dfb65690e3b7ed0179e45953
	public String subscribe() {
		System.out.println("구독하기");
		return "WEB-INF/view/subscribe/subscribe.jsp";
	}

<<<<<<< HEAD
<<<<<<< HEAD
	
=======
>>>>>>> ef20d685120c0b30dfb65690e3b7ed0179e45953
=======
>>>>>>> ef20d685120c0b30dfb65690e3b7ed0179e45953

	
	
	@RequestMapping(value = "/userCertification.wp")
	public String userCertification() {
		System.out.println("본인인증");
		return "WEB-INF/view/user/userCertification.jsp";
	}
	
	
	@RequestMapping(value = "/singUp.wp")
	public String singUp() {
		System.out.println("로그인폼이동");
		return "WEB-INF/view/user/singUp.jsp";
	}
	
	
	@RequestMapping(value = "/loginForm.wp")
	public String loginFrom() {
		System.out.println("로그인폼이동");
		return "WEB-INF/view/user/loginform.jsp";
	}
	
	

}
