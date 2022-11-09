package com.project.community;

import java.util.List;

public interface NoticeService {

   // 공지사항 조회 - 사용자
   CommunityVO getNotice(CommunityVO vo);
   
   // 공지사항 전체 조회 - 사용자
   List<CommunityVO> getNoticeList(CommunityVO vo);
   
   
   // 공지사항 등록 - 관리자
   void admin_insertNotice(CommunityVO vo);

   // 공지사항 수정 - 관리자
   void admin_updateNotice(CommunityVO vo);

   // 공지사항 삭제 - 관리자
   void admin_deleteNotice(CommunityVO vo);


   // 공지사항 조회수 - 공통
   void viewCount(int commu_no);

   // 공지사항 글 목록 개수 -> 페이징 - 공통
   int totalNoticeListCnt(CommunityVO vo);

}