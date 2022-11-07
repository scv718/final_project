package com.project.community;

import java.util.List;

public interface QnaService {


	// QNA 등록
	void insertQna(CommunityVO vo);
	
	void admin_insertQna(AnswerVO vo);

	// QNA 수정
	void updateQna(CommunityVO vo);

	// QNA 삭제
	void deleteQna(CommunityVO vo);

	// QNA 조회
	CommunityVO getQna(CommunityVO vo);
	
	// QNA 조회
	CommunityVO admin_getQna(CommunityVO vo);

	// QNA 전체 조회
	List<CommunityVO> getQnaList(CommunityVO vo);
	
	// QNA 전체 조회
	List<CommunityVO> admin_getQnaList(CommunityVO vo);

	// QNA 글목록 개수
	int totalQnaListCnt(CommunityVO vo);
}
