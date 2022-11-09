package com.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.project.common.PagingVO;
import com.project.community.CommunityVO;
import com.project.community.Impl.FaqDAOMybatis;

@Controller
@SessionAttributes("community")
public class FaqController {
	
	@Autowired
	private FaqDAOMybatis faqService;

	//검색창
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("제목", "TITLE");
		return conditionMap;
	}
	
	//카테고리필터
//	@ModelAttribute("conditionMap2")
//	public Map<String, String> searchConditionMap2() {
//		Map<String, String> conditionMap2 = new HashMap<String, String>();
//		conditionMap2.put("[주문/결제/배송]", "list");
//		conditionMap2.put("[취소/교환/환불]", "grid");
//		conditionMap2.put("[구독서비스]", "sub");
//		conditionMap2.put("[회원]", "member");
//		conditionMap2.put("[기타]", "etc");
//		return conditionMap2;
//	}

	// 페이지만 이동
	@GetMapping(value="/admin_insertFaq.wp")
	public String insertFaq_get(CommunityVO vo) throws IllegalStateException, IOException {
		return "WEB-INF/view/community/admin_insertFaq.jsp";
	}
	
	
	//"uploadFile" 추가시 
	@PostMapping(value = "/admin_insertFaq.wp")
//	public String insertBoard(MultipartHttpServletRequest request, CommunityVO vo) throws IllegalStateException, IOException {
	public String insertFaq(CommunityVO vo) throws IllegalStateException, IOException {
//		MultipartFile uplodFile = vo.getUploadFile();
		//realPath 추가
//	    String realPath = request.getSession().getServletContext().getRealPath("/img/");
//		String realPath = "c:/swork/final_project/src/main/webapp/resources/img/" ;
//	    String commu_photo1 = uplodFile.getOriginalFilename();
//		if(!uplodFile.isEmpty()) {
//			vo.setCommu_photo1(commu_photo1);
//			uplodFile.transferTo(new File(realPath+commu_photo1));
//		}
		faqService.insertFaq(vo);
		return "redirect:admin_getFaqList.wp";
	}

	// 글 수정
	@PostMapping("/admin_updateFaq.wp")
//		public String updateNotice(MultipartHttpServletRequest request,@ModelAttribute("community") CommunityVO vo, Model model) 
//				throws IllegalStateException, IOException{
		public String updateFaq(@ModelAttribute("community") CommunityVO vo, Model model) {
//		if( vo.getWriter().equals(session.getAttribute("userName").toString()) ){
//			boardService.updateBoard(vo);
//			return "getBoardList.do";
//		}else {
//			return "getBoard.do?error=1";
//		}
		faqService.updateFaq(vo);
		return "admin_getFaqList.wp";
		
	}

	// 공지사항 삭제
	@RequestMapping("/admin_deleteFaq.wp")
	public String deleteFaq(CommunityVO vo) {
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
		
		faqService.deleteFaq(vo);
		return "admin_getFaqList.wp";
	}

	// 공지사항 상세 조회
	@RequestMapping("/admin_getFaq.wp")
//	public String getNotice(@ModelAttribute("community")CommunityVO vo, Model model) {
		public String getFaq(CommunityVO vo, Model model) {
		
		
		model.addAttribute("community", faqService.getFaq(vo));
		return "WEB-INF/view/community/admin_getFaq.jsp";
	}

	// 공지사항 목록 조회 - 사용자
	@RequestMapping("/getFaqList.wp")
	public String getFaqList(CommunityVO vo, String nowPageBtn, Model model ,@RequestParam(defaultValue = "zero") String viewType ) {
		System.out.println("글 목록 검색 처리");
		
		//총 목록 수 
		int totalPageCnt = faqService.totalFaqListCnt(vo);
		
		//현재 페이지 설정 
		int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
		System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
		
		//한페이지당 보여줄 목록 수
		int onePageCnt = 10;
		
		//한 번에 보여질 버튼 수
		int oneBtnCnt = 5;
		
		PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
		vo.setOffset(pvo.getOffset());
		
		model.addAttribute("paging", pvo);
		model.addAttribute("FaqList", faqService.getFaqList(vo));
		return "WEB-INF/view/community/faqList.jsp";
	}
	
	// 공지사항 목록 조회 - 관리자
		@RequestMapping("/admin_getFaqList.wp")
		public String getFaqListAdmin(CommunityVO vo, String nowPageBtn, Model model) {
			System.out.println("글 목록 검색 처리");
			
			//총 목록 수 
			int totalPageCnt = faqService.totalFaqListCnt(vo);
			
			//현재 페이지 설정 
			int nowPage = Integer.parseInt(nowPageBtn==null || nowPageBtn.equals("") ? "1" :nowPageBtn);
			System.out.println("totalPageCnt: "+totalPageCnt +", nowPage: "+nowPage);
			
			//한페이지당 보여줄 목록 수
			int onePageCnt = 10;
			
			//한 번에 보여질 버튼 수
			int oneBtnCnt = 5;
			
			PagingVO pvo = new PagingVO(totalPageCnt, onePageCnt, nowPage, oneBtnCnt);
			vo.setOffset(pvo.getOffset());
			
			
			model.addAttribute("paging", pvo);
			model.addAttribute("FaqList", faqService.getFaqList(vo));
			return "WEB-INF/view/community/admin_faqList.jsp";
		}
	
		@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
		@ResponseBody
		public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
			JsonObject jsonObject = new JsonObject();
			
	        /*
			 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
			 */
			
			// 내부경로로 저장
			String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
			String fileRoot = contextRoot+"resources/fileupload/";
			
			String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
			String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
			
			File targetFile = new File(fileRoot + savedFileName);	
			try {
				InputStream fileStream = multipartFile.getInputStream();
				FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
				jsonObject.addProperty("url", "/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
				jsonObject.addProperty("responseCode", "success");
					
			} catch (IOException e) {
				FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
				jsonObject.addProperty("responseCode", "error");
				e.printStackTrace();
			}
			String a = jsonObject.toString();
			return a;
		}
}
