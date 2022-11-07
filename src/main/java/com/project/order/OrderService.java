package com.project.order;

import java.util.List;

public interface OrderService {

	void insertOrder(OrderVO vo);
	List<OrderVO> selectOrderList(OrderVO vo);
	
	//구독 시 생성
	void subscribeOrder(OrderVO vo);
	
}
