package com.project.intro.impl;

import java.sql.ResultSet; 
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.project.intro.IntroVO;

public class IntroRowMapper implements RowMapper<IntroVO>{

   @Override
   public IntroVO mapRow(ResultSet rs, int rowNum) throws SQLException {
      IntroVO intro = new IntroVO();
      intro.setIntro_no(rs.getInt("intro_no"));
      intro.setIntro_a_no(rs.getInt("intro_a_no"));
      intro.setIntro_title(rs.getString("intro_title"));
      intro.setIntro_content(rs.getString("intro_content"));
      intro.setIntro_bg(rs.getString("intro_bg"));
      intro.setIntro_sg(rs.getString("intro_sg"));
      intro.setFilename(rs.getString("filename"));
      
      
      return intro;
   }

   
}