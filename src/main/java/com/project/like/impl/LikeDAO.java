package com.project.like.impl;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void updateLike(int re_no) throws Exception{
		mybatis.update("LikeDAO.updateLike", re_no);
	}
	
	public void updateLikeCancel(int re_no) throws Exception{
		mybatis.update("LikeDAO.updateLikeCancel", re_no);
	}

	public void insertLike(int re_no, String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("re_no", re_no);
		mybatis.insert("LikeDAO.insertLike", map);
	}
	
	public void deleteLike(int re_no, String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("re_no", re_no);
		mybatis.delete("LikeDAO.deleteLike", map);
	}
	
	public int likeCheck(int re_no, String id) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("re_no", re_no);
		int a = mybatis.selectOne("LikeDAO.likeCheck", map);
		System.out.println(a);
		return a;
	}
}
