package com.project.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.common.PagingVO;
import com.project.community.CommunityVO;
import com.project.community.Impl.FaqDAOMybatis;

@Controller
@SessionAttributes("community")
public class FaqController {

	@Autowired
	private FaqDAOMybatis faqService;

	// ======= 사용자 =======

	// 검색창
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
	}

	// 공지사항 목록 조회 - 사용자
	@RequestMapping("/getFaqList.wp")
	public String getFaqList(CommunityVO vo, String nowPageBtn, Model model,
			@RequestParam(defaultValue = "zero") String viewType) {
		System.out.println("사용자");

		// 총 목록 수
		int totalPageCnt = faqService.totalFaqListCnt(vo);

		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt: " + totalPageCnt + ", nowPage: " + nowPage);

		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;

		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("FaqList", faqService.getFaqList(vo));
		return "WEB-INF/view/community/getFaqList.jsp";
	}

	// ======= 관리자 =======
	// 페이지만 이동
	@GetMapping(value = "/admin_insertFaq.wp")
	public String insertFaq_get(CommunityVO vo) throws IllegalStateException, IOException {
		return "WEB-INF/view/community/admin_insertFaq.jsp";
	}

	// 
	@PostMapping(value = "/admin_insertFaq.wp")
	public String insertFaq(CommunityVO vo) throws IllegalStateException, IOException {
		faqService.admin_insertFaq(vo);
		return "redirect:admin_getFaqList.wp";
	}

	// 글 수정
	@PostMapping("/admin_updateFaq.wp")
	public String updateFaq(@ModelAttribute("community") CommunityVO vo, Model model)
			throws IllegalStateException, IOException {
//		if( vo.getWriter().equals(session.getAttribute("userName").toString()) ){
//			boardService.updateBoard(vo);
//			return "getBoardList.do";
//		}else {
//			return "getBoard.do?error=1";
//		}
		faqService.admin_updateFaq(vo);
		return "admin_getFaqList.wp";

	}

	// 공지사항 삭제
	@RequestMapping("/admin_deleteFaq.wp")
	public String deleteFaq(CommunityVO vo) {
		faqService.admin_deleteFaq(vo);
		return "admin_getFaqList.wp";
	}

	// 공지사항 상세 조회
	@RequestMapping("/admin_getFaq.wp")
	public String getFaq(CommunityVO vo, Model model) {
		model.addAttribute("community", faqService.admin_getFaq(vo));
		return "WEB-INF/view/community/admin_getFaq.jsp";
	}

	// 공지사항 목록 조회 - 관리자
	@RequestMapping("/admin_getFaqList.wp")
	public String admin_getFaqList(CommunityVO vo, String nowPageBtn, Model model) {
		System.out.println("관리자");

		// 총 목록 수
		int totalPageCnt = faqService.totalFaqListCnt(vo);

		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("totalPageCnt: " + totalPageCnt + ", nowPage: " + nowPage);

		// 한페이지당 보여줄 목록 수
		int onePageCnt = 10;

		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 5;

		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());

		model.addAttribute("paging", pvo);
		model.addAttribute("FaqList", faqService.getFaqList(vo));
		return "WEB-INF/view/community/admin_getFaqList.jsp";
	}

}
