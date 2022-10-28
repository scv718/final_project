package com.project.subscribe.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.subscribe.SubscribeVO;
import com.project.user.UserService;
import com.project.user.UserVO;

@Repository
public class SubscribeDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// CRUD 기능의 메소드 구현
	// 구독하기
	public void insertSubscribe1(SubscribeVO vo) {
		System.out.println("===>mybatis로 insertSubscribe() 기능처리");
		mybatis.insert("SubscribeDAO.insertSubscribe", vo);
	}
	public void insertSubscribe2(SubscribeVO vo) {
		System.out.println("===>mybatis로 insertSubscribe() 기능처리");
		mybatis.insert("SubscribeDAO.insertSubscribe", vo);
	}
	public void insertSubscribe3(SubscribeVO vo) {
		System.out.println("===>mybatis로 insertSubscribe() 기능처리");
		mybatis.insert("SubscribeDAO.insertSubscribe", vo);
	}

	// 구독 취소
	public void updateSubscribe(SubscribeVO vo) {
		System.out.println("===>mybatis로 updateSubscribe() 기능처리");
		mybatis.update("SubscribeDAO.updateSubscribe", vo);
	}

	// 구독 조회
	public SubscribeVO getSubscribe(SubscribeVO vo) {
		System.out.println("===>mybatis로 getSubscribe() 기능처리");
		return (SubscribeVO) mybatis.selectOne("SubscribeDAO.getSubscribe", vo);
	}

	// 구독 조회
	public List<SubscribeVO> getSubscribeList(SubscribeVO vo) {
		System.out.println("===>mybatis로 getSubscribeList() 기능처리 ");
		return mybatis.selectList("SubscribeDAO.getSubscribeList", vo);
	}
}