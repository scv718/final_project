package com.project.cart;

import java.util.List;


public interface CartService {

	/* 장바구니 추가 */
	public void addCart(CartVO cart);	
	public void addcart_ORD_CART_NO(CartVO cart);
	/* 장바구니 정보 리스트 */
	public CartVO checkCart(CartVO cvo);	
	public List<CartVO> getCartList(String userID);	
	public List<CartVO> getCartList(CartVO vo);	
	public CartVO getCartpay(CartVO vo);
	
	/* 카트 수량 수정 */
	public void modifyCount(CartVO cart);	
	public void modifyCount1(CartVO cart);
	
	/* 카트 삭제 */
//	public int deleteCart(CartVO cartId);		
	public void deleteCart(CartVO cvo);
}
