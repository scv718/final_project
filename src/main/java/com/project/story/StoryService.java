package com.project.story;

import java.util.List;

public interface StoryService {
	//구독 생성
	void insertStory(StoryVO vo);
	//구독 정보수정
	void updateStory(StoryVO vo);
	//구독 정보삭제
	void deleteStory(StoryVO vo);
	//구독 조회
	StoryVO getStory(StoryVO vo);
	StoryVO getStory1(StoryVO vo);
	//구독 정보리스트
	List<StoryVO> getStoryList(StoryVO vo);
	List<StoryVO> getStoryList1(StoryVO vo);
	
	
}