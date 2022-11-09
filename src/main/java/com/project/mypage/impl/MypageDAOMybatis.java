package com.project.mypage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mypage.MypageVO;

@Repository
public class MypageDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// CRUD 기능의 메소드 구현
	
	// 추가
	public void insertMypage(MypageVO vo) {
		System.out.println("===>mybatis로 insertMypage() 기능처리");
		mybatis.insert("MypageDAO.insertSubscribe", vo);
	}
	// 삭제
		public void deleteMypage(MypageVO vo) {
			System.out.println("===>mybatis로 deleteMypage() 기능처리");
			mybatis.update("MypageDAO.deleteMypage", vo);
		}
	// 수정
	public void updateMypage(MypageVO vo) {
		System.out.println("===>mybatis로 updateMypage() 기능처리");
		mybatis.update("MypageDAO.updateMypage", vo);
	}

	// 구독 조회
	public MypageVO getMypage(MypageVO vo) {
		System.out.println("===>mybatis로 getMypage() 기능처리");
		return (MypageVO) mybatis.selectOne("MypageDAO.getMypage", vo);
	}

	// 구독 조회
	public List<MypageVO> getMypageList(MypageVO vo) {
		System.out.println("===>mybatis로 getMypageList() 기능처리 ");
		return mybatis.selectList("MypageDAO.getMypageList", vo);
	}
	
	
}