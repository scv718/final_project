package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.subscribe.SubscribeVO;
import com.project.subscribe.impl.SubscribeDAOMybatis;
import com.project.user.UserVO;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeDAOMybatis subscribeService;

	// 구독 추가
	@RequestMapping(value = "insertUser.wp", method = RequestMethod.POST)
	@ResponseBody
	public String insertSubscribePOST(SubscribeVO vo, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("id");
		System.out.println((UserVO) session.getAttribute("id"));
		if (uvo == null) {
			return "login.jsp?error=1";
		} else {
			
//			subscribeService.insertSubscribe(vo);
//			int result = subscribeService.insertSubscribe(vo);
//				return result + "";
		}
		return null;
	}

	/* 결제 페이지 이동 */
	@RequestMapping(value = "insertUser.wp", method = RequestMethod.POST)
	@ResponseBody
	public String getSubscribeGET(@PathVariable("Id") SubscribeVO vo, Model model) {
		model.addAttribute("cartInfo", subscribeService.getSubscribe(vo));
		return "/subscribe";
	}

}