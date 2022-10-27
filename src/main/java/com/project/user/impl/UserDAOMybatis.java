package com.project.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.user.UserVO;


@Repository
public class UserDAOMybatis {

	
	@Autowired
	SqlSessionTemplate mybatis;
	
	public UserVO getUser(UserVO vo) {
		System.out.println("마이바티스 getUser 실행");

//		Object[] args = {vo.getId(), vo.getPassword()};
//		try {
//			return jdbcTemplate.queryForObject(USER_GET, new UserRowMapper(),args);
//		}catch(EmptyResultDataAccessException e) {
//			return null;
//		}
		return mybatis.selectOne("UserDAO.getUser", vo);	
		
		
	}
	
	public int checkUser(String id) {
		System.out.println("아이디 체크 실행");
		return mybatis.selectOne("UserDAO.checkUser", id);
	}
	public void insertUser(UserVO vo) {
		mybatis.insert("UserDAO.insertUser", vo);
		
	}
	
	public UserVO getId(UserVO vo) {
		
		return mybatis.selectOne("UserDAO.getId", vo);
	}
	public int getPw(UserVO vo) {
		
		return mybatis.selectOne("UserDAO.getPw", vo);
	}
	
	public int changePw(String m_phone) {
		return mybatis.update("UserDAO.changePw", m_phone);
	}
	
	
	
}
