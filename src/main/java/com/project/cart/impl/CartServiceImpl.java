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
	public void addCart(CartVO vo) {
	cartDAO.addCart(vo);	
	}	
	@Override
	public void addcart_ORD_CART_NO(CartVO vo) {
		 cartDAO.addcart_ORD_CART_NO(vo);
	}	
	
	@Override
	public void deleteCart(CartVO vo) {
		 cartDAO.deleteCart(vo);
	}	
	
	@Override
	public CartVO checkCart(CartVO vo) {
		return cartDAO.checkCart(vo);
	}
	
	@Override
	public List<CartVO> getCartList(String vo) {
		
		List<CartVO> cart = cartDAO.getCart(vo);
		
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
	public void modifyCount(CartVO vo) {
		 cartDAO.modifyCount(vo);
	}					

}
