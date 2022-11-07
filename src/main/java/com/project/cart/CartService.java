package com.project.cart;

import java.util.List;


public interface CartService {

	/* 장바구니 추가 */
	public void addCart(CartVO vo);	
	public void addcart_ORD_CART_NO(CartVO vo);
	/* 장바구니 정보 리스트 */
	public CartVO checkCart(CartVO vo);	
	public List<CartVO> getCartList(String vo);	
//	public List<CartVO> level_shipping(String vo);	
	public CartVO getCartpay(CartVO vo);
	
	/* 카트 수량 수정 */
	public void modifyCount(CartVO vo);	
	
	/* 카트 삭제 */		
	public void deleteCart(CartVO vo);
}
