package com.project.community;

import java.util.List;

public interface FaqService {

	// FAQ 등록
	void insertFaq(CommunityVO vo);

	// FAQ 수정
	void updateFaq(CommunityVO vo);

	// FAQ 삭제
	void deleteFaq(CommunityVO vo);

	// FAQ 조회
	CommunityVO getFaq(CommunityVO vo);

	// FAQ 전체 조회
	List<CommunityVO> getFaqList(CommunityVO vo);

	// FAQ 글목록 개수
	int totalFaqListCnt(CommunityVO vo);
}
