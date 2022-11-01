package com.project.order;

import java.util.List;

import com.project.user.UserVO;

public interface OrderService {
	/* 주문 정보 */
	public List<OrderVO> getGoodsInfo(List<OrderVO> orders);
	/* 주문 */
	public void  order(OrderVO vo);	
	/* 주문 취소 */
	public void orderCancle(OrderVO vo);
	
	
	
	
	//결제 (구독 하지 않음)
	M_addVO getm_add(M_addVO vo);
	
	//주소추가
	public void oredr_m_add(M_addVO ovo);		
	
}
