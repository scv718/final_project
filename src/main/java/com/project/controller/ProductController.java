package com.project.controller;

import java.util.ArrayList;
import java.util.List;

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
public class ProductController {

	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userSerivce;
	
	
	@RequestMapping("product.wp")
	public String productDetail(WineVO vo, Model model, UserVO uvo, HttpSession session) {
		
		System.out.println("상품 상세페이지 이동");
		System.out.println(productService.getProductdetail(vo));
		uvo.setId((String) session.getAttribute("userID"));
		List<Integer> num = new ArrayList();
		for(int i=1; i<=productService.getProductdetail(vo).getQuantity();i++) {
			int l = 0;
			num.add(l,i);
			l++;
			
		
		}
		model.addAttribute("product", productService.getProductdetail(vo));
		model.addAttribute("num", num);
		model.addAttribute("user", userSerivce.getUser(uvo));
		return "WEB-INF/view/product/productdetailpage.jsp";
		
	}
	

	
}
