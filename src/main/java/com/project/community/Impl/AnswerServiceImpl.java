package com.project.community.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.community.AnswerService;
import com.project.community.AnswerVO;
import com.project.community.CommunityVO;

@Service("answerService")
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDAOMybatis AnswerDAO;
	
	@Override
	public void insertAnswer(AnswerVO vo) {
		AnswerDAO.insertAnswer(vo);	
	}

	@Override
	public void updateAnswer(AnswerVO vo) {
		AnswerDAO.updateAnswer(vo);	
		
	}

	@Override
	public void deleteAnswer(AnswerVO vo) {
		AnswerDAO.deleteAnswer(vo);	
		
	}

	@Override
	public AnswerVO getAnswer(AnswerVO vo) {
		// TODO Auto-generated method stub
		return AnswerDAO.getAnswer(vo);	
	}

	@Override
	public List<AnswerVO> getAnswerList(AnswerVO vo) {
		return AnswerDAO.getAnswerList(vo);	
	}

	@Override
	public int totalAnswerListCnt(AnswerVO vo) {
		return AnswerDAO.totalAnswerListCnt(vo);	
	}

}
