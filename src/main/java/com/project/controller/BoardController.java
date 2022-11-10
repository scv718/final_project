package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.maven.shared.invoker.SystemOutHandler;
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
	
	// 배송완료된 회원인지 체크 및 리뷰 중복확인
	@ResponseBody
	@PostMapping("/existReview.wp")
	public String existReviewPost(int w_no, String id) throws Exception {
		String check = Integer.toString(reviewService.existReview(w_no, id)); //0이면 작성가능
		String check2 = Integer.toString(reviewService.orderMember(w_no, id)); //1이면 작성가능
		System.out.println(check + check2);
		return check + check2;
	}
	
	// 리뷰작성
	@ResponseBody
	@RequestMapping(value = "/insertReview.wp", method = RequestMethod.POST)
	public int insertReview(@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request, ReviewVO vo,  HttpSession session) throws IllegalStateException, IOException {
//		MultipartFile uploadFile = vo.getUploadFile();
//		String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/review/";
//		String fileName = uploadFile.getOriginalFilename();
//		if(!uploadFile.isEmpty()) {
//			vo.setRe_photo1(fileName);
//			uploadFile.transferTo(new File(realPath+fileName));
//		}
//		reviewService.insertReview(vo);
//		return "getReviewList.wp";
		
		System.out.println("리뷰 작성 컨트롤러");
		String strResult = "{ \"result\":\"FAIL\" }";
		
		int w_no = vo.getW_no();
		System.out.println("와인번호:"+w_no+", 회원id:"+vo.getId());
		
//		vo.setId((String)session.getAttribute("userID"));
		String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/review/";
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				int index = 1;
				for(MultipartFile file:multipartFile) {
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일명
					System.out.println("파일명"+savedFileName);

				    if(index == 1) {
				    	vo.setRe_photo1(savedFileName);
				    } else if(index == 2) {
				    	vo.setRe_photo2(savedFileName);
				    } else {
				    	vo.setRe_photo3(savedFileName);
				    }
				    index++;
					File targetFile = new File(realPath + savedFileName);	

					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						System.out.println("파일저장");
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile); //저장된 현재 파일 삭제
						e.printStackTrace();
						System.out.println("파일삭제");
						break;
						
					}
				}
				strResult = "{ \"result\":\"OK\" }";
				reviewService.insertReview(vo);
				setRating(vo.getW_no());
			}
			// 파일 아무것도 첨부 안했을때 탄다.
			else {
				strResult = "{ \"result\":\"OK\" }";
				System.out.println(strResult);
				reviewService.insertReview(vo);
				setRating(vo.getW_no());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return w_no;
	}
	
	// 리뷰 수정 페이지 이동
	@RequestMapping("/updateReviewPage.wp")
	public String updateReviewPage(ReviewVO vo, Model model) {
		ReviewVO a =  reviewService.detailReview(vo);
		model.addAttribute("detailReview",a);
		model.addAttribute("rating", a.getRe_score());
		return "WEB-INF/board/updateReview.jsp";
	}
	
	// 리뷰수정
	@ResponseBody
	@RequestMapping(value = "/updateReview.wp", method = RequestMethod.POST)
	public int updateReview(@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request, ReviewVO vo) {
		
		String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/review/";
//		String re_no = request.getParameter("re_no");
		int re_no = vo.getRe_no();
		System.out.println("리뷰번호"+re_no);
		System.out.println("기존1:"+vo.getRe_photo1());
		System.out.println("기존2:"+vo.getRe_photo2());
		System.out.println("기존3:"+vo.getRe_photo3());
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				int index = 1;
				for(MultipartFile file:multipartFile) {
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일명
					System.out.println("파일명"+savedFileName);

				    if(index == 1) {
				    	vo.setRe_photo1(savedFileName);
				    } else if(index == 2) {
				    	vo.setRe_photo2(savedFileName);
				    } else {
				    	vo.setRe_photo3(savedFileName);
				    }
				    index++;
					File targetFile = new File(realPath + savedFileName);	

					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						System.out.println("파일저장");
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile); //저장된 현재 파일 삭제
						e.printStackTrace();
						System.out.println("파일삭제");
						break;
					}
				}
				reviewService.updateReview(vo);
				setRating(vo.getW_no());
			}
			// 파일 아무것도 첨부 안했을때 탄다.
			else {
				reviewService.updateReview(vo);
				setRating(vo.getW_no());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return re_no;
		
	}
	
	// 리뷰삭제
	@RequestMapping("/deleteReview.wp")
	public String deleteReview(ReviewVO vo, HttpSession session) {
	String realPath = "c:/swork/final_Project/src/main/webapp/resources/img/review/";
	File targetFile = null;
		vo = reviewService.detailReview(vo);
		if(vo.getId().equals(session.getAttribute("userID").toString())) {
			if(vo.getRe_photo1() != null) {
				targetFile = new File(realPath + vo.getRe_photo1());
				targetFile.delete();
				System.out.println("파일1삭제: " + realPath + vo.getRe_photo1());
			} else if(vo.getRe_photo2() != null) {
				targetFile = new File(realPath + vo.getRe_photo2());
				targetFile.delete();
				System.out.println("파일2삭제: " + realPath + vo.getRe_photo2());
			} else if(vo.getRe_photo3() != null) {
				targetFile = new File(realPath + vo.getRe_photo3());
				targetFile.delete();
				System.out.println("파일3삭제: " + realPath + vo.getRe_photo3());
			}
			reviewService.deleteReview(vo);
			setRating(vo.getW_no());
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
		System.out.println("글 목록 처리");
		
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
	
	// 정렬 목록
	@RequestMapping("/getfilterList.wp")
	public String getFilterList(@RequestParam(value="filter") String filter, ReviewVO vo, String nowPageBtn, Model model) {
		System.out.println("정렬 처리");
		System.out.println(vo.getFilter());
		
		// 총 목록 수
		int totalPageCnt = reviewService.totalFilterListCnt(vo);
		
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
		model.addAttribute("reviewList", reviewService.getFilterList(vo));

		// 필터 고정
		if(vo.getFilter() != null) {
			model.addAttribute("radiochk", vo.getFilter());
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
	
	//평점평균반영
	public void setRating(int w_no) {
		Double rating_avg = reviewService.getRatingAvg(w_no);
		
		if(rating_avg == null)
			rating_avg = 0.0;
		
		ReviewVO rvo = new ReviewVO();
		rvo.setW_no(w_no);
		rvo.setRating_avg(rating_avg);
		
		reviewService.updateRating(rvo);
	}
}
