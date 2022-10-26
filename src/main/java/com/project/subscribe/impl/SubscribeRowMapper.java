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
		vo.setSub_date(rs.getString("sub_date"));
		vo.setSub_pm_status(rs.getString("sub_pm_status"));
		vo.setSub_deli(rs.getInt("sub_deli"));
		vo.setE_date(rs.getString("e_date"));
		vo.setSub_status(rs.getInt("sub_status"));
		
		vo.setS_sweet(rs.getInt("s_sweet"));
		vo.setS_body(rs.getInt("s_body"));
		vo.setS_acidity(rs.getInt("s_acidity"));
		vo.setS_tannins(rs.getInt("s_tannins"));
		return vo;
	}

}
