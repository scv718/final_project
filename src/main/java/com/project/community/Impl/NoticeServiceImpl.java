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
	
	@Override
	public void insertNotice(CommunityVO vo) {
		noticeDAO.insertNotice(vo);		
	}

	@Override
	public void updateNotice(CommunityVO vo) {
		noticeDAO.updateNotice(vo);
	}

	@Override
	public void deleteNotice(CommunityVO vo) {
		noticeDAO.deleteNotice(vo);
	}

	@Override
	public CommunityVO getNotice(CommunityVO vo) {
		return noticeDAO.getNotice(vo);
	}

	@Override
	public List<CommunityVO> getNoticeList(CommunityVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	@Override
	public void viewCount(int commu_no) {
		noticeDAO.viewCount(commu_no);
	}
	
	@Override
	public int totalNoticeListCnt(CommunityVO vo) {
		return noticeDAO.totalNoticeListCnt(vo);
	}


}
