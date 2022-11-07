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
	
	//리뷰 중복확인
	@Override
	public int existReview(int w_no, String id) throws Exception {
		return reviewDAO.existReview(w_no, id);
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

}
