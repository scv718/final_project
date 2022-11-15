package com.project.subscribe.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.subscribe.SubscribeVO;
import com.project.user.UserVO;

@Repository
public class SubscribeDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// CRUD 기능의 메소드 구현
	// 구독하기
	public void insertSubscribe0(SubscribeVO vo) {
		mybatis.insert("SubscribeDAO.insertSubscribe0", vo);
		
	}
	public void insertSubscribe1(SubscribeVO vo) {
		mybatis.update("SubscribeDAO.insertSubscribe1", vo);
		
	}
	public void insertSubscribe2(SubscribeVO vo) {
		mybatis.update("SubscribeDAO.insertSubscribe2", vo);
		
	}
	public void insertSubscribe3(SubscribeVO vo) {
		mybatis.update("SubscribeDAO.insertSubscribe3", vo);
	}

	// 구독 취소
	public void updateSubscribe(SubscribeVO vo) {
		mybatis.update("SubscribeDAO.updateSubscribe", vo);
	}

	// 구독 조회
	public int getSubscribe(SubscribeVO vo) {
		return mybatis.selectOne("SubscribeDAO.getSubscribe", vo);
	}
	
	// 구독 목록 조회
	public List<SubscribeVO> getSubscribeList(SubscribeVO vo) {
		return mybatis.selectList("SubscribeDAO.getSubscribeList", vo);
	}
	public SubscribeVO getLevel(SubscribeVO vo) {
		return mybatis.selectOne("SubscribeDAO.getLevel", vo);
	}
	
	public void preference_Setting(SubscribeVO vo) {
		 mybatis.update("SubscribeDAO.preference_Setting", vo);
	}
	//구독시 배송비 조회
	public List<SubscribeVO> level_shipping(String vo) {
		return mybatis.selectList("SubscribeDAO.level_shipping", vo);
	}
	public void liset_deli_price(SubscribeVO vo) {
		mybatis.update("SubscribeDAO.liset_deli_price", vo);
	}
	public void liset_deli_price_up(SubscribeVO vo) {
		mybatis.update("SubscribeDAO.liset_deli_price_up", vo);
	}

	//조회
	public List<SubscribeVO> allsubscriptList(SubscribeVO vo) {
		List<SubscribeVO> a = mybatis.selectList("SubscribeDAO.allsubscriptList");
		for (SubscribeVO v : a) {
			System.out.println("v: " + v);
		}
		return mybatis.selectList("SubscribeDAO.allsubscriptList");
	}
	public void insertProduct(SubscribeVO vo) {
		mybatis.update("SubscribeDAO.insertProduct", vo);
	}
}