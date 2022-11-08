package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.cart.CartService;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.AddressService;
import com.project.user.AddressVO;
import com.project.user.UserService;
import com.project.user.UserVO;
import com.project.wine.ProductService;
import com.project.wine.WineVO;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeService subscribeService;
	@Autowired
	private UserService userService;
	@Autowired
	AddressService addressService;
	@Autowired
	CartService cartService;
	@Autowired
	UserService userSerivce;
	@Autowired
	ProductService productService;

	// 구독 결제하기-1
		@RequestMapping(value = "insertSubscribe1.wp", method = RequestMethod.POST)
		public String insertSubscribe1(SubscribeVO vo, UserVO vo1, HttpSession session, Model model) {
			// 로그인 체크
			String uvo = (String) session.getAttribute("userID");
			vo1.setId(uvo);
			session.setAttribute("level", userService.getUser1(vo1));
			
			try {
				if (uvo == null) {
					return "singUp.wp";
			
				} else {
					vo.setId(uvo);
					vo1.setId(uvo);
					subscribeService.insertSubscribe1(vo);
					subscribeService.liset_deli_price(vo);
					userService.updateuserle1(vo1);
					
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
			return "subscribe.wp";
		}
		
	// 구독 취소
	@RequestMapping(value = "updateSubscribe.wp", method = { RequestMethod.POST })
	public String updateSubscribe(SubscribeVO vo,  UserVO uvo, HttpSession session) {
		// 로그인 체크
		String id = (String) session.getAttribute("userID");
		session.setAttribute("level", userService.getUser1(uvo));
		int result = userService.getUser1(uvo);

		if (id == null) {
			return "singUp.wp";
		}	else if (result > 0) {
			return "payment.wp";
		
		} else {
			vo.setId(id);
			uvo.setId(id);
			subscribeService.updateSubscribe(vo);
			subscribeService.liset_deli_price_up(vo);
			userService.updateuserle0(uvo);
			return "subscribe.wp";
		}
	}

	// 마이페이지
	@RequestMapping(value = "/mypage.wp")
	public String getSubscribe1(SubscribeVO vo, HttpSession session, Model model) {
		System.out.println("마이페이지");
		String id = (String) session.getAttribute("userID");
		vo.setId(id);
		model.addAttribute("mylevel", subscribeService.getSubscribe(vo));
		return "WEB-INF/view/mypage/mypage.jsp";
	}

	// 마이페이지 구독 조회
	@RequestMapping("/mysubscribe.wp")
	public String getSubscribe(SubscribeVO vo, HttpSession session, Model model,HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("구독/취향 설정");
		
		String id = (String) session.getAttribute("userID");
		vo.setId(id);
		
		model.addAttribute("mylevel", subscribeService.getSubscribe(vo));
		int result = subscribeService.getSubscribe(vo);
		System.out.println(result);
		if (id == null) {
			return "singUp.wp";
		//구독 X
		}else if (result == 0) {
			System.out.println("구독X");
			request.setAttribute("msg", "구독 수정은 구독 후 가능합니다.");
			return "subscribe.wp";
		//구독 O
		}else if (result > 0) {
			System.out.println("구독O");
			request.setAttribute("msg", "구독 수정은 취소 후 가능합니다.");
			return "subscribe-3.wp";
		}
		return "subscribe.wp";
	}

	// 마이페이지 취향 설정
	@RequestMapping("/mypreference.wp")
	public String setting(SubscribeVO vo, HttpSession session, Model model) {
		System.out.println("취향 설정");
		vo.setId((String) session.getAttribute("userID"));
		subscribeService.preference_Setting(vo);
		return "WEB-INF/view/user/preference.jsp";
	}

	// 구독 결제 -1
	@RequestMapping(value = "/subscribe-1.wp")
	public String subscribePayment1(HttpSession session) {
		System.out.println("구독 결제 폼 -1");

		String id = (String) session.getAttribute("userID");
		System.out.println(id);

		try {
			if (id == null) {
				return "singUp.wp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "WEB-INF/view/subscribe/subscribe-1.jsp";
	}

	//결제1
	@RequestMapping(value = "/subscribeP.wp")
		public String subscribePayment1(AddressVO avo, UserVO uvo, WineVO wvo, SubscribeVO svo, Model model, HttpSession session, HttpServletResponse response) {
			System.out.println("구독 결제 폼 -2");
			String id = (String) session.getAttribute("userID");
			
			uvo.setId(id);
			avo.setId(uvo.getId());
			svo.setId(uvo.getId());
			model.addAttribute("user", userSerivce.getUser(uvo));
		
			session.setAttribute("level", userService.getUser1(uvo));
			int result = userService.getUser1(uvo);
			

			model.addAttribute("product",productService.subscribeW1(wvo));	
			model.addAttribute("subscribeW",productService.subscribeW1(wvo));	
			try {
				if (id == null) {
					return "singUp.wp";	
				}else if (result > 0) {
					svo.setId(id);
					uvo.setId(id);
					
					System.out.println("id: " + session.getAttribute("userID"));
					System.out.println("vo: " + subscribeService.getSubscribe(svo));
					subscribeService.getSubscribe(svo);
				
					return "subscribe-1.wp";
			}
			
			if(addressService.selectDefaultAddress(avo) != null) {
				model.addAttribute("defaultadd", addressService.selectDefaultAddress(avo));
			}
			if(addressService.selectAddress(avo) != null) {
				model.addAttribute("anotheradd", addressService.selectAddress(avo));
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return "WEB-INF/view/subscribe/subscribe-2.jsp";
	}
	// 결제2
	@RequestMapping(value = "/subscribeM.wp")
		public String subscribePayment2(AddressVO avo, UserVO uvo, WineVO wvo, SubscribeVO svo, Model model, HttpSession session, HttpServletResponse response) {
			System.out.println("구독 결제 폼 -2");
			String id = (String) session.getAttribute("userID");
			
			uvo.setId(id);
			avo.setId(uvo.getId());
			svo.setId(uvo.getId());
			model.addAttribute("user", userSerivce.getUser(uvo));

			session.setAttribute("level", userService.getUser1(uvo));
			int result = userService.getUser1(uvo);

			model.addAttribute("product",productService.subscribeW2(wvo));	
			model.addAttribute("subscribeW",productService.subscribeW2(wvo));
		
			try {
				if (id == null) {
					return "singUp.wp";	
				}else if (result > 0) {
					svo.setId(id);
					uvo.setId(id);
					
					System.out.println("id: " + session.getAttribute("userID"));
					System.out.println("vo: " + subscribeService.getSubscribe(svo));
					subscribeService.getSubscribe(svo);
				
					return "subscribe-1.wp";
			}
			
			if(addressService.selectDefaultAddress(avo) != null) {
				model.addAttribute("defaultadd", addressService.selectDefaultAddress(avo));
			}
			if(addressService.selectAddress(avo) != null) {
				model.addAttribute("anotheradd", addressService.selectAddress(avo));
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return "WEB-INF/view/subscribe/subscribe-2.jsp";
	}
	// 결제3
	@RequestMapping(value = "/subscribeG.wp")
		public String subscribePayment3(AddressVO avo, UserVO uvo, WineVO wvo, SubscribeVO svo, Model model, HttpSession session, HttpServletResponse response) {
			System.out.println("구독 결제 폼 -2");
			String id = (String) session.getAttribute("userID");		
					
			uvo.setId(id);
			avo.setId(uvo.getId());
			svo.setId(uvo.getId());
			model.addAttribute("user", userSerivce.getUser(uvo));
		
			session.setAttribute("level", userService.getUser(uvo));
			int result = userService.getUser1(uvo);

			model.addAttribute("product",productService.subscribeW3(wvo));	
			model.addAttribute("subscribeW",productService.subscribeW3(wvo));	
			try {
				if (id == null) {
					return "singUp.wp";	
				}else if (result > 0) {
					svo.setId(id);
					uvo.setId(id);
					
					System.out.println("id: " + session.getAttribute("userID"));
					System.out.println("vo: " + subscribeService.getSubscribe(svo));
					subscribeService.getSubscribe(svo);
				
					return "subscribe-1.wp";
			}
			
			if(addressService.selectDefaultAddress(avo) != null) {
				model.addAttribute("defaultadd", addressService.selectDefaultAddress(avo));
			}
			if(addressService.selectAddress(avo) != null) {
				model.addAttribute("anotheradd", addressService.selectAddress(avo));
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return "WEB-INF/view/subscribe/subscribe-2.jsp";
	}
		
}
