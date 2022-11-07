package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.PagingVO;
import com.project.community.CommunityVO;
import com.project.community.Impl.QnaDAOMybatis;
import com.project.review.ReviewVO;

@Controller
@SessionAttributes("community")
public class QnaController {
	
	@Autowired
	private QnaDAOMybatis qnaService;
	
	@GetMapping(value="/insertQna.wp")
	public String insertQna_get(CommunityVO vo) throws IllegalStateException, IOException {
		return "WEB-INF/view/community/insertQna.jsp";
	}
	
	
	//"uploadFile" 추가시 
	@PostMapping(value = "/insertQna.wp")
//	public String insertBoard(MultipartHttpServletRequest request, BoardVO vo) throws IllegalStateException, IOException {
	public String insertQna(CommunityVO vo) throws IllegalStateException, IOException {
//		MultipartFile uplodFile = vo.getUploadFile();
		//realPath 추가
//	    String realPath = request.getSession().getServletContext().getRealPath("/img/");
//		String realPath = "c:/swork/final_project/src/main/webapp/resources/img/" ;
//	    String commu_photo1 = uplodFile.getOriginalFilename();
//		if(!uplodFile.isEmpty()) {
//			vo.setCommu_photo1(commu_photo1);
//			uplodFile.transferTo(new File(realPath+commu_photo1));
//		}
		qnaService.insertQna(vo);
		return "redirect:getQnaList.wp";
	}

	// 글 수정
	@PostMapping("/updateQna.wp")
//		public String updateNotice(MultipartHttpServletRequest request,@ModelAttribute("community") CommunityVO vo, Model model) 
//				throws IllegalStateException, IOException{
		public String updateQna(@ModelAttribute("community") CommunityVO vo, Model model) {
//		if( vo.getWriter().equals(session.getAttribute("userName").toString()) ){
//			boardService.updateBoard(vo);
//			return "getBoardList.do";
//		}else {
//			return "getBoard.do?error=1";
//		}
		qnaService.updateQna(vo);
		return "getQnaList.wp";
		
	}
	
	@GetMapping(value="/updateQna.wp")
	public String insertFaq_get(CommunityVO vo, Model model) throws IllegalStateException, IOException {
//		ReviewVO a =  qnaService.detailReview(vo);
//		model.addAttribute("detailReview",a);
		return "WEB-INF/view/community/updateQna.jsp";
	}

	// 공지사항 삭제
	@RequestMapping("/deleteQna.wp")
	public String deleteQna(CommunityVO vo) {
//		public String deleteNotice(CommunityVO vo, HttpSession session) {
//		String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
//		vo = noticeService.getNotice(vo);
//		if( vo.getWriter().equals(session.getAttribute("userName").toString()) ) {
//			if(vo.getFilename()!=null) {
//				System.out.println("파일삭제: "+realPath + vo.getFilename());
//				File f = new File(realPath + vo.getFilename());		
//				f.delete();
//			}
//			boardService.deleteBoard(vo);
//			return "getBoardList.do";
//		}else {
//			return "getBoard.do?error=1";
//		}
		
		qnaService.deleteQna(vo);
		return "getQnaList.wp";
	}

	// 공지사항 상세 조회
	@RequestMapping("/getQna.wp")
//	public String getNotice(@ModelAttribute("community")CommunityVO vo, Model model) {
		public String getQna(CommunityVO vo, Model model) {
		
//		List<CommunityVO> list = noticeService.getNotice(vo.getCommu_no());
		System.out.println(qnaService.getQna(vo));
		model.addAttribute("community", qnaService.getQna(vo));
		return "WEB-INF/view/community/updateQna.jsp";
	}

	// 공지사항 목록 조회
	@RequestMapping("/getQnaList.wp")
	public String getQnaList(CommunityVO vo, String nowPageBtn, Model model, HttpSession session) {
		System.out.println("글 목록 검색 처리");
		
		//총 목록 수 
		int totalPageCnt = qnaService.totalQnaListCnt(vo);
		
		//현재 페이지 설정 
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
		
		//한페이지당 보여줄 목록 수
		int onePageCnt = 10;
		
		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
		
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());
		
		
		vo.setId((String) session.getAttribute("userID"));
		model.addAttribute("paging", pvo);
		model.addAttribute("getQnaList", qnaService.getQnaList(vo));
		return "WEB-INF/view/community/getQnaList.jsp";
	}
}
