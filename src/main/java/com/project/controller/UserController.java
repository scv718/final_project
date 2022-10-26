package com.project.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.user.UserVO;
import com.project.user.impl.UserDAOMybatis;
@Controller
public class UserController {
	
	@Autowired
	private UserDAOMybatis userService;
	
	@RequestMapping(value = "login.wp", method = RequestMethod.POST)
	public String loginView(UserVO vo, HttpSession session) {
	
		System.out.println("로그인 인증 처리.....");
		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야합니다");
		}
		if(userService.getUser(vo) != null) {
			System.out.println("123");
			session.setAttribute("login", userService.getUser(vo).getId());
			System.out.println("1234");
			session.setAttribute("userID", userService.getUser(vo).getId());
			session.setAttribute("userName", userService.getUser(vo).getM_name());
			return "index.jsp";
		}else {
			return "login.jsp?error=1";
		}
	}
	
	@RequestMapping("/logout.wp")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "index.jsp";
	}

	
	@RequestMapping("idCheck.wp")
	@ResponseBody
	public Map<Object, Object> check(@RequestBody String id) {
		System.out.println("아이디체크 컨트롤러");
		int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = userService.checkUser(id);
        map.put("cnt", count);
 
        return map;
	}
	
	@RequestMapping(value="insertUser.wp" , method = RequestMethod.POST)
	@ResponseBody
	public String insertUser(UserVO vo, HttpSession session) {
		System.out.println("회원가입 실행");
//		
//		vo.setM_birth((String)session.getAttribute("birthday"));
//		vo.setM_name((String)session.getAttribute("name"));
//		vo.setM_phone((String)session.getAttribute("phone"));
		
		
		vo.setM_birth("1995-07-18");
		vo.setM_name("박상현");
		vo.setM_phone("010-9618-3516");
		System.out.println(vo.getId());
		System.out.println(vo.getM_pw());
		System.out.println(vo.getM_email());
		System.out.println(vo.getM_birth());
		userService.insertUser(vo);
		
		
		
        return "index.jsp";
	}
	


}
