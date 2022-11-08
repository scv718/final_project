package com.project.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.common.PagingVO;
import com.project.community.CommunityVO;
import com.project.community.NoticeService;
import com.project.community.Impl.NoticeDAOMybatis;

@Controller
@SessionAttributes("community")
public class NoticeController {
		
		@Autowired
		private NoticeDAOMybatis noticeService;
		
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("내용", "CONTENT");
			conditionMap.put("제목", "TITLE");
			return conditionMap;
		}

		@GetMapping(value="/admin_insertNotice.wp")
		public String admin_insertNotice_get(CommunityVO vo) throws IllegalStateException, IOException {
			return "WEB-INF/view/community/admin_insertNotice.jsp";
		}
		
		
		//"uploadFile" 추가시 
		@PostMapping(value = "/admin_insertNotice.wp")
//		public String insertBoard(MultipartHttpServletRequest request, BoardVO vo) throws IllegalStateException, IOException {
		public String admin_insertNotice(CommunityVO vo) throws IllegalStateException, IOException {
//			MultipartFile uplodFile = vo.getUploadFile();
			//realPath 추가
//		    String realPath = request.getSession().getServletContext().getRealPath("/img/");
//			String realPath = "c:/swork/final_project/src/main/webapp/resources/img/" ;
//		    String commu_photo1 = uplodFile.getOriginalFilename();
//			if(!uplodFile.isEmpty()) {
//				vo.setCommu_photo1(commu_photo1);
//				uplodFile.transferTo(new File(realPath+commu_photo1));
//			}
			noticeService.insertNotice(vo);
			return "redirect:admin_getNoticeList.wp";
		}

		// 공지사항 수정 -관리자
		@RequestMapping("/admin_updateNotice.wp")
//			public String updateNotice(MultipartHttpServletRequest request,@ModelAttribute("community") CommunityVO vo, Model model) 
//					throws IllegalStateException, IOException{
			public String admin_updateNotice(@ModelAttribute("community") CommunityVO vo, Model model) {
//			if( vo.getWriter().equals(session.getAttribute("userName").toString()) ){
//				boardService.updateBoard(vo);
//				return "getBoardList.do";
//			}else {
//				return "getBoard.do?error=1";
//			}
			noticeService.updateNotice(vo);
			return "admin_getNotice.wp";
			
		}

		// 공지사항 삭제 -관리자
		@RequestMapping("/admin_deleteNotice.wp")
		public String admin_deleteNotice(CommunityVO vo) {
//			public String deleteNotice(CommunityVO vo, HttpSession session) {
//			String realPath = "c:/swork/eleven/src/main/webapp/img/" ;
//			vo = noticeService.getNotice(vo);
//			if( vo.getWriter().equals(session.getAttribute("userName").toString()) ) {
//				if(vo.getFilename()!=null) {
//					System.out.println("파일삭제: "+realPath + vo.getFilename());
//					File f = new File(realPath + vo.getFilename());		
//					f.delete();
//				}
//				boardService.deleteBoard(vo);
//				return "getBoardList.do";
//			}else {
//				return "getBoard.do?error=1";
//			}
			
			noticeService.deleteNotice(vo);
			return "admin_getNoticeList.wp";
		}

		// 공지사항 상세 조회 - 사용자
		@RequestMapping("/getNotice.wp")
//		public String getNotice(@ModelAttribute("community")CommunityVO vo, Model model) {
			public String getNotice(CommunityVO vo, Model model) {
			
			//조회수 증가
			noticeService.viewCount(vo.getCommu_no());
//			List<CommunityVO> list = noticeService.getNotice(vo.getCommu_no());
			System.out.println(noticeService.getNotice(vo));
			model.addAttribute("community", noticeService.getNotice(vo));
			return "WEB-INF/view/community/getNotice.jsp";
		}

		// 공지사항 상세 조회 - 관리자
				@RequestMapping("/admin_getNotice.wp")
//				public String getNotice(@ModelAttribute("community")CommunityVO vo, Model model) {
					public String admin_getNotice(CommunityVO vo, Model model) {
					
					//조회수 증가
					noticeService.viewCount(vo.getCommu_no());
//					List<CommunityVO> list = noticeService.getNotice(vo.getCommu_no());
					System.out.println(noticeService.getNotice(vo));
					model.addAttribute("community", noticeService.getNotice(vo));
					return "WEB-INF/view/community/admin_getNotice.jsp";
				}
		
		// 공지사항 목록 조회 - 사용자
		@RequestMapping("/getNoticeList.wp")
		public String getNoticeList(CommunityVO vo, String nowPageBtn, Model model) {
			System.out.println("글 목록 검색 처리");
			
			//총 목록 수 
			int totalPageCnt = noticeService.totalNoticeListCnt(vo);
			
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
			model.addAttribute("noticeList", noticeService.getNoticeList(vo));
			return "WEB-INF/view/community/getNoticeList.jsp";
		}
		
		// 공지사항 목록 조회 - 관리자
				@RequestMapping("/admin_getNoticeList.wp")
				public String admin_getNoticeList(CommunityVO vo, String nowPageBtn, Model model) {
					System.out.println("글 목록 검색 처리");
					
					//총 목록 수 
					int totalPageCnt = noticeService.totalNoticeListCnt(vo);
					
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
					model.addAttribute("noticeList", noticeService.getNoticeList(vo));
					return "WEB-INF/view/community/admin_getNoticeList.jsp";
				}
		
}
