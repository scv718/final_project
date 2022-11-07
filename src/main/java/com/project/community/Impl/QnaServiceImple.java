package com.project.community.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.community.CommunityVO;
import com.project.community.QnaService;

@Service("qnaService")
public class QnaServiceImple implements QnaService {
	
	@Autowired
	private QnaDAOMybatis QnaDAO;

	@Override
	public void insertQna(CommunityVO vo) {
		QnaDAO.insertQna(vo);
		
	}

	@Override
	public void updateQna(CommunityVO vo) {
		QnaDAO.updateQna(vo);
		
	}

	@Override
	public void deleteQna(CommunityVO vo) {
		QnaDAO.deleteQna(vo);
		
	}

	@Override
	public CommunityVO getQna(CommunityVO vo) {
		return QnaDAO.getQna(vo);
	}

	@Override
	public List<CommunityVO> getQnaList(CommunityVO vo) {
		return QnaDAO.getQnaList(vo);
	}

	@Override
	public int totalQnaListCnt(CommunityVO vo) {
		return QnaDAO.totalQnaListCnt(vo);
	}

}
