package com.project.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.user.AddressVO;
import com.project.user.UserVO;

@Repository
public class AddressDAOMybatis {

	@Autowired
	SqlSessionTemplate mybatis;

	public AddressVO selectDefaultAddress(AddressVO vo) {
		
		return mybatis.selectOne("PaymentDAO.selectDefaultAddress", vo);
	}
	
	public void firstaddAddress(AddressVO vo) {
		
		mybatis.insert("PaymentDAO.firstaddAddress", vo);
	}
	public void firstUpdate(AddressVO vo) {
		
		mybatis.update("PaymentDAO.firstUpdate", vo);
	}
	
	
	public void addAddress(AddressVO vo) {
		
		mybatis.insert("PaymentDAO.addAddress", vo);
	}
	public AddressVO selectAddress(AddressVO vo) {
		return mybatis.selectOne("PaymentDAO.selectAddress", vo);
	}
	public void selectUpdate(AddressVO vo) {
		 mybatis.selectOne("PaymentDAO.selectUpdate", vo);
	}
}
