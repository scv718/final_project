package com.project.intro;

import org.springframework.web.multipart.MultipartFile;

public class IntroVO {
	private int intro_no;
	private int intro_a_no;
	private String intro_title;
	private String intro_content;
	private String intro_bg;
	private String intro_sg;

//	private String filename;
	private MultipartFile uploadFile; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	private MultipartFile uploadFile2; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음

	public int getIntro_no() {
		return intro_no;
	}

	public void setIntro_no(int intro_no) {
		this.intro_no = intro_no;
	}

	public int getIntro_a_no() {
		return intro_a_no;
	}

	public void setIntro_a_no(int intro_a_no) {
		this.intro_a_no = intro_a_no;
	}

	public String getIntro_title() {
		return intro_title;
	}

	public void setIntro_title(String intro_title) {
		this.intro_title = intro_title;
	}

	public String getIntro_content() {
		return intro_content;
	}

	public void setIntro_content(String intro_content) {
		this.intro_content = intro_content;
	}

	public String getIntro_bg() {
		return intro_bg;
	}

	public void setIntro_bg(String intro_bg) {
		this.intro_bg = intro_bg;
	}

	public String getIntro_sg() {
		return intro_sg;
	}

	public void setIntro_sg(String intro_sg) {
		this.intro_sg = intro_sg;
	}

	@Override
	public String toString() {
		return "IntroVO [intro_no=" + intro_no + ", intro_a_no=" + intro_a_no + ", intro_title=" + intro_title
				+ ", intro_content=" + intro_content + ", intro_bg=" + intro_bg + ", intro_sg=" + intro_sg + "]";
	}
//	public String getFilename() {
//		return filename;
//	}
//	public void setFilename(String filename) {
//		this.filename = filename;
//	}
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

}