package com.project.order;

import java.util.List;

public interface OrderService {

	void insertOrder(OrderVO vo);
	List<OrderVO> selectOrderList(OrderVO vo);
	
}
