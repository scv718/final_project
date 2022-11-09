package com.project.subscribe;

import java.util.List;

import com.project.order.OrderVO;
import com.project.user.UserVO;

public interface SubscribeService {
	
	//구독 생성
	public void insertSubscribe0(SubscribeVO vo);
	public void insertSubscribe1(SubscribeVO vo);
	public void insertSubscribe2(SubscribeVO vo);
	public void insertSubscribe3(SubscribeVO vo);
	
	//구독 취소수정
	void updateSubscribe(SubscribeVO vo);

	//구독 조회
	int getSubscribe(SubscribeVO vo);
	
	//구독 정보리스트
	List<SubscribeVO>getSubscribeList(SubscribeVO vo);
	SubscribeVO getLevel(SubscribeVO vo);
	//구독 배송비 조회
	List<SubscribeVO>level_shipping(String vo);
	//구독 배송비 0 and 2500
	void liset_deli_price(SubscribeVO svo);
	void liset_deli_price_up(SubscribeVO vo);
	//취향설정
	void preference_Setting(SubscribeVO vo);
	List<SubscribeVO> allsubscriptList(SubscribeVO vo);
}