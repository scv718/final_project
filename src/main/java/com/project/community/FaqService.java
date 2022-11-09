package com.project.community;

import java.util.List;

public interface FaqService {


	//=====공통======
	// FAQ 전체 조회
	List<CommunityVO> getFaqList(CommunityVO vo);
	
	// FAQ 글목록 개수
	int totalFaqListCnt(CommunityVO vo);
	
	//=====관리자=====
	// FAQ 등록
	void admin_insertFaq(CommunityVO vo);

	// FAQ 수정
	void admin_updateFaq(CommunityVO vo);

	// FAQ 삭제
	void admin_deleteFaq(CommunityVO vo);

	// FAQ 조회
	CommunityVO admin_getFaq(CommunityVO vo);

	
		
	
}
