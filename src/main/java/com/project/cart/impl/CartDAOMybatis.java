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
	public void modifyCoun1t(CartVO vo) {
		 mybatis.update("CartDAO.modifyCount1", vo);
	}

	// 카트 확인
	public CartVO checkCart(CartVO vo) {
		return mybatis.selectOne("CartDAO.checkCart", vo);
	}

	// 카트 목록
	public List<CartVO> getCart(String vo) {
		return mybatis.selectList("CartDAO.getCart", vo);
	}

}
