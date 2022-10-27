package com.project.wine.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.story.StoryVO;
import com.project.wine.WineVO;

public class WineRowMapper implements RowMapper<WineVO> {

	@Override
	public WineVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		WineVO vo = new WineVO();
		
		
		vo.setW_no(rs.getInt("w_no"));
		vo.setW_nm_k(rs.getString("w_nm_k"));
		vo.setW_nm_e(rs.getString("w_nm_e"));
		vo.setContinental(rs.getString("continental"));
		vo.setCountry(rs.getString("country"));
		vo.setSince(rs.getInt("since"));
		vo.setType(rs.getInt("type"));
		vo.setW_sweet(rs.getInt("w_sweet"));
		vo.setW_body(rs.getInt("w_body"));
		vo.setW_acidity(rs.getInt("w_acidity"));
		vo.setW_tannins(rs.getInt("w_tannins"));
		vo.setQuantity(rs.getInt("quantity"));
		vo.setW_price(rs.getInt("w_price"));
		vo.setW_info(rs.getString("	w_info"));
		vo.setW_image1(rs.getString("w_image1"));
		vo.setW_image2(rs.getString("w_image2"));
		vo.setW_s_img(rs.getString("w_s_img"));
		vo.setW_b_img(rs.getString("w_b_img"));
		vo.setW_a_img(rs.getString("w_a_img"));
		vo.setW_t_img(rs.getString("w_t_img"));
		
			
		return vo;
	}

}
