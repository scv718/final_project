package com.project.intro.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.intro.IntroVO;

@Repository
public class IntroDAOMybatis {

   @Autowired
   private SqlSessionTemplate mybatis;

   
   // Winery 조회 - 사용자
   public IntroVO getIntro(IntroVO vo) {
      System.out.println("===> mybatis getIntro() 기능처리");
      return (IntroVO) mybatis.selectOne("IntroDAO.getIntro", vo);
   }

   
   // Winery 수정 - 관리자
   public void admin_updateIntro(IntroVO vo) {
      System.out.println("===> mybatis admin_updateIntro() 기능처리");
      mybatis.update("IntroDAO.admin_updateIntro", vo);
   }

}