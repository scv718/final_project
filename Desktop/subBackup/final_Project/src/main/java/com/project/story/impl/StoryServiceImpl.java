package com.project.story.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.story.StoryService;
import com.project.story.StoryVO;

@Service("StoryService")
public class StoryServiceImpl implements StoryService {
	
	@Autowired
	private StoryDAOMybatis storyDAO;

	@Override
	public void insertStory(StoryVO vo) {
		storyDAO.insertStory(vo);
		
	}

	@Override
	public void updateStory(StoryVO vo) {
		storyDAO.updateStory(vo);
		
	}

	@Override
	public void deleteStory(StoryVO vo) {
		storyDAO.deleteStory(vo);
		
	}
	
	@Override
	public StoryVO getStory(StoryVO vo) {
		return storyDAO.getStory(vo);
	}
	
	@Override
	public List<StoryVO> getStoryList(StoryVO vo) {
		return storyDAO.getStoryList(vo);		
		
	}

}
