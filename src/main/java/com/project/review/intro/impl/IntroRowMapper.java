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
      intro.setIntro_img(rs.getString("intro_img"));
      intro.setIntro_t1(rs.getString("intro_t1"));
      intro.setIntro_t1_2(rs.getString("intro_t1_2"));
      intro.setIntro_t2(rs.getString("intro_t2"));
      intro.setIntro_t2_2(rs.getString("intro_t2_2"));
      intro.setIntro_s_img1(rs.getString("intro_s_img1"));
      intro.setIntro_s_t1(rs.getString("intro_s_t1"));
      intro.setIntro_s_c1(rs.getString("intro_s_c1"));
      intro.setIntro_s_c1_2(rs.getString("intro_s_c1_2"));
      intro.setIntro_s_img2(rs.getString("intro_s_img2"));
      intro.setIntro_s_t2(rs.getString("intro_s_t2"));
      intro.setIntro_s_c2(rs.getString("intro_s_c2"));
      intro.setIntro_s_c2_2(rs.getString("intro_s_c2_2"));
      intro.setIntro_s_img3(rs.getString("intro_s_img3"));
      intro.setIntro_s_t3(rs.getString("intro_s_t3"));
      intro.setIntro_s_c3(rs.getString("intro_s_c3"));
      intro.setIntro_s_c3_2(rs.getString("intro_s_c3_2"));
      intro.setIntro_info1(rs.getString("intro_info1"));
      intro.setIntro_info1_2(rs.getString("intro_info1_2"));
      intro.setIntro_s_img4(rs.getString("intro_s_img4"));
      intro.setIntro_s_t4(rs.getString("intro_s_t4"));
      intro.setIntro_s_c4(rs.getString("intro_s_c4"));
      intro.setIntro_s_c4_2(rs.getString("intro_s_c4_2"));
      intro.setIntro_s_c4_3(rs.getString("intro_s_c4_3"));
      intro.setIntro_s_c4_4(rs.getString("intro_s_c4_4"));
      intro.setIntro_s_c4_5(rs.getString("intro_s_c4_5"));
      intro.setIntro_s_c4_6(rs.getString("intro_s_c4_6"));

      return intro;
   }

   
}