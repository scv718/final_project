package com.project.review.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.review.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//리뷰 중복확인
	public int existReview(int w_no, String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("w_no", w_no);
		int a = mybatis.selectOne("BoardDAO.existReview", map);
		if(a > 0) {
		} else System.out.println("작성 가능한 회원입니다.");
		
		return a;
	}
	
	//배송완료 회원확인
	public int orderMember(int w_no, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("w_no", w_no);
		int a = mybatis.selectOne("BoardDAO.orderMember", map);
		if(a > 0) {
		} else System.out.println("배송이 완료되지 않은 회원입니다.");
		return a;
	}
	
	//리뷰 작성
	public void insertReview(ReviewVO vo) {
		System.out.println("리뷰 등록처리");
		mybatis.insert("BoardDAO.insertReview", vo);
	}
	
	//리뷰 수정
	public void updateReview(ReviewVO vo) {
		int success = mybatis.update("BoardDAO.updateReview", vo);
		if(success > 0) {
		} else {
		}
	}
	
	//리뷰 삭제
	public void deleteReview(ReviewVO vo) {
		int success = mybatis.delete("BoardDAO.deleteReview", vo);
		if(success > 0) {
		} else {
		}
	}
	
	//상품후기 상세 조회
	public ReviewVO detailReview(ReviewVO vo) {
		return mybatis.selectOne("BoardDAO.detailReview", vo);
	}

	//상품후기 목록 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return mybatis.selectList("BoardDAO.getReviewList", vo);
	}
	
	//전체 글 목록 갯수
	public int getReviewListCnt(ReviewVO vo) {
		return mybatis.selectOne("BoardDAO.getReviewListCnt", vo);
	}

	//정렬 목록
	public List<ReviewVO> getFilterList(ReviewVO vo) {
		return mybatis.selectList("BoardDAO.reviewFilter", vo);
	}

	//정렬 목록 갯수
	public int getFilterCnt(ReviewVO vo) {
		return mybatis.selectOne("BoardDAO.getFilterCnt", vo);
	}

	//상품별 리뷰목록
	public List<ReviewVO> productReviewList(ReviewVO rvo) {
		return mybatis.selectList("BoardDAO.productReviewList", rvo);
	}

	//상품별 리뷰목록 갯수
	public int productReviewListCnt(ReviewVO rvo) {
		return mybatis.selectOne("BoardDAO.productReviewListCnt", rvo);
	}
	
	public List<ReviewVO> mainreviewFilter(ReviewVO vo) {
		return mybatis.selectList("BoardDAO.mainreviewFilter", vo);
	}

	//상품별 평점평균
	public Double getRatingAvg(int w_no) {
		return mybatis.selectOne("BoardDAO.getRatingAvg", w_no);
	}

	//평점평균 반영
	public void updateRating(ReviewVO vo) {
		mybatis.update("BoardDAO.updateReview", vo);
		mybatis.update("BoardDAO.updateRating", vo);
	}

	//상품페이지 정렬
	public List<ReviewVO> productReviewFilter(ReviewVO rvo) {
		List<ReviewVO> newList = new ArrayList<>();		
		try {
			List<ReviewVO> li = mybatis.selectList("BoardDAO.productReviewFilter", rvo);
			return li;
		} catch(Exception e) {
			System.out.println(e);
		}
		return newList;
//		if(li == null || li.isEmpty()) {
//			return new ArrayList<>();
//		} else {
//			return li;
//		}
	}
}
