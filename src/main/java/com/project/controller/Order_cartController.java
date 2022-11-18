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
		System.out.println("주문내역");
		
		ovo.setId((String) session.getAttribute("userID"));
		model.addAttribute("cartInfo", orderSerivce.selectOrderList(ovo));
		System.out.println(orderSerivce.selectOrderList(ovo));
		System.out.println();
		List<WineVO> wineList = new ArrayList();
		for(int i =0; i < orderSerivce.selectOrderList(ovo).size(); i++) {
			System.out.println(orderSerivce.selectOrderList(ovo).get(i).getW_no());
			wvo.setW_no(Integer.parseInt(orderSerivce.selectOrderList(ovo).get(i).getW_no().trim()));
			wineList.add(productService.getProductdetail(wvo));
			System.out.println(productService.getProductdetail(wvo));
			
		}
		System.out.println(wineList);
		model.addAttribute("product", wineList);
		return "WEB-INF/view/mypage/myorderList.jsp";
		
	}
	//구독 내역
	@RequestMapping("subscribe-3.wp")
	public String subscribeList(OrderVO ovo, SubscribeVO svo,HttpSession session, Model model, WineVO wvo) {
		System.out.println("구독내역");
		svo.setId((String) session.getAttribute("userID"));
		ovo.setId((String) session.getAttribute("userID"));
		model.addAttribute("subscribe", orderSerivce.subscribeOrderList(ovo));
		model.addAttribute("mylevel", subscribeService.getSubscribe(svo));
		System.out.println(orderSerivce.subscribeOrderList(ovo));

		return "WEB-INF/view/subscribe/subscribe-3.jsp";
	}
	//구독 내역 삭제
	@RequestMapping(value ="/deletesubscribe.wp")
	public String deletesubscribe(OrderVO ovo ,  HttpSession session) {
		System.out.println("구독내역 삭제");
		ovo.setId((String) session.getAttribute("userID"));
		orderSerivce.deleteOrderList(ovo);
		return "redirect:/subscribe-3.wp";
	}
	
	/* 장바구니 삭제 */
	@RequestMapping(value ="/deleteOrder.wp")
	public String deleteOrder(OrderVO ovo ,  HttpSession session) {
		System.out.println("주문내역 삭제");
		ovo.setId((String) session.getAttribute("userID"));
		orderSerivce.deleteOrderList(ovo);
		return "redirect:/myorderList.wp";
	}
	
	
	@RequestMapping(value = "/cart.wp")
	public String cart(UserVO uvo, CartVO cvo, SubscribeVO svo, HttpSession session, Model model) {
		System.out.println("장바구니 이동");
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
		
		System.out.println(cartService.getCartList(Cid) + "cvo 리스트");
		cvo.getQuantity();
		

		model.addAttribute("level",subscribeService.getLevel(svo));
		model.addAttribute("cartInfo", cartService.getCartList(Cid));

		System.out.println(subscribeService.getLevel(svo) +"구독 배송값 리스트");
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
