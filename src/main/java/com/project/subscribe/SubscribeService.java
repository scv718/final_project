package com.project.subscribe;

import java.util.List;

public interface SubscribeService {
	//구독 생성
	public void insertSubscribe(SubscribeVO vo);
	//구독 정보수정
	void updateSubscribe(SubscribeVO vo);
	//구독 정보삭제
	void deleteSubscribe(SubscribeVO vo);
	//구독 조회
	SubscribeVO getSubscribe(SubscribeVO vo);
	//구독 정보리스트
	List<SubscribeVO>getSubscribeList(SubscribeVO vo);
}