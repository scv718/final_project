package com.project.mypage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mypage.MypageService;
import com.project.mypage.MypageVO;

@Service("MypageService")
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDAOMybatis MypageDAO;

	@Override
	public void insertMypage(MypageVO vo) {
		MypageDAO.insertMypage(vo);	
	}
	
	@Override
	public void updateMypage(MypageVO vo) {
		MypageDAO.updateMypage(vo);
	}
	@Override
	public void deleteMypage(MypageVO vo) {
		MypageDAO.deleteMypage(vo);	
	}

	@Override
	public MypageVO getMypage(MypageVO vo) {
		return MypageDAO.getMypage(vo);
	}
	
	@Override
	public List<MypageVO> getMypageList(MypageVO vo) {
		return MypageDAO.getMypageList(vo);		
	}
}
