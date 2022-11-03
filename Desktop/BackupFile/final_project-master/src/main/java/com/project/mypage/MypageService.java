package com.project.mypage;

import java.util.List;

public interface MypageService {
	//추가
	public void insertMypage(MypageVO vo);
	//삭제
	void deleteMypage(MypageVO vo);
	//수정
	void updateMypage(MypageVO vo);
	//조회
	MypageVO getMypage(MypageVO vo);
	//정보리스트
	List<MypageVO>getMypageList(MypageVO vo);
	
}