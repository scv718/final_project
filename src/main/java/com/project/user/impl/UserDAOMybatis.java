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
	
	
	
}
