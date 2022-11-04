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

	@Override
	public List<OrderVO> selectOrderList(OrderVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	



}
