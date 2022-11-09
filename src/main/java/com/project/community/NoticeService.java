package com.project.community;

import java.util.List;

public interface NoticeService {

	// 공지사항 등록
	void insertNotice(CommunityVO vo);

	// 공지사항 수정
	void updateNotice(CommunityVO vo);

	// 공지사항 삭제
	void deleteNotice(CommunityVO vo);

	// 공지사항 조회
	CommunityVO getNotice(CommunityVO vo);

	// 공지사항 전체 조회
	List<CommunityVO> getNoticeList(CommunityVO vo);

	// 공지사항 조회수
	void viewCount(int commu_no);

	// 공지사항 글목록 개수
	int totalNoticeListCnt(CommunityVO vo);
	//관리자리스트
	List<NoticeVO> NoticeListAd(NoticeVO vo);
	
	List<NoticeVO> getmainNoticeList(NoticeVO vo);

}
