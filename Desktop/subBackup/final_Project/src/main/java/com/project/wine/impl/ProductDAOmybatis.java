package com.project.wine.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.wine.WineVO;

@Repository
public class ProductDAOmybatis {

	
	@Autowired
	private SqlSessionTemplate mybatis;

	public WineVO productDetail(WineVO vo) {
		
		return mybatis.selectOne("ProductDAO.productdetail", vo);
	}
	
}
