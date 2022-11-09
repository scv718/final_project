package com.project.community.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.community.AnswerVO;
import com.project.community.CommunityVO;
import com.project.community.QnaService;
import com.project.community.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
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
	public CommunityVO admin_getQna(CommunityVO vo) {
		return QnaDAO.admin_getQna(vo);
	}

	@Override
	public List<CommunityVO> getQnaList(CommunityVO vo) {
		return QnaDAO.getQnaList(vo);
	}

	@Override
	public List<CommunityVO> admin_getQnaList(CommunityVO vo) {
		return QnaDAO.admin_getQnaList(vo);
	}
	
	@Override
	public int totalQnaListCnt(CommunityVO vo) {
		return QnaDAO.totalQnaListCnt(vo);
	}

	@Override
	public void admin_insertQna(AnswerVO vo) {
		QnaDAO.admin_insertQna(vo);
	}

	@Override
	public int admin_totalQnaListCnt(CommunityVO vo) {
		return QnaDAO.admin_totalQnaListCnt(vo);
	}

	@Override
	public List<QnaVO> QnaListAd(QnaVO vo) {
		System.out.println("qna까지 진행됨");
		return QnaDAO.QnaListAd(vo);
	}

}
