package com.project.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mypage.impl.MypageDAOMybatis;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserService;
import com.project.wine.ProductService;
import com.project.wine.WineVO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAOMybatis mypageService;
	@Autowired
	private UserService userService;
	
	@Autowired
	private SubscribeService subscribeService;
	@Autowired
	private ProductService productService;

//	@RequestMapping(value = "/mypagecart.wp")
//	public String cart() {
//		System.out.println("마이페이지 장바구니 이동");
//		return "WEB-INF/view/mypage/cart.jsp";
//	}
	
	@RequestMapping(value = "/subscribe-4.wp")
	public String setting(SubscribeVO vo, HttpSession session, WineVO wvo, Model model) {
		String id = (String) session.getAttribute("userID");
		vo.setId(id);
		
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
			
		return  "WEB-INF/view/subscribe/subscribe-4.jsp";
	}
	
}
