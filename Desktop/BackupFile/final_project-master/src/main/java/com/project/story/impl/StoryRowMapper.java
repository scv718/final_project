package com.project.story.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.story.StoryVO;
import com.project.subscribe.SubscribeVO;

public class StoryRowMapper implements RowMapper<StoryVO> {

	@Override
	public StoryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		StoryVO vo = new StoryVO();

		vo.setStory_a_no(rs.getInt("story_no"));
		vo.setStory_no(rs.getInt("story_p_no"));
		vo.setStory_p_no(rs.getInt("story_a_no"));
		vo.setStory_title(rs.getString("story_title"));
		vo.setStory_content(rs.getString("story_content"));
		vo.setStory_back_img(rs.getString("story_back_img"));
		vo.setStory_add_img(rs.getString("story_add_img"));
		
		return vo;
	}

}
