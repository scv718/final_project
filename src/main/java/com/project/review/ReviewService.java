package com.project.review;

import java.util.List;

public interface ReviewService {

	//리뷰 작성
	void insertReview(ReviewVO vo);
	
	//리뷰 수정
	void updateReview(ReviewVO vo);

	//리뷰 삭제
	void deleteReview(ReviewVO vo);
	
	//상품후기 상세조회
	ReviewVO detailReview(ReviewVO vo);
	
	//상품후기 목록조회
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	//전체 글 목록 갯수
	int totalReviewListCnt(ReviewVO vo);


}