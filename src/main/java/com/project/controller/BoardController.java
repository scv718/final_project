package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.project.common.PagingVO;
import com.project.like.LikeService;
import com.project.review.ReviewService;
import com.project.review.ReviewVO;

@Controller
@SessionAttributes("board")
public class BoardController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private LikeService likeService;
	
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENTS");
		conditionMap.put("상품", "PRODUCT");
		return conditionMap;
	}
	
	@ModelAttribute("conditionMap2")
	public Map<String, String> searchConditionMap2() {
		Map<String, String> conditionMap2 = new HashMap<String, String>();
		conditionMap2.put("최신순", "NEW");
		conditionMap2.put("추천순", "LIKE");
		return conditionMap2;
	}
	
	// 리뷰작성
	@PostMapping(value = "/insertReview.wp")
	public String insertReview(ReviewVO vo) throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/review/";
		String fileName = uploadFile.getOriginalFilename();
		if(!uploadFile.isEmpty()) {
			vo.setRe_photo1(fileName);
			uploadFile.transferTo(new File(realPath+fileName));
		}
		reviewService.insertReview(vo);
		return "getReviewList.wp";
	}
	
	// 리뷰 수정 페이지 이동
	@RequestMapping("/updateReviewPage.wp")
	public String updateReviewPage(ReviewVO vo, Model model) {
		ReviewVO a =  reviewService.detailReview(vo);
		model.addAttribute("detailReview",a);
		return "WEB-INF/board/updateReview.jsp";
	}
	
	// 리뷰수정
	@ResponseBody
	@RequestMapping(value = "/updateReview.wp", method = RequestMethod.POST)
	public String updateReview(ReviewVO vo, HttpSession session) {
//		@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request) {
//			
//		}
		if(vo.getId().equals(session.getAttribute("userID").toString())) {
			reviewService.updateReview(vo);
			return "detailReview.wp";
		} else {
			return "detailReview.wp?error=1";
		}
	}
	
	// 리뷰삭제
	@RequestMapping("/deleteReview.wp")
	public String deleteReview(ReviewVO vo, HttpSession session) {
	String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/review/";
		vo = reviewService.detailReview(vo);
		if(vo.getId().equals(session.getAttribute("userID").toString())) {
			if(vo.getRe_photo1() != null) {
				System.out.println("파일삭제: " + realPath + vo.getRe_photo1());
			}
			reviewService.deleteReview(vo);
			return "getReviewList.wp";
		} else {
			return "detailReview.wp?error=1";
		}
	}
	
	// 상품후기 상세조회
	@RequestMapping(value="/detailReview.wp", method=RequestMethod.GET)
	public String detailReview(ReviewVO vo, Model model) {
		ReviewVO a =  reviewService.detailReview(vo);
		model.addAttribute("detailReview",a);
		return "WEB-INF/board/detailReview.jsp";
	}
	
	// 상품후기 게시판 목록
	@RequestMapping("/getReviewList.wp")
	public String getReviewListPost(HttpServletRequest request, ReviewVO vo, String nowPageBtn, Model model) {
		System.out.println("글 목록 검색 처리");
		
		// 총 목록 수
		int totalPageCnt = reviewService.totalReviewListCnt(vo);
		
		// 현재 페이지 설정
		int nowPage = Integer.parseInt(nowPageBtn == null || nowPageBtn.equals("") ? "1" : nowPageBtn);
		System.out.println("총 목록 수: " + totalPageCnt);
		
		// 한 페이지당 보여줄 목록 수
		int onePageCnt = 10;
		
		// 한 번에 보여질 버튼 수
		int oneBtnCnt = 10;
		
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());
		System.out.println("pvo.getOffset(): "+pvo.getOffset());
		
		model.addAttribute("paging", pvo);
		model.addAttribute("reviewList", reviewService.getReviewList(vo));

		// 검색어 영문 대문자 처리
		if(vo.getSearchKeyword() != null) {
			model.addAttribute("search", vo.getSearchKeyword());
			model.addAttribute("category", vo.getSearchCondition());
			String upper = vo.getSearchKeyword().toUpperCase();
			System.out.println("검색어 : " + upper);
			vo.setSearchKeyword(upper);
		}
		
		return "WEB-INF/board/getReviewList.jsp";
	}
	
	//리뷰 추천
	@ResponseBody
	@RequestMapping(value = "/likeReview.wp", method = RequestMethod.POST)
	public int updateLike(int re_no, String id) throws Exception{
		int likeCheck = likeService.likeCheck(re_no, id);
		if(likeCheck == 0) {
			likeService.insertLike(re_no, id);
			likeService.updateLike(re_no); //게시판테이블 +1
			System.out.println(id + "님 " + re_no + "번리뷰 추천");
		}else if(likeCheck == 1) {
			likeService.updateLikeCancel(re_no); // 게시판테이블 -1
			likeService.deleteLike(re_no, id);
			System.out.println(id + "님 " + re_no + "번리뷰 추천해제");
		}
		return likeCheck;
	}
}
