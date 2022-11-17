package com.project.community.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.community.AnswerVO;
import com.project.community.CommunityVO;
import com.project.community.QnaVO;

@Repository
public class QnaDAOMybatis {

	@Autowired // 자료형주입
	private SqlSessionTemplate mybatis;

	// ===== 사용자 =====
	// 1:1 문의 등록
	public void insertQna(CommunityVO vo) {
		System.out.println("===> mybatis insertQna() 기능처리");
		mybatis.insert("QnaDAO.insertQna", vo);
		// namespace명.객체명
	}

	// 1:1 문의 수정
	public void updateQna(CommunityVO vo) {
		System.out.println("===> mybatis updateQna() 기능처리");
		mybatis.update("QnaDAO.updateQna", vo);
	}

	// 1:1 문의 삭제
	public void deleteQna(CommunityVO vo) {
		System.out.println("===> mybatis deleteQna() 기능처리");
		mybatis.delete("QnaDAO.deleteQna", vo);
	}

	// 1:1 문의 상세 조회(한줄)
	public CommunityVO getQna(CommunityVO vo) {
		System.out.println("===> mybatis getQna() 기능처리");
		return (CommunityVO) mybatis.selectOne("QnaDAO.getQna", vo);
	}

	// 1:1 문의 목록 조회(여러줄)
	public List<CommunityVO> getQnaList(CommunityVO vo) {
		System.out.println("===> mybatis getQnaList() 기능처리");
		return mybatis.selectList("QnaDAO.getQnaList", vo);
	}

	// 1:1 문의 전체 글 목록 개수 - 사용자
	public int totalQnaListCnt(CommunityVO vo) {
		System.out.println("===> mybatis totalQnaListCnt() 기능처리");
		return mybatis.selectOne("QnaDAO.totalQnaListCnt", vo);
	}

	// ===== 관리자 =====
	// 1:1 문의 등록 - 관리자
	public void admin_insertQna(AnswerVO vo) {
		mybatis.insert("QnaDAO.admin_insertQna", vo);
	}

	// 1:1 문의 수정 - 관리자
	public void admin_updateQna(CommunityVO vo) {
		mybatis.update("QnaDAO.admin_updateQna", vo);
	}
	// 관리자 리스트
	public List<QnaVO> QnaListAd(QnaVO vo) {
		List<QnaVO> c = mybatis.selectList("QnaDAO.QnaListAd");

		return mybatis.selectList("QnaDAO.QnaListAd");
	}

	// 1:1 문의 상세 조회(한줄)
	public CommunityVO admin_getQna(CommunityVO vo) {
		return (CommunityVO) mybatis.selectOne("QnaDAO.admin_getQna", vo);
	}

	// 1:1 문의 목록 조회(여러줄)
	public List<CommunityVO> admin_getQnaList(CommunityVO vo) {
		return mybatis.selectList("QnaDAO.admin_getQnaList", vo);
	}

	// 1:1 문의 전체 글 목록 개수 - 관리자
	public int admin_totalQnaListCnt(CommunityVO vo) {
		return mybatis.selectOne("QnaDAO.admin_totalQnaListCnt", vo);
	}

	// 1:1 답변여부
	public void answerCount(int commu_no) {
		mybatis.update("QnaDAO.answerCount", commu_no);
	}

}
