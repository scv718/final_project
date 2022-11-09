package com.project.community.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.community.AnswerVO;
import com.project.community.CommunityVO;

@Repository
public class AnswerDAOMybatis {

	@Autowired // 자료형주입
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	// 답변 등록
	public void insertAnswer(AnswerVO vo) {
		System.out.println("===> mybatis insertAnswer() 기능처리");
		mybatis.insert("AnswerDAO.insertAnswer", vo);
		// namespace명.객체명
	}

	// 답변 수정
	public void updateAnswer(AnswerVO vo) {
		System.out.println("===> mybatis updateAnswer() 기능처리");
		mybatis.update("AnswerDAO.updateAnswer", vo);
	}

	// 답변 삭제
	public void deleteAnswer(AnswerVO vo) {
		System.out.println("===> mybatis deleteAnswer() 기능처리");
		mybatis.delete("AnswerDAO.deleteAnswer", vo);
	}

	// 답변 상세 조회(한줄)
	public AnswerVO getAnswer(AnswerVO vo) {
		System.out.println("===> mybatis getAnswer() 기능처리");
		return (AnswerVO) mybatis.selectOne("AnswerDAO.getAnswer", vo);
	}

	// 답변 목록 조회(여러줄)
	public List<AnswerVO> getAnswerList(AnswerVO vo) {
		System.out.println("===> mybatis getAnswerList() 기능처리");
		return mybatis.selectList("AnswerDAO.getAnswerList", vo);
	}

	// 전체 답변 목록 개수
	public int totalAnswerListCnt(AnswerVO vo) {
		System.out.println("===> mybatis totalAnswerListCnt() 기능처리");
		return mybatis.selectOne("FaqDAO.totalAnswerListCnt", vo);
	}
}
