package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.subscribe.SubscribeVO;
import com.project.subscribe.impl.SubscribeDAOMybatis;
import com.project.user.UserService;
import com.project.user.UserVO;

@Controller
public class SubscribeController {
	
	@Autowired
	private SubscribeDAOMybatis subscribeService;
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "/payment.wp")
	public String payment() {
		System.out.println("결제하기");
		return "WEB-INF/view/subscribe/test.jsp";
	}

	// 구독 결제하기-1
	@RequestMapping(value = "insertSubscribe1.wp", method =RequestMethod.POST)
	public String insertSubscribe1(SubscribeVO vo, UserVO vo1, HttpSession session) {
		// 로그인 체크
		String uvo = (String) session.getAttribute("userID");
		System.out.println(uvo);
	
		if (uvo == null) {
			return "singUp.wp";
			
		} else if(vo1 != null){
			//구독 중복
			vo1.setId(uvo);
			session.setAttribute("level", userService.getUser1(vo1));
			System.out.println("vo1.getId(): "+vo1.getId());
			return "payment.wp";
		}else {
			subscribeService.insertSubscribe1(vo);
			return "subscribe.wp";
		}
	}

	// 구독 결제하기-2
	@RequestMapping(value = "insertSubscribe2.wp", method = { RequestMethod.POST })
		public String insertSubscribe2(SubscribeVO vo, UserVO vo1, HttpSession session) {
			// 로그인 체크
			String uvo = (String) session.getAttribute("userID");
			System.out.println(uvo);
		
			if (uvo == null) {
				return "singUp.wp";
				
			} else if(vo1 != null){
				//구독 중복
				vo1.setId(uvo);
				session.setAttribute("level", userService.getUser1(vo1));
				System.out.println("vo1.getId(): "+vo1.getId());
				return "payment.wp";
			}else {
				subscribeService.insertSubscribe2(vo);
				return "subscribe.wp";
			}
	}
	// 구독 결제하기-3
	@RequestMapping(value = "insertSubscribe3.wp", method = { RequestMethod.POST })
	public String insertSubscribe3(SubscribeVO vo, UserVO vo1, HttpSession session) {
		// 로그인 체크
		String uvo = (String) session.getAttribute("userID");
		System.out.println(uvo);
	
		if (uvo == null) {
			return "singUp.wp";
			
		} else if(vo1 != null){
			//구독 중복
			vo1.setId(uvo);
			session.setAttribute("level", userService.getUser1(vo1));
			System.out.println("vo1.getId(): "+vo1.getId());
			return "payment.wp";
		}else {
			subscribeService.insertSubscribe3(vo);
			return "subscribe.wp";
		}
}
	
	// 구독 취소
		@RequestMapping(value = "updateSubscribe.wp", method = { RequestMethod.POST })
		public String updateSubscribe(SubscribeVO vo, HttpServletRequest session) {
			// 로그인 체크
			String uvo = (String) session.getAttribute("userID");
			System.out.println(uvo);
		
			if (uvo == null) {
				return "singUp.wp";
			} else {
				subscribeService.updateSubscribe(vo);
				return "subscribe.wp";
			}
		}
}
