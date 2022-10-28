package com.project.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.intro.IntroVO;
import com.project.intro.impl.IntroDAOMybatis;

@Controller
//@SessionAttributes("intro")
public class IntroController {

	@Autowired
	private IntroDAOMybatis introService;

	// 인트로 상세 조회
	@RequestMapping("/getIntro.wp")
	public String getIntro(IntroVO vo, Model model) {
		System.out.println(introService.getIntro(vo));
		model.addAttribute("intro", introService.getIntro(vo));
		return "intro_modify.jsp";
	}

	// 인트로 조회
	@RequestMapping("/getIntroList.wp")
	public String getIntroList(IntroVO vo, Model model) {
		System.out.println("체크");
		model.addAttribute("introList", introService.getIntroList(vo));
		System.out.println(introService.getIntroList(vo));
		return "intro_modify.jsp";
	}

	// 인트로 입력 "uploadFile" 추가시
//	@PostMapping(value = "/insertIntro.wp")
//	public String insertIntro(MultipartHttpServletRequest request, IntroVO vo)
//			throws IllegalStateException, IOException {
////	public String insertIntro(IntroVO vo) throws IllegalStateException, IOException {
//		MultipartFile uplodFile = vo.getUploadFile();
//		// realPath 추가
//		String realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
////		String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
//		String fileName = uplodFile.getOriginalFilename();
//		if (!uplodFile.isEmpty()) {
//			vo.setFilename(fileName);
//			uplodFile.transferTo(new File(realPath + fileName));
//		}
//		introService.insertIntro(vo);
//		return "getIntroList.wp";
//	}

	// 인트로 수정
	@RequestMapping("/updateIntro.wp")
	public String updateIntro(MultipartHttpServletRequest request, IntroVO vo, Model model) 
			throws IllegalStateException, IOException{
//		public String updateIntro(IntroVO vo, Model model) throws IllegalStateException, IOException {

//		if( vo.getWriter().equals(session.getAttribute("userName").toString()) ){
//			boardService.updateBoard(vo);
//			return "getBoardList.do";
//		}else {
//			return "getBoard.do?error=1";
//		}
		
//		public String insertIntro(IntroVO vo) throws IllegalStateException, IOException {
			MultipartFile uploadFile = vo.getUploadFile();
			MultipartFile uploadFile2 = vo.getUploadFile2();
			MultipartFile uploadFile3 = vo.getUploadFile3();
			MultipartFile uploadFile4 = vo.getUploadFile4();
			MultipartFile uploadFile5 = vo.getUploadFile5();
			
			System.out.println(uploadFile);
			// realPath 추가
//			String realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
			String realPath = "c:/swork/final_project/src/main/webapp/resources/img/" ;
			String intro_img = uploadFile.getOriginalFilename();
			if (!uploadFile.isEmpty()) {
				vo.setIntro_img(intro_img);
				uploadFile.transferTo(new File(realPath + intro_img));
			}
			
			String realPath2 = "c:/swork/final_project/src/main/webapp/resources/img/" ;
			String intro_s_img1 = uploadFile2.getOriginalFilename();
			if (!uploadFile2.isEmpty()) {
				vo.setIntro_s_img1(intro_s_img1);
				uploadFile2.transferTo(new File(realPath2 + intro_s_img1));
			}
			
			String realPath3 = "c:/swork/final_project/src/main/webapp/resources/img/" ;
			String intro_s_img2 = uploadFile3.getOriginalFilename();
			if (!uploadFile2.isEmpty()) {
				vo.setIntro_s_img2(intro_s_img2);
				uploadFile3.transferTo(new File(realPath3 + intro_s_img2));
			}
			
			String realPath4 = "c:/swork/final_project/src/main/webapp/resources/img/" ;
			String intro_s_img3 = uploadFile4.getOriginalFilename();
			if (!uploadFile4.isEmpty()) {
				vo.setIntro_s_img3(intro_s_img3);
				uploadFile4.transferTo(new File(realPath4 + intro_s_img3));
			}
			
			String realPath5 = "c:/swork/final_project/src/main/webapp/resources/img/" ;
			String intro_s_img4 = uploadFile5.getOriginalFilename();
			if (!uploadFile5.isEmpty()) {
				vo.setIntro_s_img4(intro_s_img4);
				uploadFile5.transferTo(new File(realPath5 + intro_s_img4));
			}
			
			
			
		introService.updateIntro(vo);
		return "getIntro.wp";
	}

}