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
	StoryVO getStory2(StoryVO vo);
	List<StoryVO> getStoryList2(StoryVO vo);
	StoryVO getStory3(StoryVO vo);
	List<StoryVO> getStoryList3(StoryVO vo);
	void admin_updateStory1(StoryVO vo);
	void admin_updateStory1_c(StoryVO vo);
	StoryVO getStory1_1(StoryVO vo);
	
}