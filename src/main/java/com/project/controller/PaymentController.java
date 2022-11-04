package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.user.UserService;
import com.project.user.UserVO;
import com.project.wine.ProductService;
import com.project.wine.WineVO;

@Controller
public class PaymentController {
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userSerivce;
	
	@RequestMapping("oredr_m_add.wp")
	public String oredr_m_add(){
		return null;
	}
	
	@RequestMapping("payment.wp")
	public String payment(WineVO vo, Model model, UserVO uvo, HttpSession session) {
		
		System.out.println("상품 결제 이동");
		System.out.println(productService.getProductdetail(vo));
		uvo.setId((String) session.getAttribute("userID"));
		model.addAttribute("product", productService.getProductdetail(vo));
		model.addAttribute("user", userSerivce.getUser(uvo));
		return "WEB-INF/view/product/payment.jsp";
		
	}
	
}
