package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cart.CartService;
import com.project.cart.CartVO;
import com.project.user.UserVO;



@Controller
public class Order_cartController {

	@Autowired
	private CartService cartService;

	/* 장바구니 페이지 이동 */
	@RequestMapping(value = "/cart.wp")
	public String cart(UserVO uvo, CartVO cvo, HttpSession session, Model model) {
		System.out.println("장바구니 이동");
		
		String Uid = (String) session.getAttribute("userID");
		String Cid = (String) session.getAttribute("userID");
		
		try {
			if (Uid == null) {
				return "singUp.wp";
			}else {
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(Cid = (String) session.getAttribute("userID"));
		System.out.println(cartService.getCartList(Cid));
		
	
		model.addAttribute("cartInfo", cartService.getCartList(Cid));
		return "WEB-INF/view/mypage/cart.jsp";
	}

	/* 장바구니 수량 수정 */
	@RequestMapping(value = "/modifyCount.wp")
//	public String modifyCount(CartVO cvo, UserVO uvo, HttpSession session) {
		public String modifyCount(CartVO cvo) {
		
		System.out.println("장바구니 수량 수정 해");
		
		cartService.modifyCount(cvo);
		return "redirect:/cart.wp";
	}
	
	/* 장바구니 수량 수정 */
//	@RequestMapping(value ="/deleteCart.wp")
//	public String deleteCart(CartVO cvo ,  HttpSession session) {
//		String Cid = (String) session.getAttribute("userID");
//		
//	    int w = (int) session.getAttribute(w);
//	    
//		System.out.println("장바구니 삭제");
//		System.out.println(cvo.getId());
//		System.out.println(cvo.getW_no());
//		System.out.println(w);
//		cartService.deleteCart(w);
//		
//		return "redirect:/cart.wp";
//		
//	}
	/* 장바구니 추가 */
	@PostMapping("/cart.wp/add")
	@ResponseBody
	public String addCartPOST(CartVO cvo, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		UserVO mvo = (UserVO)session.getAttribute("userID");
		if(mvo == null) {
			return "5";
		}
		
		// 카트 등록
		cartService.addCart(cvo);
		cartService.addcart_ORD_CART_NO(cvo);
		return "redirect:/cart.wp";
	}	

		
	
}
