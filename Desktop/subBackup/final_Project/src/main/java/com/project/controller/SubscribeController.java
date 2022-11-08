package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserService;
import com.project.user.UserVO;

@Controller
public class SubscribeController {
	
	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value = "/payment.wp")
	public String payment() {
		System.out.println("결제하기");
		return "WEB-INF/view/subscribe/test.jsp";
	}

	// 구독 결제하기-1
	@RequestMapping(value = "insertSubscribe1.wp", method = RequestMethod.POST)
	public String insertSubscribe1(SubscribeVO vo, UserVO vo1, HttpSession session, Model model) {
		// 로그인 체크
		String uvo = (String) session.getAttribute("userID");
		vo1.setId(uvo);
		session.setAttribute("level", userService.getUser1(vo1));
		int result = userService.getUser1(vo1);
		try {
			if (uvo == null) {
				return "singUp.wp";
			} else if (result > 0) {
				return "payment.wp";
			} else {
				vo.setId(uvo);
				vo1.setId(uvo);
				subscribeService.insertSubscribe1(vo);
				userService.updateuserle1(vo1);
				System.out.println("실행: "+ result); 
				System.out.println("구독 변경: "+ userService.updateuserle1(vo1) + " 유저 변경: "+ userService.updateuserle1(vo1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "subscribe.wp";
	}

	// 구독 결제하기-2
	@RequestMapping(value = "insertSubscribe2.wp", method = RequestMethod.POST)
	public String insertSubscribe2(SubscribeVO vo, UserVO vo1, HttpSession session, Model model) {
		// 로그인 체크
		String uvo = (String) session.getAttribute("userID");
		vo1.setId(uvo);
		session.setAttribute("level", userService.getUser1(vo1));
		int result = userService.getUser1(vo1);
		try {
			if (uvo == null) {
				return "singUp.wp";
			} else if (result > 0) {
				return "payment.wp";
			} else {
				vo.setId(uvo);
				vo1.setId(uvo);
				subscribeService.insertSubscribe2(vo);
				userService.updateuserle2(vo1);
				System.out.println("실행: "+ result); 
				System.out.println("구독 변경: "+ userService.updateuserle2(vo1) + " 유저 변경: "+ userService.updateuserle2(vo1));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "subscribe.wp";
	}
	
	
	
	// 구독 결제하기-3
@RequestMapping(value = "insertSubscribe3.wp", method = RequestMethod.POST)
public String insertSubscribe3(SubscribeVO vo, UserVO vo1, HttpSession session, Model model) {
	// 로그인 체크
	String uvo = (String) session.getAttribute("userID");
	vo1.setId(uvo);
	session.setAttribute("level", userService.getUser1(vo1));
	int result = userService.getUser1(vo1);
	try {
		if (uvo == null) {
			return "singUp.wp";
		} else if (result > 0) {
			return "payment.wp";
		} else {
			vo.setId(uvo);
			vo1.setId(uvo);
			subscribeService.insertSubscribe3(vo);
			userService.updateuserle3(vo1);	
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return "subscribe.wp";
}

	
		// 구독 취소
		@RequestMapping(value = "updateSubscribe.wp", method = { RequestMethod.POST })
		public String updateSubscribe(SubscribeVO vo, UserVO vo1, HttpSession session) {
			// 로그인 체크
			String uvo = (String) session.getAttribute("userID");
			System.out.println(uvo);
		
			if (uvo == null) {
				return "singUp.wp";
			} else {
				vo.setId(uvo);
				vo1.setId(uvo);
				subscribeService.updateSubscribe(vo);
				userService.updateuserle0(vo1);
				return "subscribe.wp";
			}
		}
		
		//마이페이지
		@RequestMapping(value = "/mypage.wp")
		public String getSubscribe1(SubscribeVO vo , HttpSession session, Model model) {
			System.out.println("마이페이지");
			vo.setId((String) session.getAttribute("userID"));
			
			System.out.println("id: "+session.getAttribute("userID"));
			System.out.println("vo: "+subscribeService.getSubscribe(vo));
			
			model.addAttribute("mylevel",subscribeService.getSubscribe(vo));		
			return "WEB-INF/view/mypage/mypage.jsp";
		}	
		
		//마이페이지 구독 조회
		@RequestMapping("/mysubscribe.wp")
		public String getSubscribe(SubscribeVO vo , HttpSession session, Model model) {
			vo.setId((String) session.getAttribute("userID"));
			
			System.out.println("id: "+session.getAttribute("userID"));
			System.out.println("vo: "+subscribeService.getSubscribe(vo));
			
			model.addAttribute("mylevel",subscribeService.getSubscribe(vo));		
			return "WEB-INF/view/mypage/mysubscribe.jsp";		
		}
		//마이페이지 취향 설정
		@RequestMapping("/mypreference.wp")
		public String setting(SubscribeVO vo, HttpSession session) {
			System.out.println("취향 설정");
			vo.setId((String)session.getAttribute("userID"));
			subscribeService.preference_Setting(vo);
			return "WEB-INF/view/user/preference.jsp";
		}
}
