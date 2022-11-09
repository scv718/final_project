package com.project.community;

import java.util.List;

public interface AnswerService {

		// Answer 등록
		void insertAnswer(AnswerVO vo);

		// Answer 수정
		void updateAnswer(AnswerVO vo);

		// Answer 삭제
		void deleteAnswer(AnswerVO vo);

		// Answer 조회
		AnswerVO getAnswer(AnswerVO vo);

		// Answer 전체 조회
		List<AnswerVO>  getAnswerList(AnswerVO vo);

		// Answer 글목록 개수
		int totalAnswerListCnt(AnswerVO vo);
		
}
