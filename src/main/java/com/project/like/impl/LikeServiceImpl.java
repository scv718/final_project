package com.project.like.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.project.like.LikeService;

@Service
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeDAO likeDAO;

	@Override
	public int likeCheck(int re_no, String id) throws Exception {
		return likeDAO.likeCheck(re_no, id);
	}

	@Override
	public void insertLike(int re_no, String id) throws Exception {
		likeDAO.insertLike(re_no, id);
	}

	@Override
	public void updateLike(int re_no) throws Exception {
		likeDAO.updateLike(re_no);
	}

	@Override
	public void updateLikeCancel(int re_no) throws Exception {
		likeDAO.updateLikeCancel(re_no);
	}

	@Override
	public void deleteLike(int re_no, String id) throws Exception {
		likeDAO.deleteLike(re_no, id);
	}
}
