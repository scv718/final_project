package com.project.intro;

public interface IntroService {

   // Winery 조회 - 사용자
   IntroVO getIntro(IntroVO vo);
      

   // Winery 수정 - 관리자
   void admin_updateIntro(IntroVO vo);
      
}