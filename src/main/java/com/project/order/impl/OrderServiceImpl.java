package com.project.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.order.OrderService;
import com.project.order.OrderVO;
import com.project.review.ReviewService;
import com.project.review.ReviewVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	
	@Autowired
	OrderDAOmybatis mybatis;
	
	@Override
	public void insertOrder(OrderVO vo) {
		mybatis.insertOrder(vo);
		
	}

//	@Override
//	public List<OrderVO> selectOrderList(OrderVO vo) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<OrderVO> selectOrderList(OrderVO vo) {
		return mybatis.selectOrderList(vo);
	}

	@Override
	public void deleteOrder(OrderVO vo) {
		mybatis.deleteOrder(vo);	
	}

	@Override
	public OrderVO selectOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOrder(vo);
	}

	@Override
	public void cancleOrder(OrderVO vo) {
		mybatis.cancleOrder(vo);
		
	}
	@Override
	public void deleteOrderList(OrderVO vo) {
		mybatis.deleteOrderList(vo);
		
	}

	
	//구독 시 생성
	@Override
	public void subscribeOrder(OrderVO vo) {
		mybatis.subscribeOrder(vo);
		
	}

	@Override
	public OrderVO subscribeOrderList(OrderVO vo) {
		return mybatis.subscribeOrderList(vo);
	}


}
