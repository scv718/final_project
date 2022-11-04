package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.maven.shared.invoker.SystemOutHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
		String realPath = "c:/swork/wine2/src/main/webapp/img/";
		String fileName = uploadFile.getOriginalFilename();
		if(!uploadFile.isEmpty()) {
			vo.setFilename(fileName);
			uploadFile.transferTo(new File(realPath+fileName));
		}
		reviewService.insertReview(vo);
		return "getReviewList.wp";
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
	
	@GetMapping(value="/download.wp")
	public void fileDownLoad(@RequestParam(value="filename", required=false) String filename, HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("파일 다운로드");
		if(!(filename == null || filename.equals(""))) {
			// 요청파일 정보 불러오기
			String realPath = "c:/swork/wine2/src/main/webapp/img/";
			// String realPath = request.getSession().getServletContext().getRealPath("/img/");
			File file = new File(realPath + filename);
			
			// 한글은 http 헤더에 사용할 수 없기 때문에 파일명은 영문으로 인코딩하여 헤더에 적용한다.
			String fn = new String(file.getName().getBytes(), "iso_8859_1");
			
			//ContentType설정
			byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
			response.setHeader("Content-Disposition", "attachment; filename=\""+ fn + "\"");
			response.setContentLength(bytes.length);
	//			response.setContentType("image/jpeg");
	        
			response.getOutputStream().write(bytes);
	        response.getOutputStream().flush();
	        response.getOutputStream().close();
		}
	}
}
