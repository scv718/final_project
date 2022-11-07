package com.project.order;

import java.util.List;

public interface OrderService {

	void insertOrder(OrderVO vo);
	List<OrderVO> selectOrderList(OrderVO vo);
	void deleteOrder(OrderVO vo);
	OrderVO selectOrder(OrderVO vo);
	void cancleOrder(OrderVO vo);
	void deleteOrderList(OrderVO vo);
	
}
