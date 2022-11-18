package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.cart.CartService;
import com.project.cart.CartVO;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.order.OrderService;
import com.project.order.OrderVO;
import com.project.user.UserVO;
import com.project.wine.ProductService;
import com.project.wine.WineService;
import com.project.wine.WineVO;



@Controller
public class Order_cartController {

	@Autowired
	private CartService cartService;

	@Autowired
	private SubscribeService subscribeService;
	
	@Autowired
	private OrderService orderSerivce;
	@Autowired
	private ProductService productService;
	@Autowired
	private WineService wineService;
	
	@RequestMapping(value="cancleorderrequest.wp")
	public String updateorder(HttpServletRequest request, OrderVO vo, Model model) {
		
		System.out.println("컨트롤러탐");
		vo.setOrd_code(request.getParameter("ord_code"));
		vo.setCs_stat(request.getParameter("cs_stat"));
		vo.setOrd_stat(request.getParameter("ord_stat"));
		wineService.updateorder(vo); 
		return "redirect:myorderList.wp";
	
	}
	
	
	@RequestMapping("myorderList.wp")
	public String myorderList(OrderVO ovo, HttpSession session, Model model, WineVO wvo) {
		
		ovo.setId((String) session.getAttribute("userID"));
		model.addAttribute("cartInfo", orderSerivce.selectOrderList(ovo));
		List<WineVO> wineList = new ArrayList();
		for(int i =0; i < orderSerivce.selectOrderList(ovo).size(); i++) {
			wvo.setW_no(Integer.parseInt(orderSerivce.selectOrderList(ovo).get(i).getW_no().trim()));
			wineList.add(productService.getProductdetail(wvo));
			
		}
		model.addAttribute("product", wineList);
		return "WEB-INF/view/mypage/myorderList.jsp";
		
	}
	//구독 내역
	@RequestMapping("subscribe-3.wp")
	public String subscribeList(OrderVO ovo, SubscribeVO svo,HttpSession session, Model model, WineVO wvo) {
		svo.setId((String) session.getAttribute("userID"));
		ovo.setId((String) session.getAttribute("userID"));
		model.addAttribute("subscribe", orderSerivce.subscribeOrderList(ovo));
		model.addAttribute("mylevel", subscribeService.getSubscribe(svo));
		return "WEB-INF/view/subscribe/subscribe-3.jsp";
	}
	//구독 내역 삭제
	@RequestMapping(value ="/deletesubscribe.wp")
	public String deletesubscribe(OrderVO ovo ,  HttpSession session) {
		ovo.setId((String) session.getAttribute("userID"));
		orderSerivce.deleteOrderList(ovo);
		return "redirect:/subscribe-3.wp";
	}
	
	/* 장바구니 삭제 */
	@RequestMapping(value ="/deleteOrder.wp")
	public String deleteOrder(OrderVO ovo ,  HttpSession session) {
		ovo.setId((String) session.getAttribute("userID"));
		orderSerivce.deleteOrderList(ovo);
		return "redirect:/myorderList.wp";
	}
	
	
	@RequestMapping(value = "/cart.wp")
	public String cart(UserVO uvo, CartVO cvo, SubscribeVO svo, HttpSession session, Model model) {
		String Cid = (String) session.getAttribute("userID");
		cvo.setId(Cid);
		boolean nullListEmpty = CollectionUtils.isEmpty(cartService.getCartList(Cid));
			if(nullListEmpty) {
				session.setAttribute("error", 1);
				return "redirect:/";
			}

		try {
			
			if (Cid == null) {
				return "signUp.wp";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		svo.setId(Cid);
		
		cvo.getQuantity();
		

		model.addAttribute("level",subscribeService.getLevel(svo));
		model.addAttribute("cartInfo", cartService.getCartList(Cid));

		return "WEB-INF/view/mypage/cart.jsp";
	}
	
	/* 장바구니 수량 수정 */
	@RequestMapping(value = "/modifyCount.wp")
		public String modifyCount(CartVO cvo ) {
		System.out.println("여기탐?");
		System.out.println(cvo.getOrd_quan());
		cartService.modifyCount(cvo);
		return "redirect:/cart.wp";
	}

	/* 장바구니 삭제 */
	@RequestMapping(value ="/deleteCart.wp")
	public String deleteCart(CartVO cvo ,  HttpSession session) {
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
		try {
			if (Cid == null) {
				return "signUp.wp";
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
