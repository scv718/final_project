package com.project.community.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.community.CommunityVO;
import com.project.community.NoticeVO;

@Repository
public class NoticeDAOMybatis {

   @Autowired // 자료형주입
   private SqlSessionTemplate mybatis;

   // 사용자
   // 공지사항 상세 조회(한줄)
   public CommunityVO getNotice(CommunityVO vo) {
      System.out.println("===> mybatis getNotice() 기능처리");
      return (CommunityVO) mybatis.selectOne("NoticeDAO.getNotice", vo);
   }
   
   // 공지사항 목록 조회(여러줄)
   public List<CommunityVO> getNoticeList(CommunityVO vo) {
      System.out.println("===> mybatis getNoticeList() 기능처리");
      return mybatis.selectList("NoticeDAO.getNoticeList", vo);
   }
   
   // 관리자
   // 공지사항 등록
   public void admin_insertNotice(CommunityVO vo) {
      System.out.println("===> mybatis admin_insertNotice() 기능처리");
      mybatis.insert("NoticeDAO.admin_insertNotice", vo);
   }

   // 공지사항 수정
   public void admin_updateNotice(CommunityVO vo) {
      System.out.println("===> mybatis admin_updateNotice() 기능처리");
      mybatis.update("NoticeDAO.admin_updateNotice", vo);
   }

   // 공지사항 삭제
   public void admin_deleteNotice(CommunityVO vo) {
      System.out.println("===> mybatis admin_deleteNotice() 기능처리");
      mybatis.delete("NoticeDAO.admin_deleteNotice", vo);
   }

   // 공통
   // 조회수
   public void viewCount(int commu_no) {
      System.out.println("===> mybatis viewCount() 기능처리");
      mybatis.update("NoticeDAO.viewCount", commu_no);
   }
   
   // 전체 글 목록 개수 -> 페이징
   public int totalNoticeListCnt(CommunityVO vo) {
      System.out.println("===> mybatis totalNoticeListCnt() 기능처리");
      return mybatis.selectOne("NoticeDAO.totalNoticeListCnt", vo);
   }


   public List<NoticeVO> getmainNoticeList(NoticeVO vo){
	   return mybatis.selectList("NoticeDAO.getmainNoticeList", vo);
   }

	// 관리자 리스트
	public List<NoticeVO> NoticeListAd(NoticeVO vo) {
		System.out.println("유저 마이 바티스 실행");
		List<NoticeVO> b = mybatis.selectList("NoticeDAO.NoticeListAd");
		for(NoticeVO v : b ) {
			System.out.println("v: "+v);
		}
		return mybatis.selectList("NoticeDAO.NoticeListAd");
	}
}
