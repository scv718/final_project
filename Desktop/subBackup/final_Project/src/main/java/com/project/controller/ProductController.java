package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.wine.ProductService;
import com.project.wine.WineVO;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;
	
	
	@RequestMapping("product.wp")
	public String productDetail(WineVO vo) {
		
		System.out.println("상품 상세페이지 이동");
		productService.getProductdetail(vo);
		return "WEB-INF/view/product/productdetailpage.jsp";
		
	}
	
	
}
