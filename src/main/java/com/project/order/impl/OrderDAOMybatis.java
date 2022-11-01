package com.project.order.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.order.M_addVO;
import com.project.order.OrderVO;
import com.project.subscribe.SubscribeVO;

@Repository
public class OrderDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// CRUD 기능의 메소드 구현
	//추가
	//m_add 테이블
	public void oredr_m_add(M_addVO mvo) {
		System.out.println("m_add 주소 추가");
		mybatis.insert("OrderDAO.oredr_m_add", mvo);	
	}

	// 조회
	public M_addVO getm_add(M_addVO mvo) {
		return (M_addVO) mybatis.selectOne("OrderDAO.getm_add", mvo);
	}
		

	//  취소
	public void updateSubscribe(SubscribeVO vo) {
		System.out.println("===>mybatis로 updateSubscribe() 기능처리");
		mybatis.update("SubscribeDAO.updateSubscribe", vo);
	}

	
	
	public int getSubscribe(SubscribeVO vo) {
		System.out.println("===>mybatis로 getSubscribe() 기능처리");
		return mybatis.selectOne("SubscribeDAO.getSubscribe", vo);
	}
	
	// 목록 조회
	public List<OrderVO> getorderList(OrderVO vo){
		return mybatis.selectList("SubscribeDAO.getorderList", vo);
	}
	
}