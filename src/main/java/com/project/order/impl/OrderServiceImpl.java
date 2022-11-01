package com.project.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.order.M_addVO;
import com.project.order.OrderService;
import com.project.order.OrderVO;


@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAOMybatis orderDAO;
	
	@Override
	public void oredr_m_add(M_addVO mvo) {
		 orderDAO.oredr_m_add(mvo);	
	}
	@Override
	public M_addVO getm_add(M_addVO mvo) {
		return orderDAO.getm_add(mvo);
	}

	
	@Override
	public List<OrderVO> getGoodsInfo(List<OrderVO> vo){return null;}
	@Override
	public void order(OrderVO vo) {}
	@Override
	public void orderCancle(OrderVO vo) {}

}
