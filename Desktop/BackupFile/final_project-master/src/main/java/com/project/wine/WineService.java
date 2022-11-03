package com.project.wine;

import java.util.List;

public interface WineService {
	//구독 생성
	void insertWine(WineVO vo);
	//구독 정보수정
	void updateWine(WineVO vo);
	//구독 정보삭제
	void deleteWine(WineVO vo);
	//구독 조회
	WineVO getWine(WineVO vo);
	//구독 정보리스트
	List<WineVO> getWineList(WineVO vo);
}