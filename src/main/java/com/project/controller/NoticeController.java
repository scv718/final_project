package com.project.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

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

import com.project.common.PagingVO;
import com.project.community.CommunityVO;

import com.project.community.NoticeService;
import com.project.community.Impl.NoticeDAOMybatis;

@Controller
@SessionAttributes("community")
public class NoticeController {

   @Autowired
   private NoticeDAOMybatis noticeService;

   // 검색창 - 공통
   @ModelAttribute("conditionMap")
   public Map<String, String> searchConditionMap() {
      Map<String, String> conditionMap = new HashMap<String, String>();
      conditionMap.put("내용", "CONTENT");
      conditionMap.put("제목", "TITLE");
      return conditionMap;
   }
   
      // 공지사항 상세 조회 - 사용자
      @RequestMapping("/getNotice.wp")
      public String getNotice(CommunityVO vo, Model model) {

         // 조회수 증가
         noticeService.viewCount(vo.getCommu_no());

         model.addAttribute("community", noticeService.getNotice(vo));
         return "WEB-INF/view/community/getNotice.jsp";
      }

      // 공지사항 목록 조회 - 사용자
      @RequestMapping("/getNoticeList.wp")
      public String getNoticeList(CommunityVO vo, String nowPageBtn, Model model) {
         System.out.println("글 목록 검색 처리");

         // 총 목록 수
         int totalPageCnt = noticeService.totalNoticeListCnt(vo);

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
         model.addAttribute("noticeList", noticeService.getNoticeList(vo));
         return "WEB-INF/view/community/getNoticeList.jsp";
      }

      
      
      

      // 공지사항 등록 -> 페이지 이동 - 관리자
      @GetMapping(value = "/admin_insertNotice.wp")
      public String admin_insertNotice_get(CommunityVO vo) throws IllegalStateException, IOException {
         return "WEB-INF/view/community/admin_insertNotice.jsp";
      }
      
      // 공지사항 등록 - 관리자
      @PostMapping(value = "/admin_insertNotice.wp")
      public String admin_insertNotice(CommunityVO vo) throws IllegalStateException, IOException {
      
         noticeService.admin_insertNotice(vo);
         return "redirect:admin_getNoticeList.wp";
      }
      
      // 공지사항 수정 - 관리자
      @RequestMapping("/admin_updateNotice.wp")
      public String admin_updateNotice(@ModelAttribute("community") CommunityVO vo, Model model) {
      
         noticeService.admin_updateNotice(vo);
         return "admin_getNoticeList.wp";
      
      }
      
      // 공지사항 삭제 - 관리자
      @RequestMapping("/admin_deleteNotice.wp")
      public String admin_deleteNotice(CommunityVO vo) {
      
         noticeService.admin_deleteNotice(vo);
         return "admin_getNotice.wp";
      }
      
      // 공지사항 상세 조회 - 관리자
      @RequestMapping("/admin_getNotice.wp")
      public String admin_getNotice(CommunityVO vo, Model model) {
      
         // 조회수 증가
         noticeService.viewCount(vo.getCommu_no());
      
         model.addAttribute("community", noticeService.getNotice(vo));
         return "WEB-INF/view/community/admin_getNotice.jsp";
      }
      
      // 공지사항 목록 조회 - 관리자
      @RequestMapping("/admin_getNoticeList.wp")
      public String admin_getNoticeList(CommunityVO vo, String nowPageBtn, Model model) {
      
         // 총 목록 수
         int totalPageCnt = noticeService.totalNoticeListCnt(vo);
      
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
         model.addAttribute("noticeList", noticeService.getNoticeList(vo));
         return "WEB-INF/view/community/admin_getNoticeList.jsp";
      }

}