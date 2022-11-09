package com.project.community.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.community.CommunityVO;
import com.project.community.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

   @Autowired
   private NoticeDAOMybatis noticeDAO;
   
   // 사용자
   @Override
   public CommunityVO getNotice(CommunityVO vo) {
      return noticeDAO.getNotice(vo);
   }

   @Override
   public List<CommunityVO> getNoticeList(CommunityVO vo) {
      return noticeDAO.getNoticeList(vo);
   }
   

   // 관리자
   @Override
   public void admin_insertNotice(CommunityVO vo) {
      noticeDAO.admin_insertNotice(vo);      
   }
   
   @Override
   public void admin_updateNotice(CommunityVO vo) {
      noticeDAO.admin_updateNotice(vo);
   }
   
   @Override
   public void admin_deleteNotice(CommunityVO vo) {
      noticeDAO.admin_deleteNotice(vo);
   }
   
   
   // 공통
   // 조회수
   @Override
   public void viewCount(int commu_no) {
      noticeDAO.viewCount(commu_no);
   }
   
   // 페이징
   @Override
   public int totalNoticeListCnt(CommunityVO vo) {
      return noticeDAO.totalNoticeListCnt(vo);
   }
}