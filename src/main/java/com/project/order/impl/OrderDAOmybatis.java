package com.project.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.order.OrderVO;
import com.project.review.ReviewVO;

@Repository
public class OrderDAOmybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertOrder(OrderVO vo) {
		mybatis.insert("OrderDAO.insertOrder", vo);
		
	}
	//구독 결제 시 
	public void subscribeOrder(OrderVO vo) {
		mybatis.insert("OrderDAO.subscribeOrder", vo);
	}
	//구독취소
	public OrderVO subscribeOrderList(OrderVO vo) {
		return mybatis.selectOne("OrderDAO.subscribeOrderList", vo);
	}

	public List<OrderVO> selectOrderList(OrderVO vo) {
		return mybatis.selectList("OrderDAO.selectOrderList", vo);
	}

	public void deleteOrder(OrderVO vo) {
		mybatis.delete("OrderDAO.deleteOrder", vo);
		
	}
	
	public OrderVO selectOrder(OrderVO vo) {
		return mybatis.selectOne("OrderDAO.selectOrder", vo);
	}

	public void cancleOrder(OrderVO vo) {
		mybatis.update("OrderDAO.cancleOrder", vo);
	}
	public void deleteOrderList(OrderVO vo) {
		mybatis.update("OrderDAO.deleteOrderList", vo);
	}
	// 관리자 리스트
	public List<OrderVO> OrderListAd(OrderVO vo) {
		return mybatis.selectList("OrderDAO.OrderListAd", vo);
	}
}
