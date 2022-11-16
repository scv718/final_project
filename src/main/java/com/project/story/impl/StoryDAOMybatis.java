package com.project.story.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.story.StoryVO;

@Repository
public class StoryDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	// 스토리 넣기
	public void insertStory(StoryVO vo) {
		System.out.println("===>mybatis로 insertStory() 기능처리");
		mybatis.insert("StoryDAO.insertSubscribe", vo);
	}

	// 스토리 수정
	public void updateStory(StoryVO vo) {
		System.out.println("===>mybatis로 updateStory() 기능처리");
		mybatis.update("StoryDAO.updateSubscribe", vo);
	}

	// 스토리 지우기
	public void deleteStory(StoryVO vo) {
		System.out.println("===>mybatis로 deleteStory() 기능처리");
		mybatis.delete("StoryDAO.deleteSubscribe", vo);
	}

	// 스토리 조회
	public StoryVO getStory(StoryVO vo) {
		System.out.println("===>mybatis로 getStory() 기능처리");
		return (StoryVO) mybatis.selectOne("StoryDAO.getStory", vo);
	}

	// 스토리 리스트 조회
	public List<StoryVO> getStoryList(StoryVO vo) {
		System.out.println("===>mybatis로 getStoryList() 기능처리 ");
		return mybatis.selectList("StoryDAO.getStoryList", vo);
	}

	public List<StoryVO> getStoryList1(StoryVO vo) {
		System.out.println("===>mybatis로 getStoryList() 기능처리 ");
		return mybatis.selectList("StoryDAO.getStoryList1", vo);
	}

	public StoryVO getStory1(StoryVO vo) {
		System.out.println("===>mybatis로 getStory() 기능처리");
		return (StoryVO) mybatis.selectOne("StoryDAO.getStory1", vo);
	
	}

	public StoryVO getStory2(StoryVO vo) {
		System.out.println("===>mybatis로 getStory() 기능처리");
		return (StoryVO) mybatis.selectOne("StoryDAO.getStory2", vo);
	}

	public List<StoryVO> getStoryList2(StoryVO vo) {
		System.out.println("===>mybatis로 getStoryList() 기능처리 ");
		return mybatis.selectList("StoryDAO.getStoryList2", vo);
	}
	
	public StoryVO getStory3(StoryVO vo) {
		System.out.println("===>mybatis로 getStory() 기능처리");
		return (StoryVO) mybatis.selectOne("StoryDAO.getStory3", vo);
	}

	public List<StoryVO> getStoryList3(StoryVO vo) {
		System.out.println("===>mybatis로 getStoryList() 기능처리 ");
		return mybatis.selectList("StoryDAO.getStoryList3", vo);
	}

	

	public void admin_updateStory1(StoryVO vo) {
		  System.out.println("===> mybatis admin_updateStory1() 기능처리");
	      mybatis.update("StoryDAO.admin_updateStory1", vo);
		
	}

	public void admin_updateStory1_c(StoryVO vo) {
		  System.out.println("===> mybatis admin_updateStory1_c() 기능처리");
	      mybatis.update("StoryDAO.admin_updateStory1_c", vo);
	}

	public StoryVO getStory1_1(StoryVO vo) {
		System.out.println("===>mybatis로 getStory() 기능처리");
		return (StoryVO) mybatis.selectOne("StoryDAO.getStory1_1", vo);
	}
}