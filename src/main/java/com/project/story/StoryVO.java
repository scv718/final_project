package com.project.story;

import org.springframework.web.multipart.MultipartFile;

public class StoryVO {
	
	private int story_no;
	private int story_p_no;
	private int story_a_no;
	private String story_title;
	private String story_semi_title;
	private String story_content;
	private String story_back_img;
	private String story_add_img;
	
	private MultipartFile uploadFile; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	private MultipartFile uploadFile2; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	
	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}


	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}


	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}


	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}



	
	
	
	@Override
	public String toString() {
		return "StoryVO [story_no=" + story_no + ", story_p_no=" + story_p_no + ", story_a_no=" + story_a_no
				+ ", story_title=" + story_title + ", story_semi_title=" + story_semi_title + ", story_content="
				+ story_content + ", story_back_img=" + story_back_img + ", story_add_img=" + story_add_img +"]";
	}


	public int getStory_no() {
		return story_no;
	}
	public String getStory_semi_title() {
		return story_semi_title;
	}
	public void setStory_semi_title(String story_semi_title) {
		this.story_semi_title = story_semi_title;
	}
	
		public void setStory_no(int story_no) {
		this.story_no = story_no;
	}
	public int getStory_p_no() {
		return story_p_no;
	}
	public void setStory_p_no(int story_p_no) {
		this.story_p_no = story_p_no;
	}
	public int getStory_a_no() {
		return story_a_no;
	}
	public void setStory_a_no(int story_a_no) {
		this.story_a_no = story_a_no;
	}
	public String getStory_title() {
		return story_title;
	}
	public void setStory_title(String story_title) {
		this.story_title = story_title;
	}
	public String getStory_content() {
		return story_content;
	}
	public void setStory_content(String story_content) {
		this.story_content = story_content;
	}
	public String getStory_back_img() {
		return story_back_img;
	}
	public void setStory_back_img(String story_back_img) {
		this.story_back_img = story_back_img;
	}
	public String getStory_add_img() {
		return story_add_img;
	}
	public void setStory_add_img(String story_add_img) {
		this.story_add_img = story_add_img;
	}
	
		
}
