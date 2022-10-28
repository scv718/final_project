package com.project.user.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.user.UserVO;

public class UserRowMapper implements RowMapper<UserVO>{

	@Override
	public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		// 0 1 2 순으로 가져옴.
		// 일반 row 개수랑 다름 일반은 1 2 3 
		UserVO user = new UserVO();
		user.setId(rs.getString("id"));
		user.setM_pw(rs.getString("m_pw"));
		user.setM_name(rs.getString("m_name"));
		user.setLevel(rs.getInt("level"));
		return user;
	}
	
	

}
