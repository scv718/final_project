package com.project.community.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.community.CommunityVO;

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

	// QNA 목록 조회(여러줄)
	public List<CommunityVO> getQnaList(CommunityVO vo) {
		System.out.println("===> mybatis getQnaList() 기능처리");
		return mybatis.selectList("QnaDAO.getQnaList", vo);
	}

	// 전체 글 목록 개수
	public int totalQnaListCnt(CommunityVO vo) {
		System.out.println("===> mybatis totalQnaListCnt() 기능처리");
		return mybatis.selectOne("QnaDAO.totalQnaListCnt", vo);
	}

}
