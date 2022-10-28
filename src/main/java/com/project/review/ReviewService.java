package com.project.review;

import java.util.List;

public interface ReviewService {

	//리뷰 작성
	void insertReview(ReviewVO vo);

	//리뷰게시판 조회
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	//전체 글 목록 갯수
	int totalReviewListCnt(ReviewVO vo);


}