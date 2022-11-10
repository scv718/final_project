package com.project.community.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.community.CommunityVO;
import com.project.community.FaqService;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAOMybatis FaqDAO;
	
	//=====공통======
	@Override
	public List<CommunityVO> getFaqList(CommunityVO vo) {
		return FaqDAO.getFaqList(vo);	
	}

	@Override
	public int totalFaqListCnt(CommunityVO vo) {
		return FaqDAO.totalFaqListCnt(vo);	
	}

	//======관리자======
	@Override
	public void admin_insertFaq(CommunityVO vo) {
		FaqDAO.admin_insertFaq(vo);	
	}

	@Override
	public void admin_updateFaq(CommunityVO vo) {
		FaqDAO.admin_updateFaq(vo);	
	}

	@Override
	public void admin_deleteFaq(CommunityVO vo) {
		FaqDAO.admin_deleteFaq(vo);	
	}

	@Override
	public CommunityVO admin_getFaq(CommunityVO vo) {
		return FaqDAO.admin_getFaq(vo);
	}


}
