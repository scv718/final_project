package com.project.subscribe;

import java.util.List;

public interface SubscribeService {
	//구독 생성
	public void insertSubscribe1(SubscribeVO vo);
	public void insertSubscribe2(SubscribeVO vo);
	public void insertSubscribe3(SubscribeVO vo);
	
	//구독 취소수정
	void updateSubscribe(SubscribeVO vo);

	//구독 조회
	SubscribeVO getSubscribe(SubscribeVO vo);
	
	//구독 정보리스트
	List<SubscribeVO>getSubscribeList(SubscribeVO vo);
	//취향설정
	void preference_Setting(SubscribeVO vo);
	
}