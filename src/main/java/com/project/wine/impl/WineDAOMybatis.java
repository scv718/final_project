package com.project.wine.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.wine.WineVO;

@Repository
public class WineDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	// 구독하기
	public void insertWine(WineVO vo) {
		System.out.println("===>mybatis로 insertSubscribe() 기능처리");
		mybatis.insert("SubscribeDAO.insertSubscribe", vo);
	}

	// 구독 수정
	public void updateWine(WineVO vo) {
		System.out.println("===>mybatis로 updateSubscribe() 기능처리");
		mybatis.update("SubscribeDAO.updateSubscribe", vo);
	}

	// 구독 취소
	public void deleteWine(WineVO vo) {
		System.out.println("===>mybatis로 deleteSubscribe() 기능처리");
		mybatis.delete("SubscribeDAO.deleteSubscribe", vo);
	}

	// 구독 조회
	public WineVO getWine(WineVO vo) {
		System.out.println("===>mybatis로 getSubscribe() 기능처리");
		return (WineVO) mybatis.selectOne("SubscribeDAO.getSubscribe", vo);
	}

	// 구독 조회
	public List<WineVO> getWineList(WineVO vo) {
		System.out.println("===>mybatis로 getSubscribeList() 기능처리 ");
		return mybatis.selectList("SubscribeDAO.getSubscribeList", vo);
	}
}