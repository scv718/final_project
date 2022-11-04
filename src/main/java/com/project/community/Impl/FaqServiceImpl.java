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
	
	@Override
	public void insertFaq(CommunityVO vo) {
		FaqDAO.insertFaq(vo);	
		
	}

	@Override
	public void updateFaq(CommunityVO vo) {
		FaqDAO.updateFaq(vo);	
	}

	@Override
	public void deleteFaq(CommunityVO vo) {
		FaqDAO.deleteFaq(vo);	
	}

	@Override
	public CommunityVO getFaq(CommunityVO vo) {
		return FaqDAO.getFaq(vo);
	}

	@Override
	public List<CommunityVO> getFaqList(CommunityVO vo) {
		return FaqDAO.getFaqList(vo);	
	}

	@Override
	public int totalFaqListCnt(CommunityVO vo) {
		return FaqDAO.totalFaqListCnt(vo);	
	}

}
