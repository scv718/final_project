package com.project.intro.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.intro.IntroVO;

@Repository
public class IntroDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 인트로 등록
	public void insertIntro(IntroVO vo) {
		System.out.println("===> mybatis insertIntro() 기능처리");
		mybatis.insert("IntroDAO.insertIntro", vo);
		// namespace명.객체명
	}

	// 인트로 정보 수정
	public void updateIntro(IntroVO vo) {
		System.out.println("===> mybatis updateIntro() 기능처리");
		mybatis.update("IntroDAO.updateIntro", vo);
	}
	
	// 글 상세 조회(한줄)
		public IntroVO getIntro(IntroVO vo) {
			System.out.println("===> mybatis getIntro() 기능처리");
			return (IntroVO) mybatis.selectOne("IntroDAO.getIntro", vo);
		}

	// 인트로 정보 조회
	public List<IntroVO> getIntroList(IntroVO vo) {
		System.out.println("===> mybatis getIntroList() 기능처리");
		return mybatis.selectList("IntroDAO.getIntroList", vo);
	}

}