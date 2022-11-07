package com.project.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.review.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//리뷰 작성
	public void insertReview(ReviewVO vo) {
		System.out.println("리뷰 등록처리");
		mybatis.insert("BoardDAO.insertReview", vo);
	}
	
	//리뷰 수정
	public void updateReview(ReviewVO vo) {
		System.out.println("리뷰 수정처리");
		int success = mybatis.update("BoardDAO.updateReview", vo);
		if(success > 0) {
			System.out.println("수정완료" + success);
		} else {
			System.out.println("수정실패");
		}
	}
	
	//리뷰 삭제
	public void deleteReview(ReviewVO vo) {
		System.out.println("리뷰 삭제처리");
		int success = mybatis.delete("BoardDAO.deleteReview", vo);
		if(success > 0) {
			System.out.println("삭제완료" + success);
		} else {
			System.out.println("삭제실패");
		}
	}
	
	//상품후기 상세 조회
	public ReviewVO detailReview(ReviewVO vo) {
		System.out.println("리뷰 상세보기");
		return mybatis.selectOne("BoardDAO.detailReview", vo);
	}

	//상품후기 목록 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("리뷰게시판 목록처리");
		return mybatis.selectList("BoardDAO.getReviewList", vo);
	}
	
	//전체 글 목록 갯수
	public int getReviewListCnt(ReviewVO vo) {
		System.out.println("글 목록 갯수 처리");
		return mybatis.selectOne("BoardDAO.getReviewListCnt", vo);
	}

	//정렬 목록
	public List<ReviewVO> getFilterList(ReviewVO vo) {
		System.out.println("필터 목록처리");
		return mybatis.selectList("BoardDAO.reviewFilter", vo);
	}

	//정렬 목록 갯수
	public int getFilterCnt(ReviewVO vo) {
		System.out.println("필터 갯수처리");
		return mybatis.selectOne("BoardDAO.getFilterCnt", vo);
	}


}
