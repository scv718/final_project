package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mypage.impl.MypageDAOMybatis;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAOMybatis mypageService;
	
	@RequestMapping(value = "/mysubscribe.wp")
	public String mysubscribe() {
		System.out.println("구독 취향 설정");
		return "WEB-INF/view/mypage/mysubscribe.jsp";
	}
}
