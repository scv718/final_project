package com.project.wine.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.cart.CartVO;
import com.project.subscribe.SubscribeVO;
import com.project.wine.WineVO;

@Repository
public class ProductDAOmybatis {

	
	@Autowired
	private SqlSessionTemplate mybatis;

	public WineVO productDetail(WineVO vo) {
		
		return mybatis.selectOne("ProductDAO.productdetail", vo);
	}
	public List<WineVO> subscribeproduct(SubscribeVO vo) {
		
		return mybatis.selectList("ProductDAO.subscribeproduct", vo);
	}

	public List<WineVO> subscribeW1(WineVO vo) {
		return mybatis.selectList("ProductDAO.subscribeW1", vo);
	}
	public List<WineVO> subscribeW2(WineVO vo) {
		return mybatis.selectList("ProductDAO.subscribeW2", vo);
	}
	public List<WineVO> subscribeW3(WineVO vo) {
		return mybatis.selectList("ProductDAO.subscribeW3", vo);
	}
	
}
