package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.order.M_addVO;
import com.project.order.OrderService;
import com.project.order.OrderVO;
import com.project.user.UserService;
import com.project.user.UserVO;

@Controller
public class Order_cartController {

	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping(value = "/oredr_m_add.wp")
	public String insertaddress(UserVO vo, M_addVO mvo, HttpSession session) {
		
		
	
		mvo.setId((String) session.getAttribute("userID"));
		
		System.out.println();
		System.out.println(mvo.getM_address_1());
		System.out.println(mvo.getM_address_2());
		System.out.println(mvo.getM_address_3());
		
		orderService.oredr_m_add(mvo);
		return "redirect:/";
	}

	@GetMapping("/order/{userID}")
	public String orderPgae(@PathVariable("userID") String userID, OrderVO ov, UserVO uvo, M_addVO mvo, Model model, HttpSession session) {
		ov.setId((String) session.getAttribute("userID"));
		
		System.out.println("내용 출력 ");
		model.addAttribute("memberInfo", userService.getUser(uvo));
		model.addAttribute("add", orderService.getm_add(mvo));
		System.out.println("주소 :" + orderService.getm_add(mvo));

		return "/order";
	}

//	@PostMapping("/order")
//	public String orderPagePost(OrderDTO od, HttpServletRequest request) {
//		
//		System.out.println(od);		
//		
//		orderService.order(od);
//		
//		MemberVO member = new MemberVO();
//		member.setMemberId(od.getMemberId());
//		
//		HttpSession session = request.getSession();
//		
//		try {
//			MemberVO memberLogin = memberService.memberLogin(member);
//			memberLogin.setMemberPw("");
//			session.setAttribute("member", memberLogin);
//			
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
//		
//		return "redirect:/main";
//	}	
//	

}
