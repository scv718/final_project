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

}
