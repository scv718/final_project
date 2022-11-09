package com.project.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cart.CartVO;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserVO;
import com.project.wine.WineVO;

@Repository
public class CartDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 추가
	public void addCart(CartVO vo) {
		System.out.println(vo.getW_no());
		 mybatis.insert("CartDAO.addCart", vo);
	}
	public void addcart_ORD_CART_NO(CartVO vo) {
		 mybatis.insert("CartDAO.addcart_ORD_CART_NO", vo);	
	}
	// 삭제
	public void deleteCart(CartVO vo) {
		 mybatis.delete("CartDAO.deleteCart", vo);
	}

	// 카트 수량 수정
	public void modifyCount(CartVO vo) {
		 mybatis.update("CartDAO.modifyCount", vo);
	}

	// 카트 확인
	public CartVO checkCart(CartVO vo) {
		return mybatis.selectOne("CartDAO.checkCart", vo);
	}

	// 카트 목록
		public List<CartVO> getCartList(String vo) {
			return mybatis.selectList("CartDAO.getCartList", vo);
		}
	// 배송비 확인
//	public List<CartVO> getCart(String vo) {
//		return mybatis.selectList("CartDAO.getCartPayment", vo);
//	}

	public CartVO getCartpay(CartVO vo) {
		System.out.println("목록가져오기");
		System.out.println(vo.getOrd_cart_no());
		System.out.println(vo.getId());
		return mybatis.selectOne("CartDAO.getCartPayment", vo);
	}

}
