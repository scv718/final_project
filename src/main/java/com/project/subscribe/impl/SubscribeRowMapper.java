package com.project.subscribe.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.subscribe.SubscribeVO;

public class SubscribeRowMapper implements RowMapper<SubscribeVO> {

	@Override
	public SubscribeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		SubscribeVO vo = new SubscribeVO();

		vo.setId(rs.getString("id"));
		vo.setLevel(rs.getInt("level"));
		vo.setOption(rs.getString("option"));
		vo.setS_date(rs.getString("s_date"));
		vo.setE_date(rs.getString("e_date"));
		vo.setSub_status(rs.getInt("sub_status"));
		
		return vo;
	}

}
