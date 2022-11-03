package com.project.intro.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.intro.IntroService;
import com.project.intro.IntroVO;

@Service("introService")
public class IntroServiceImpl implements IntroService {

	@Autowired
	private IntroDAOMybatis introDAO;

	
	@Override
	public IntroVO getIntro(IntroVO vo) {
		return introDAO.getIntro(vo);
	}
	
	@Override
	public List<IntroVO> getIntroList(IntroVO vo) {
		return introDAO.getIntroList(vo);
	}

	@Override
	public void updateIntro(IntroVO vo) {
		introDAO.updateIntro(vo);
	}

	@Override
	public void insertIntro(IntroVO vo) {
		introDAO.insertIntro(vo);		
	}

}