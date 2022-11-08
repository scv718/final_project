package com.project.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.cart.CartService;
import com.project.cart.CartVO;
@Service("cartService")
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAOMybatis cartDAO;	

	@Override
	public void addCart(CartVO cart) {
	cartDAO.checkCart(cart);	
	}	
	@Override
	public void addcart_ORD_CART_NO(CartVO cart) {
		 cartDAO.addcart_ORD_CART_NO(cart);
	}	
	
	@Override
//	public int deleteCart(CartVO cartId) {
	public void deleteCart(int cartId) {
		 cartDAO.deleteCart(cartId);
	}	
	
	@Override
	public List<CartVO> getCartList(String memberId) {
		
		List<CartVO> cart = cartDAO.getCart(memberId);
		
		for(CartVO dto : cart) {
			
			/* 종합 정보 초기화 */
//			dto.initSaleTotal();
			
			/* 이미지 정보 얻기 */
//			int bookId = dto.getBookId();			
//			List<AttachImageVO> imageList = attachMapper.getAttachList(bookId);	
//			dto.setImageList(imageList);
		}
		return cart;	
	}	
	
	@Override
	public void modifyCount(CartVO cart) {
		 cartDAO.modifyCount(cart);
	}
	
		
}
