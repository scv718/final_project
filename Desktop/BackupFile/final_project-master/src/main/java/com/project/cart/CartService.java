package com.project.cart;

import java.util.List;


public interface CartService {

	/* 장바구니 추가 */
	public void addCart(CartVO cart);	
	public void addcart_ORD_CART_NO(CartVO cart);
	/* 장바구니 정보 리스트 */
	public List<CartVO> getCartList(String userID);	
	
	/* 카트 수량 수정 */
	public void modifyCount(CartVO cart);	
	
	/* 카트 삭제 */
//	public int deleteCart(CartVO cartId);		
	public void deleteCart(int w);	
}
