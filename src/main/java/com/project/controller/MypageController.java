package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mypage.impl.MypageDAOMybatis;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAOMybatis mypageService;
	
//	@RequestMapping(value = "/mypagecart.wp")
//	public String cart() {
//		System.out.println("마이페이지 장바구니 이동");
//		return "WEB-INF/view/mypage/cart.jsp";
//	}
	

	
}
