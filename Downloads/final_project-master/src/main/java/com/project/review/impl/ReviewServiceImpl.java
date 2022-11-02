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
	
	// 리뷰 작성
	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
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



}
