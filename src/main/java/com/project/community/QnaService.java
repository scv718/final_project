package com.project.community;

import java.util.List;

public interface QnaService {


	// ========사용자=======
	
	// 1:1 문의 등록 - 사용자
	void insertQna(CommunityVO vo);
	
	// 1:1 문의 수정 - 사용자
	void updateQna(CommunityVO vo);

	// 1:1 문의 삭제 - 사용자
	void deleteQna(CommunityVO vo);

	// 1:1 문의 조회 - 사용자
	CommunityVO getQna(CommunityVO vo);
	
	// 1:1 문의 전체 조회 - 사용자
	List<CommunityVO> getQnaList(CommunityVO vo);
	
	// 1:1 문의 글목록 개수 - 사용자
	int totalQnaListCnt(CommunityVO vo);
		
	
	//========관리자=========
	
	// 1:1 문의 답변 - 관리자
	void admin_insertQna(AnswerVO vo);

	// 1:1 문의 조회 - 관리자
	CommunityVO admin_getQna(CommunityVO vo);
	
	// 1:1 문의 전체 조회 - 관리자
	List<CommunityVO> admin_getQnaList(CommunityVO vo);

	// 1:1 문의 글목록 개수 - 관리자
	int admin_totalQnaListCnt(CommunityVO vo);
      //관리자리스트
	List<QnaVO> QnaListAd(QnaVO vo);
}
