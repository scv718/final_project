package com.project.intro;

import java.util.List;

public interface IntroService {

	// 인트로 등록
	void insertIntro(IntroVO vo);

	// 인트로 수정
	void updateIntro(IntroVO vo);
	
	// 인트로 조회
	IntroVO getIntro(IntroVO vo);
	
	// 인트로 전체 조회
	List<IntroVO> getIntroList(IntroVO vo);
}
