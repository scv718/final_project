package com.project.mypage.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.mypage.MypageVO;
import com.project.subscribe.SubscribeVO;

public class MypageRowMapper implements RowMapper<MypageVO> {

	@Override
	public MypageVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MypageVO vo = new MypageVO();

//		vo.setId(rs.getString("id"));
//		vo.setLevel(rs.getInt("level"));
	
		return vo;
	}

}
