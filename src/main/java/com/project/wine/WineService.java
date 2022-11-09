package com.project.wine;

import java.util.Collection;
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
	//와인 검색 페이지 이동
	List<WineVO> getWineList(WineVO vo);
	
	//와인 검색창 결과 이동
	List<WineVO> getWineSearchList(WineVO vo);
	
	List<WineVO> detaileSearch(WineVO vo);
	
	List<WineVO> getType(WineVO vo);
	
	List<WineVO> getContinental(WineVO vo);
	List<WineVO> getCountry(WineVO vo);
	List<WineVO> WineListAd(WineVO wvo);
	
}