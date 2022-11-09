package com.project.community.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.community.CommunityVO;

@Repository
public class FaqDAOMybatis {

	@Autowired // 자료형주입
	private SqlSessionTemplate mybatis;

	// ========공통========
	// FAQ 목록 조회(여러줄)
	public List<CommunityVO> getFaqList(CommunityVO vo) {
		System.out.println("===> mybatis getFaqList() 기능처리");
		return mybatis.selectList("FaqDAO.getFaqList", vo);
	}

	// 전체 글 목록 개수
	public int totalFaqListCnt(CommunityVO vo) {
		System.out.println("===> mybatis totalFaqListCnt() 기능처리");
		return mybatis.selectOne("FaqDAO.totalFaqListCnt", vo);
	}

	// =======관리자========

	// FAQ 등록
	public void admin_insertFaq(CommunityVO vo) {
		System.out.println("===> mybatis admin_insertFaq() 기능처리");
		mybatis.insert("FaqDAO.admin_insertFaq", vo);
		// namespace명.객체명
	}

	// FAQ 수정
	public void admin_updateFaq(CommunityVO vo) {
		System.out.println("===> mybatis admin_updateFaq() 기능처리");
		mybatis.update("FaqDAO.admin_updateFaq", vo);
	}

	// FAQ 삭제
	public void admin_deleteFaq(CommunityVO vo) {
		System.out.println("===> mybatis admin_deleteFaq() 기능처리");
		mybatis.delete("FaqDAO.admin_deleteFaq", vo);
	}

	// FAQ 상세 조회(한줄)
	public CommunityVO admin_getFaq(CommunityVO vo) {
		System.out.println("===> mybatis admin_getFaq() 기능처리");
		return (CommunityVO) mybatis.selectOne("FaqDAO.admin_getFaq", vo);
	}

}
