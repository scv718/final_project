package com.project.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.review.ReviewService;
import com.project.review.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewDAOMybatis ReviewDAO;
	//리뷰 중복확인
	@Override
	public int existReview(int w_no, String id) throws Exception {
		return reviewDAO.existReview(w_no, id);
	}
	
	//배송완료 회원확인
	@Override
	public int orderMember(int w_no, String id) {
		return reviewDAO.orderMember(w_no, id);
	}
	
	//리뷰 작성
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}
	
	//리뷰 수정
	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
	}
	
	//리뷰 삭제
	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
		
	}
	
	//상품후기 상세조회
	@Override
	public ReviewVO detailReview(ReviewVO vo) {
		return reviewDAO.detailReview(vo);
	}

	//상품후기 목록조회
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}

	//전체 글 목록 갯수
	@Override
	public int totalReviewListCnt(ReviewVO vo) {
		return reviewDAO.getReviewListCnt(vo);
	}

	//정렬 목록
	@Override
	public List<ReviewVO> getFilterList(ReviewVO vo) {
		return reviewDAO.getFilterList(vo);
	}

	//정렬 목록 갯수
	@Override
	public int totalFilterListCnt(ReviewVO vo) {
		return reviewDAO.getFilterCnt(vo);
	}

	//상품별 리뷰목록
	@Override
	public List<ReviewVO> productReviewList(ReviewVO rvo) {
		return reviewDAO.productReviewList(rvo);
	}

	//상품별 리뷰목록 갯수
	@Override
	public int productReviewListCnt(ReviewVO rvo) {
		return reviewDAO.productReviewListCnt(rvo);
	}
	//관리자
	@Override
	public List<ReviewVO> ReviewListAd(ReviewVO vo) {
		System.out.println("review까지 진행됨");
		return ReviewDAO.ReviewListAd(vo);
	}

	//상품별 평점평균
	@Override
	public Double getRatingAvg(int w_no) {
		return reviewDAO.getRatingAvg(w_no);
	}

	//평점평균 반영
	@Override
	public void updateRating(ReviewVO vo) {
		reviewDAO.updateRating(vo);
	}

	@Override
	public List<ReviewVO> mainreviewFilter(ReviewVO vo){
		
		return reviewDAO.mainreviewFilter(vo);
	}
}
