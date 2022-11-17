package com.project.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.review.ReviewVO;

@Repository
public class ReviewDAOMybatis {

	@Autowired // 자료형주입
	private SqlSessionTemplate mybatis;

	// 관리자 리스트
	public List<ReviewVO> ReviewListAd(ReviewVO vo) {
		List<ReviewVO> r = mybatis.selectList("ReviewDAO.ReviewListAd");
		return mybatis.selectList("ReviewDAO.ReviewListAd");
	}
	public void deleteReviewAd(ReviewVO vo) {
		mybatis.delete("ReviewDAO.deleteReviewAd", vo);
	}
}
