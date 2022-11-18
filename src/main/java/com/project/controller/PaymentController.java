package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.cart.CartService;
import com.project.cart.CartVO;
import com.project.order.OrderService;
import com.project.order.OrderVO;
import com.project.subscribe.SubscribeService;
import com.project.subscribe.SubscribeVO;
import com.project.user.AddressService;
import com.project.user.AddressVO;
import com.project.user.UserService;
import com.project.user.UserVO;
import com.project.wine.ProductService;
import com.project.wine.WineVO;



@Controller
public class PaymentController {
	@Autowired
	ProductService productService;
	
	@Autowired
	AddressService addressService;
	@Autowired
	CartService cartService;
	@Autowired
	UserService userSerivce;
	@Autowired
	OrderService orderService;
	@Autowired
	SubscribeService subscribeService;
	
	@RequestMapping("cancleOrder.wp")
	public String cancleOrder(OrderVO ovo ,  HttpSession session) {
		
		ovo.setId((String) session.getAttribute("userID"));
		System.out.println(orderService.selectOrder(ovo));
		
		
		return null;
	}
	@RequestMapping("m_add.wp")
	@ResponseBody
	public String oredr_m_add(AddressVO avo, UserVO vo, Model model, HttpSession session, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		System.out.println(avo.getM_name());
		avo.setId((String) session.getAttribute("userID"));
		System.out.println(avo.getM_default());
		System.out.println(avo.toString());
	
		if(avo.getM_default() == 0) {
			System.out.println("기본주소");
			if(addressService.selectDefaultAddress(avo) == null) {
				addressService.firstaddAddress(avo);
			}else {
				addressService.firstUpdate(avo);
			}
			
		}
		if(avo.getM_default() == 1){
			System.out.println("예비주소");
			if(addressService.selectAddress(avo) == null) {
				addressService.addAddress(avo);
			}else {
				addressService.selectUpdate(avo);
			}
			
		}
		
			
		return "true";
	}
	
	@RequestMapping("payment.wp")
	public String payment(AddressVO avo, SubscribeVO svo,CartVO voList,WineVO vo, Model model, UserVO uvo, HttpSession session, HttpServletRequest req) {
		
		System.out.println("상품 결제 이동");
		System.out.println(voList.toString());
		uvo.setId((String) session.getAttribute("userID"));
		svo.setId(uvo.getId());
		model.addAttribute("level",subscribeService.getLevel(svo));
		
		List<CartVO> listVo = new ArrayList();
		model.addAttribute("user", userSerivce.getUser(uvo));
		voList.setId(uvo.getId());
		avo.setId(uvo.getId());
		String cartcheck = req.getParameter("cart");
		System.out.println("찍어보는중");
		System.out.println(cartcheck);
		System.out.println(vo.getW_no());
		System.out.println(productService.getProductdetail(vo));
		System.out.println();
		if(cartcheck == null) {
			for(int i = 0; i < voList.getOrd_cart_noList().length; i++) {
				voList.setOrd_cart_no(voList.getOrd_cart_noList()[i]);
				listVo.add(cartService.getCartpay(voList));
				vo.setW_no(listVo.get(i).getW_no());
				listVo.get(i).setW_nm_k(productService.getProductdetail(vo).getW_nm_k());
				listVo.get(i).setW_nm_e(productService.getProductdetail(vo).getW_nm_e());
				
			}
			System.out.println(listVo);
			System.out.println(addressService.selectDefaultAddress(avo));
			if(addressService.selectDefaultAddress(avo) != null) {
				model.addAttribute("defaultadd", addressService.selectDefaultAddress(avo));
			}
			if(addressService.selectAddress(avo) != null) {
				model.addAttribute("anotheradd", addressService.selectAddress(avo));
			}else {
				
			}
			model.addAttribute("product", listVo);
			return "WEB-INF/view/product/payment.jsp";
		}else {
			if (cartcheck.equals("1")) {
				voList.setW_nm_k(productService.getProductdetail(vo).getW_nm_k());
				listVo.add(voList);
				model.addAttribute("product", listVo);
				
				if(addressService.selectDefaultAddress(avo) != null) {
					model.addAttribute("defaultadd", addressService.selectDefaultAddress(avo));
				}
				
				if(addressService.selectAddress(avo) != null) {
					model.addAttribute("anotheradd", addressService.selectAddress(avo));
				}
				return "WEB-INF/view/product/payment.jsp";
			}
		}
		return "/";
		
		
	
	
		
	}
	
}
