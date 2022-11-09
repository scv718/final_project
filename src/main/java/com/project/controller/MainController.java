package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mainmenu.MenuService;
import com.project.mainmenu.MenuVO;
import com.project.subscribe.SubscribeVO;

@Controller
public class MainController {
	
	@Autowired
	MenuService menuService;
	@RequestMapping(value = {"/", "/index.wp"})
	public String index(Model model, MenuVO vo) {
		System.out.println("메인페이지");
		
		model.addAttribute("bestMenuList", menuService.bestMenu(vo));
		
		return "index.jsp";	
	}
	@RequestMapping(value = "/introDuce.wp")
	public String introDuce() {
		System.out.println("소개하기");
		return "WEB-INF/view/introduce.jsp";
	}

	@RequestMapping(value = "/userCertification.wp")
	public String userCertification() {
		System.out.println("본인인증");
		return "WEB-INF/view/user/userCertification.jsp";
	}
	
	
	@RequestMapping(value = "/signUp.wp")
	public String singUp() {
		System.out.println("로그인폼이동");
		return "WEB-INF/view/user/singUp.jsp";
	}
	
	
	@RequestMapping(value = "/loginForm.wp")
	public String loginFrom() {
		System.out.println("로그인폼이동");
		return "WEB-INF/view/user/loginform.jsp";
	}

	
	@RequestMapping(value = "/forgotinfo.wp")
	public String forgotinfo() {
		System.out.println("유저정보찾기");
		return "WEB-INF/view/user/userinfofind.jsp";
	}
	
	
	
}
