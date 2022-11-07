package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.common.PagingVO;
import com.project.review.ReviewService;
import com.project.review.ReviewVO;
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
	
	@Autowired
	ReviewService reviewService;
	
	
	@RequestMapping("product.wp")
	public String productDetail(WineVO vo, Model model, UserVO uvo, HttpSession session, HttpServletRequest request, ReviewVO rvo, String nowPageBtn) {
		
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
		
		/* 해당 상품 리뷰 목록 */
		System.out.println("상품리뷰 목록 처리");
		
		//총 목록 수
		int totalPageCnt = reviewService.productReviewListCnt(rvo);
		
		//현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("총 목록 수: " + totalPageCnt);
		
		// 한 페이지당 보여줄 목록 수
		int onePageCnt = 5;
		
		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
		
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		rvo.setOffset(pvo.getOffset());
		System.out.println("pvo.getOffset(): "+pvo.getOffset());
		
		model.addAttribute("paging", pvo);
		model.addAttribute("reviewList", reviewService.productReviewList(rvo));
		
		return "WEB-INF/view/product/productdetailpage.jsp";
		
	}
	
}
