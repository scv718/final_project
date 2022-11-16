package com.project.intro.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.intro.IntroService;
import com.project.intro.IntroVO;

@Service("introService")
public class IntroServiceImpl implements IntroService {

   @Autowired
   private IntroDAOMybatis introDAO;

   // Winery 조회 - 사용자
   @Override
   public IntroVO getIntro(IntroVO vo) {
      return introDAO.getIntro(vo);
   }
   
   
   // Winery 수정 - 관리자
   @Override
   public void admin_updateIntro(IntroVO vo) {
      introDAO.admin_updateIntro(vo);
   }   

}