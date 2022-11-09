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

	// CRUD 기능의 메소드 구현
	// 공지사항 등록
	public void insertNotice(CommunityVO vo) {
		System.out.println("===> mybatis insertNotice() 기능처리");
		mybatis.insert("NoticeDAO.insertNotice", vo);
		// namespace명.객체명
	}

	// 공지사항 수정
	public void updateNotice(CommunityVO vo) {
		System.out.println("===> mybatis updateNotice() 기능처리");
		mybatis.update("NoticeDAO.updateNotice", vo);
	}

	// 공지사항 삭제
	public void deleteNotice(CommunityVO vo) {
		System.out.println("===> mybatis deleteNotice() 기능처리");
		mybatis.delete("NoticeDAO.deleteNotice", vo);
	}

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

	// 전체 글 목록 개수
	public int totalNoticeListCnt(CommunityVO vo) {
		System.out.println("===> mybatis totalNoticeListCnt() 기능처리");
		return mybatis.selectOne("NoticeDAO.totalNoticeListCnt", vo);
	}

	// 공지사항 조회수
	public void viewCount(int commu_no) {
		System.out.println("===> mybatis viewCount() 기능처리");
		mybatis.update("NoticeDAO.viewCount", commu_no);
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
