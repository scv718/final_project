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

	// CRUD 기능의 메소드 구현
	// QNA 등록
	public void insertQna(CommunityVO vo) {
		System.out.println("===> mybatis insertQna() 기능처리");
		mybatis.insert("QnaDAO.insertQna", vo);
		// namespace명.객체명
	}

	// QNA 수정
	public void updateQna(CommunityVO vo) {
		System.out.println("===> mybatis updateQna() 기능처리");
		mybatis.update("QnaDAO.updateQna", vo);
	}

	// QNA 삭제
	public void deleteQna(CommunityVO vo) {
		System.out.println("===> mybatis deleteQna() 기능처리");
		mybatis.delete("QnaDAO.deleteQna", vo);
	}

	// QNA 상세 조회(한줄)
	public CommunityVO getQna(CommunityVO vo) {
		System.out.println("===> mybatis getQna() 기능처리");
		return (CommunityVO) mybatis.selectOne("QnaDAO.getQna", vo);
	}
	
	// QNA 상세 조회(한줄)
		public CommunityVO admin_getQna(CommunityVO vo) {
			System.out.println("===> mybatis admin_getQna() 기능처리");
			return (CommunityVO) mybatis.selectOne("QnaDAO.admin_getQna", vo);
		}

	// QNA 목록 조회(여러줄)
	public List<CommunityVO> getQnaList(CommunityVO vo) {
		System.out.println("===> mybatis getQnaList() 기능처리");
		return mybatis.selectList("QnaDAO.getQnaList", vo);
	}
	
	// QNA 목록 조회(여러줄)
	public List<CommunityVO> admin_getQnaList(CommunityVO vo) {
		System.out.println("===> mybatis admin_getQnaList() 기능처리");
		return mybatis.selectList("QnaDAO.admin_getQnaList", vo);
	}

	// 전체 글 목록 개수 - 사용자
	public int totalQnaListCnt(CommunityVO vo) {
		System.out.println("===> mybatis totalQnaListCnt() 기능처리");
		return mybatis.selectOne("QnaDAO.totalQnaListCnt", vo);
	}
	
	// 전체 글 목록 개수 - 관리자
	public int admin_totalQnaListCnt(CommunityVO vo) {
		System.out.println("===> mybatis admin_totalQnaListCnt() 기능처리");
		return mybatis.selectOne("QnaDAO.admin_totalQnaListCnt", vo);
	}

	public void admin_insertQna(AnswerVO vo) {
		System.out.println("===> mybatis admin_insertQna() 기능처리");
		mybatis.insert("QnaDAO.admin_insertQna", vo);
		
	}

	public void answerCount(int commu_no) {
		System.out.println("===> mybatis answerCount() 기능처리");
		mybatis.update("QnaDAO.answerCount", commu_no);
	}

	public void admin_updateQna(CommunityVO vo) {
		System.out.println("===> mybatis admin_updateQna() 기능처리");
		mybatis.update("QnaDAO.admin_updateQna", vo);
	}
	// 관리자 리스트
	public List<QnaVO> QnaListAd(QnaVO vo) {
		System.out.println("유저 마이 바티스 실행");
		List<QnaVO> c = mybatis.selectList("QnaDAO.QnaListAd");
		for(QnaVO v : c ) {
			System.out.println("v: "+v);
		}
		return mybatis.selectList("QnaDAO.QnaListAd");
	}

}
