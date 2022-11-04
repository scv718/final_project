package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cart.CartService;
import com.project.cart.CartVO;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserVO;



@Controller
public class Order_cartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private SubscribeService subscribeService;
	
	@RequestMapping(value = "/cart.wp")
	public String cart(UserVO uvo, CartVO cvo, SubscribeVO svo, HttpSession session, Model model) {
		System.out.println("장바구니 이동");
	
		String Cid = (String) session.getAttribute("userID");
		cvo.setId(Cid);
		

		try {
			if (Cid == null) {
				return "singUp.wp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("level_shipping",subscribeService.level_shipping(Cid));
		model.addAttribute("cartInfo", cartService.getCartList(Cid));

		System.out.println(subscribeService.level_shipping(Cid) +"구독 배송값 리스트");
		return "WEB-INF/view/mypage/cart.jsp";
	}
	
	/* 장바구니 수량 수정 */
	@RequestMapping(value = "/modifyCount.wp")
		public String modifyCount(CartVO cvo ) {
	
		cartService.modifyCount(cvo);
		return "redirect:/cart.wp";
	}

	/* 장바구니 삭제 */
	@RequestMapping(value ="/deleteCart.wp")
	public String deleteCart(CartVO cvo ,  HttpSession session) {
		System.out.println("장바구니 삭제");
		cartService.deleteCart(cvo);
//		cartService.addcart_ORD_CART_NO(cvo);
		return "redirect:/cart.wp";
	}
	
	/* 장바구니 추가 */
		@RequestMapping(value = "/addCart.wp")
		public String addCart(UserVO uvo, CartVO cvo, HttpSession session, Model model) {
		// 로그인 체크
		String Cid = (String) session.getAttribute("userID");
		cvo.setId(Cid);
		System.out.println(cvo.getQuantity()+"개");
		System.out.println(cvo.getW_no());
		try {
			if (Cid == null) {
				return "singUp.wp";
			}else {
				// 카트 등록
				cvo.setId(Cid);
				cartService.addCart(cvo);				
				return "redirect:/cart.wp";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/cart.wp";
	}	

}
