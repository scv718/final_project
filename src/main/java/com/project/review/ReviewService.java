package com.project.review;

import java.util.List;

public interface ReviewService {
	
	//리뷰 중복확인
	int existReview(int w_no, String id) throws Exception;
	
	//배송완료 회원확인
	int orderMember(int w_no, String id);

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
	
	//정렬 목록
	List<ReviewVO> getFilterList(ReviewVO vo);

	//정렬 목록 갯수
	int totalFilterListCnt(ReviewVO vo);

	//상품별 리뷰목록
	List<ReviewVO> productReviewList(ReviewVO rvo);

	//상품별 리뷰목록 갯수
	int productReviewListCnt(ReviewVO rvo);
	//관리자
	List<ReviewVO> ReviewListAd(ReviewVO vo);
	// 삭제
	void deleteReviewAd(ReviewVO vo);
	
	List<ReviewVO> mainreviewFilter(ReviewVO vo);
	
	//상품별 평점평균
	Double getRatingAvg(int w_no);
	
	//평점평균 반영
	void updateRating(ReviewVO vo);
	

}