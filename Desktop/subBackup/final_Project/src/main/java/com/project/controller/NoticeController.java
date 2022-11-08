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
import com.project.community.PhotoVO;
import com.project.community.Impl.NoticeDAOMybatis;

@Controller
@SessionAttributes("community")
public class NoticeController {
		
		@Autowired
		private NoticeDAOMybatis noticeService;
		
		@RequestMapping("/submit.wp")
		public void submit(HttpServletRequest request){
		    System.out.println("에디터 컨텐츠값:"+request.getParameter("editor"));
		}

		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("내용", "CONTENT");
			conditionMap.put("제목", "TITLE");
			return conditionMap;
		}

		@GetMapping(value="/insertNotice.wp")
		public String insertNotice_get(CommunityVO vo) throws IllegalStateException, IOException {
			return "WEB-INF/view/community/insertNotice.jsp";
		}
		
		
		//"uploadFile" 추가시 
		@PostMapping(value = "/insertNotice.wp")
//		public String insertBoard(MultipartHttpServletRequest request, BoardVO vo) throws IllegalStateException, IOException {
		public String insertNotice(CommunityVO vo) throws IllegalStateException, IOException {
			MultipartFile uplodFile = vo.getUploadFile();
			//realPath 추가
//		    String realPath = request.getSession().getServletContext().getRealPath("/img/");
			String realPath = "c:/swork/final_project/src/main/webapp/resources/img/" ;
		    String commu_photo1 = uplodFile.getOriginalFilename();
			if(!uplodFile.isEmpty()) {
				vo.setCommu_photo1(commu_photo1);
				uplodFile.transferTo(new File(realPath+commu_photo1));
			}
			noticeService.insertNotice(vo);
			return "redirect:getNoticeList.wp";
		}

		// 글 수정
		@RequestMapping("/updateNotice.wp")
//			public String updateNotice(MultipartHttpServletRequest request,@ModelAttribute("community") CommunityVO vo, Model model) 
//					throws IllegalStateException, IOException{
			public String updateNotice(@ModelAttribute("community") CommunityVO vo, Model model) {
//			if( vo.getWriter().equals(session.getAttribute("userName").toString()) ){
//				boardService.updateBoard(vo);
//				return "getBoardList.do";
//			}else {
//				return "getBoard.do?error=1";
//			}
			noticeService.updateNotice(vo);
			return "getNotice.wp";
			
		}

		// 공지사항 삭제
		@RequestMapping("/deleteNotice.wp")
		public String deleteNotice(CommunityVO vo) {
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
			return "getNoticeList.wp";
		}

		// 공지사항 상세 조회
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

		// 공지사항 목록 조회
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
			return "WEB-INF/view/community/notice.jsp";
		}
		
		//단일파일업로드
		@RequestMapping("/photoUpload")
		public String photoUpload(HttpServletRequest request, PhotoVO vo){
		    String callback = vo.getCallback();
		    String callback_func = vo.getCallback_func();
		    String file_result = "";
		    try {
		        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
		            //파일이 존재하면
		            String original_name = vo.getFiledata().getOriginalFilename();
		            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
		            //파일 기본경로
		            String defaultPath = request.getSession().getServletContext().getRealPath("/");
		            //파일 기본경로 _ 상세경로
		            String path = defaultPath + "resource" + File.separator + "photo_upload" + File.separator;              
		            File file = new File(path);
		            System.out.println("path:"+path);
		            //디렉토리 존재하지 않을경우 디렉토리 생성
		            if(!file.exists()) {
		                file.mkdirs();
		            }
		            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
		            String realname = UUID.randomUUID().toString() + "." + ext;
		        ///////////////// 서버에 파일쓰기 ///////////////// 
		            vo.getFiledata().transferTo(new File(path+realname));
		            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
		        } else {
		            file_result += "&errstr=error";
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
		}
		
		//다중파일업로드
		@RequestMapping("/multiplePhotoUpload")
		public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		    try {
		         //파일정보
		         String sFileInfo = "";
		         //파일명을 받는다 - 일반 원본파일명
		         String filename = request.getHeader("file-name");
		         //파일 확장자
		         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
		         //확장자를소문자로 변경
		         filename_ext = filename_ext.toLowerCase();
		         //파일 기본경로
		         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
		         //파일 기본경로 _ 상세경로
		         String filePath = dftFilePath + "resource" + File.separator + "photo_upload" + File.separator;
		         File file = new File(filePath);
		         if(!file.exists()) {
		            file.mkdirs();
		         }
		         String realFileNm = "";
		         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		         String today= formatter.format(new java.util.Date());
		         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
		         String rlFileNm = filePath + realFileNm;
		         ///////////////// 서버에 파일쓰기 ///////////////// 
		         InputStream is = request.getInputStream();
		         OutputStream os=new FileOutputStream(rlFileNm);
		         int numRead;
		         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
		         while((numRead = is.read(b,0,b.length)) != -1){
		            os.write(b,0,numRead);
		         }
		         if(is != null) {
		            is.close();
		         }
		         os.flush();
		         os.close();
		         ///////////////// 서버에 파일쓰기 /////////////////
		         // 정보 출력
		         sFileInfo += "&bNewLine=true";
		         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
		         sFileInfo += "&sFileName="+ filename;;
		         sFileInfo += "&sFileURL="+"/resource/photo_upload/"+realFileNm;
		         PrintWriter print = response.getWriter();
		         print.print(sFileInfo);
		         print.flush();
		         print.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
		
		
}
