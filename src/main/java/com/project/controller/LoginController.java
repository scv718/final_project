package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.user.UserVO;
import com.project.user.impl.UserDAOMybatis;
@Controller
public class LoginController {
	
	@Autowired
	private UserDAOMybatis userService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginView(UserVO vo, HttpSession session) {
		System.out.println("로그인 인증 처리.....");
		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야합니다");
		}
		if(userService.getUser(vo) != null) {
			session.setAttribute("login", userService.getUser(vo).getId());
			session.setAttribute("userID", userService.getUser(vo).getId());
			session.setAttribute("userName", userService.getUser(vo).getName());
			return "getBoardList.do";
		}else {
			return "login.jsp?error=1";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "login.jsp";
	}

}
