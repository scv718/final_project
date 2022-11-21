package com.project.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	
	//구독페이지
	@RequestMapping(value = "/subscribe.wp")
	public String subscribe(UserVO uvo,SubscribeVO svo, HttpSession session,Model model) {
		System.out.println("구독하기");
		uvo.setId((String) session.getAttribute("userID"));
		svo.setId((String) session.getAttribute("userID"));
		if(uvo.getId() != null){
		model.addAttribute("user", userSerivce.getUser(uvo));
		model.addAttribute("mylevel", subscribeService.getSubscribe(svo));
		}
		return "WEB-INF/view/subscribe/subscribe.jsp";
	}

	// 마이페이지
	@RequestMapping(value = "/mypage.wp")
	public String getSubscribe1(SubscribeVO vo, HttpSession session, Model model, WineVO wvo) {
		String id = (String) session.getAttribute("userID");
		vo.setId(id);
		model.addAttribute("mylevel", subscribeService.getSubscribe(vo));
		model.addAttribute("sub", subscribeService.getLevel(vo));
		if(subscribeService.getLevel(vo).getS_product() != null) {
			wvo.setW_no(Integer.parseInt(subscribeService.getLevel(vo).getS_product()));
			productService.getProductdetail(wvo);
			model.addAttribute("product", productService.getProductdetail(wvo));
			wvo.setW_no(Integer.parseInt(subscribeService.getLevel(vo).getS_product2()));
			productService.getProductdetail(wvo);
			model.addAttribute("product2", productService.getProductdetail(wvo));
			wvo.setW_no(Integer.parseInt(subscribeService.getLevel(vo).getS_product3()));
			productService.getProductdetail(wvo);
			model.addAttribute("product3", productService.getProductdetail(wvo));
		}
		return "WEB-INF/view/mypage/mypage.jsp";
	}

	// 마이페이지 구독 조회
	@RequestMapping("/mysubscribe.wp")
	public String getSubscribe(SubscribeVO vo, HttpSession session, Model model) throws ParseException {
		System.out.println("구독/취향 설정");
		String id = (String) session.getAttribute("userID");
		vo.setId(id);
		model.addAttribute("mylevel", subscribeService.getSubscribe(vo));
		model.addAttribute("date", subscribeService.getLevel(vo));
	
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String zer = "0000-00-00";
		System.out.println(subscribeService.getLevel(vo) + "date");
		model.addAttribute("zer", zer);
		if (id == null) {
			return "signUp.wp"; 
		}
		
		
		return "WEB-INF/view/mypage/mysubscribe.jsp";
	}
	
	// 마이페이지 구독 설정
	@RequestMapping("/mysubscribes.wp")
	public String mysubscribes(SubscribeVO vo, HttpSession session, Model model) {
		vo.setId((String) session.getAttribute("userID"));
		int result = subscribeService.getSubscribe(vo);
		model.addAttribute("mylevel", subscribeService.getSubscribe(vo));

		if (result == 0) {
			System.out.println("구독X");
			return "subscribe.wp";
			// 구독 O
		} else if (result > 0) {
			System.out.println("구독O");
			return "subscribe-3.wp";
		}
		return "subscribe.wp";
	}
	
	// 마이페이지 취향 설정
	@RequestMapping("/mypreference.wp")
	public String setting(SubscribeVO vo, HttpSession session, Model model) {
		vo.setId((String) session.getAttribute("userID"));
		subscribeService.preference_Setting(vo);
		
		return "WEB-INF/view/user/preference.jsp";
	}

	// 구독 결제 -1
	@RequestMapping(value = "/subscribe-1.wp")
	public String subscribePayment1(UserVO uvo,SubscribeVO vo,HttpSession session) {
		String id = (String) session.getAttribute("userID");
		uvo.setId(id);
		vo.setId(id);
	
		try {
			if (id == null) {
				return "signUp.wp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "WEB-INF/view/subscribe/subscribe-1.jsp";
	}

	// 결제1
	@RequestMapping(value = "/subscribeP.wp")
	public String subscribePayment1(AddressVO avo, UserVO uvo, WineVO wvo, SubscribeVO svo, Model model,
			HttpSession session, HttpServletResponse response) {
		String id = (String) session.getAttribute("userID");
		uvo.setId(id);
		avo.setId(uvo.getId());
		svo.setId(uvo.getId());
		model.addAttribute("product", productService.subscribeW1(wvo));
		model.addAttribute("subscribeW", productService.subscribeW1(wvo));
		AddressVO add = addressService.selectDefaultAddress(avo);
		if (add != null) {
			model.addAttribute("defaultadd", add);
		}
		if (addressService.selectAddress(avo) != null) {
			model.addAttribute("anotheradd", addressService.selectAddress(avo));
		}
		if(uvo.getId() == null){
			return "signUp.wp";
			}else{
				model.addAttribute("user", userSerivce.getUser(uvo));
				model.addAttribute("mylevel", subscribeService.getSubscribe(svo));
				subscribeService.getSubscribe(svo);
				return "WEB-INF/view/subscribe/subscribe-2.jsp";
			}
	
	}

	// 결제2
	@RequestMapping(value = "/subscribeM.wp")
	public String subscribePayment2(AddressVO avo, UserVO uvo, WineVO wvo, SubscribeVO svo, Model model,
			HttpSession session, HttpServletResponse response) {
		String id = (String) session.getAttribute("userID");

		uvo.setId(id);
		avo.setId(uvo.getId());
		svo.setId(uvo.getId());


		model.addAttribute("product", productService.subscribeW2(wvo));
		model.addAttribute("subscribeW", productService.subscribeW2(wvo));
		
		AddressVO add = addressService.selectDefaultAddress(avo);
		if (add != null) {
			model.addAttribute("defaultadd", add);
		}
		if (addressService.selectAddress(avo) != null) {
			model.addAttribute("anotheradd", addressService.selectAddress(avo));
		}
		if(uvo.getId() == null){
			return "signUp.wp";
			}else{
				model.addAttribute("user", userSerivce.getUser(uvo));
				model.addAttribute("mylevel", subscribeService.getSubscribe(svo));
				System.out.println(subscribeService.getSubscribe(svo) + "오류");

				subscribeService.getSubscribe(svo);
				return "WEB-INF/view/subscribe/subscribe-2.jsp";
			}
	
	}

	// 결제3
	@RequestMapping(value = "/subscribeG.wp")
	public String subscribePayment3(AddressVO avo, UserVO uvo, WineVO wvo, SubscribeVO svo, Model model,
			HttpSession session, HttpServletResponse response) {
		String id = (String) session.getAttribute("userID");

		uvo.setId(id);
		avo.setId(uvo.getId());
		svo.setId(uvo.getId());
		model.addAttribute("user", userSerivce.getUser(uvo));
		session.setAttribute("level", userService.getUser(uvo));
		
		int result = subscribeService.getSubscribe(svo);

		model.addAttribute("product", productService.subscribeW3(wvo));
		model.addAttribute("subscribeW", productService.subscribeW3(wvo));
		AddressVO add = addressService.selectDefaultAddress(avo);
		if (add != null) {
			model.addAttribute("defaultadd", add);
		}
		if (addressService.selectAddress(avo) != null) {
			model.addAttribute("anotheradd", addressService.selectAddress(avo));
		}
		if(uvo.getId() == null){
			return "signUp.wp";
			}else{
				model.addAttribute("user", userSerivce.getUser(uvo));
				model.addAttribute("mylevel", subscribeService.getSubscribe(svo));
				System.out.println(subscribeService.getSubscribe(svo) + "오류");

				subscribeService.getSubscribe(svo);
				return "WEB-INF/view/subscribe/subscribe-2.jsp";
			}
	}
	
	//관리자
	@RequestMapping(value="/adminSubscription.wp")
	public String getUserList(SubscribeVO svo, Model model){
//	model.addAttribute("UserList", userService.getUserList(vo));
	model.addAttribute("AllList", subscribeService.allsubscriptList(svo));
	return "WEB-INF/view/admin/adminsubscription.jsp";
	}

}
