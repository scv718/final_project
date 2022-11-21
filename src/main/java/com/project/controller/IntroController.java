package com.project.controller;

import java.io.File; 
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.intro.IntroVO;
import com.project.intro.impl.IntroDAOMybatis;

@Controller
@SessionAttributes("intro")
public class IntroController {

   @Autowired
   private IntroDAOMybatis introService;

   // Winery 상세 조회 - 사용자
   @RequestMapping("/getIntro.wp")
   public String getIntro(IntroVO vo, Model model) {
      System.out.println(introService.getIntro(vo));
      model.addAttribute("intro", introService.getIntro(vo));
      return "WEB-INF/view/intro/getIntro.jsp";
   }


   // Winery 상세 조회 - 관리자
   @RequestMapping("/admin_getIntro.wp")
   public String admin_getIntro(IntroVO vo, Model model) {
      System.out.println(introService.getIntro(vo));
      model.addAttribute("intro", introService.getIntro(vo));
      return "WEB-INF/view/admin/admin_getIntro.jsp";
   }


   // Winery 수정 - 관리자
   @RequestMapping("/admin_updateIntro.wp")
   public String admin_updateIntro(MultipartHttpServletRequest request, @ModelAttribute("intro") IntroVO vo, Model model, HttpSession session) 
         throws IllegalStateException, IOException{
      
         MultipartFile uploadFile = vo.getUploadFile();
         MultipartFile uploadFile2 = vo.getUploadFile2();
         MultipartFile uploadFile3 = vo.getUploadFile3();
         MultipartFile uploadFile4 = vo.getUploadFile4();
         MultipartFile uploadFile5 = vo.getUploadFile5();
         
         String realPath = "c:/swork/final_project/src/main/webapp/resources/img/intro/" ;
         String path = session.getServletContext().getRealPath("/")+"resources\\img\\intro\\";
         String intro_img = uploadFile.getOriginalFilename();
         if (!uploadFile.isEmpty()) {
            vo.setIntro_img(intro_img);
            uploadFile.transferTo(new File(path + intro_img));
         }

         String realPath2 = "c:/swork/final_project/src/main/webapp/resources/img/intro/" ;
         String intro_s_img1 = uploadFile2.getOriginalFilename();
         if (!uploadFile2.isEmpty()) {
            vo.setIntro_s_img1(intro_s_img1);
            uploadFile2.transferTo(new File(path + intro_s_img1));
         }
         
         String realPath3 = "c:/swork/final_project/src/main/webapp/resources/img/intro/" ;
         String intro_s_img2 = uploadFile3.getOriginalFilename();
         if (!uploadFile3.isEmpty()) {
            vo.setIntro_s_img2(intro_s_img2);
            uploadFile3.transferTo(new File(path + intro_s_img2));
         }
         
         String realPath4 = "c:/swork/final_project/src/main/webapp/resources/img/intro/" ;
         String intro_s_img3 = uploadFile4.getOriginalFilename();
         if (!uploadFile4.isEmpty()) {
            vo.setIntro_s_img3(intro_s_img3);
            uploadFile4.transferTo(new File(path + intro_s_img3));
         }
         
         String realPath5 = "c:/swork/final_project/src/main/webapp/resources/img/intro/" ;
         String intro_s_img4 = uploadFile5.getOriginalFilename();
         if (!uploadFile5.isEmpty()) {
            vo.setIntro_s_img4(intro_s_img4);
            uploadFile5.transferTo(new File(path + intro_s_img4));
         }
                  
         
      introService.admin_updateIntro(vo);
      return "getIntro.wp";
   }

}