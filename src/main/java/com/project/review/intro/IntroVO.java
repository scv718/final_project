package com.project.intro;

import org.springframework.web.multipart.MultipartFile;

public class IntroVO {

	private int intro_no;
	private String intro_img;
	private String intro_t1;
	private String intro_t1_2;
	private String intro_t2;
	private String intro_t2_2;
	private String intro_s_img1;
	private String intro_s_t1;
	private String intro_s_c1;
	private String intro_s_c1_2;
	private String intro_s_img2;
	private String intro_s_t2;
	private String intro_s_c2;
	private String intro_s_c2_2;
	private String intro_s_img3;
	private String intro_s_t3;
	private String intro_s_c3;
	private String intro_s_c3_2;
	private String intro_info1;
	private String intro_info1_2;
	private String intro_s_img4;
	private String intro_s_t4;
	private String intro_s_c4;
	private String intro_s_c4_2;
	private String intro_s_c4_3;
	private String intro_s_c4_4;
	private String intro_s_c4_5;
	private String intro_s_c4_6;
	
	private MultipartFile uploadFile; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	private MultipartFile uploadFile2; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	private MultipartFile uploadFile3; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	private MultipartFile uploadFile4; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	private MultipartFile uploadFile5; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	
	public int getIntro_no() {
		return intro_no;
	}
	public void setIntro_no(int intro_no) {
		this.intro_no = intro_no;
	}
	public String getIntro_img() {
		return intro_img;
	}
	public void setIntro_img(String intro_img) {
		this.intro_img = intro_img;
	}
	public String getIntro_t1() {
		return intro_t1;
	}
	public void setIntro_t1(String intro_t1) {
		this.intro_t1 = intro_t1;
	}
	public String getIntro_t1_2() {
		return intro_t1_2;
	}
	public void setIntro_t1_2(String intro_t1_2) {
		this.intro_t1_2 = intro_t1_2;
	}
	public String getIntro_t2() {
		return intro_t2;
	}
	public void setIntro_t2(String intro_t2) {
		this.intro_t2 = intro_t2;
	}
	public String getIntro_t2_2() {
		return intro_t2_2;
	}
	public void setIntro_t2_2(String intro_t2_2) {
		this.intro_t2_2 = intro_t2_2;
	}
	public String getIntro_s_img1() {
		return intro_s_img1;
	}
	public void setIntro_s_img1(String intro_s_img1) {
		this.intro_s_img1 = intro_s_img1;
	}
	public String getIntro_s_t1() {
		return intro_s_t1;
	}
	public void setIntro_s_t1(String intro_s_t1) {
		this.intro_s_t1 = intro_s_t1;
	}
	public String getIntro_s_c1() {
		return intro_s_c1;
	}
	public void setIntro_s_c1(String intro_s_c1) {
		this.intro_s_c1 = intro_s_c1;
	}
	public String getIntro_s_c1_2() {
		return intro_s_c1_2;
	}
	public void setIntro_s_c1_2(String intro_s_c1_2) {
		this.intro_s_c1_2 = intro_s_c1_2;
	}
	public String getIntro_s_img2() {
		return intro_s_img2;
	}
	public void setIntro_s_img2(String intro_s_img2) {
		this.intro_s_img2 = intro_s_img2;
	}
	public String getIntro_s_t2() {
		return intro_s_t2;
	}
	public void setIntro_s_t2(String intro_s_t2) {
		this.intro_s_t2 = intro_s_t2;
	}
	public String getIntro_s_c2() {
		return intro_s_c2;
	}
	public void setIntro_s_c2(String intro_s_c2) {
		this.intro_s_c2 = intro_s_c2;
	}
	public String getIntro_s_c2_2() {
		return intro_s_c2_2;
	}
	public void setIntro_s_c2_2(String intro_s_c2_2) {
		this.intro_s_c2_2 = intro_s_c2_2;
	}
	public String getIntro_s_img3() {
		return intro_s_img3;
	}
	public void setIntro_s_img3(String intro_s_img3) {
		this.intro_s_img3 = intro_s_img3;
	}
	public String getIntro_s_t3() {
		return intro_s_t3;
	}
	public void setIntro_s_t3(String intro_s_t3) {
		this.intro_s_t3 = intro_s_t3;
	}
	public String getIntro_s_c3() {
		return intro_s_c3;
	}
	public void setIntro_s_c3(String intro_s_c3) {
		this.intro_s_c3 = intro_s_c3;
	}
	public String getIntro_s_c3_2() {
		return intro_s_c3_2;
	}
	public void setIntro_s_c3_2(String intro_s_c3_2) {
		this.intro_s_c3_2 = intro_s_c3_2;
	}
	public String getIntro_info1() {
		return intro_info1;
	}
	public void setIntro_info1(String intro_info1) {
		this.intro_info1 = intro_info1;
	}
	public String getIntro_info1_2() {
		return intro_info1_2;
	}
	public void setIntro_info1_2(String intro_info1_2) {
		this.intro_info1_2 = intro_info1_2;
	}
	public String getIntro_s_img4() {
		return intro_s_img4;
	}
	public void setIntro_s_img4(String intro_s_img4) {
		this.intro_s_img4 = intro_s_img4;
	}
	public String getIntro_s_t4() {
		return intro_s_t4;
	}
	public void setIntro_s_t4(String intro_s_t4) {
		this.intro_s_t4 = intro_s_t4;
	}
	public String getIntro_s_c4() {
		return intro_s_c4;
	}
	public void setIntro_s_c4(String intro_s_c4) {
		this.intro_s_c4 = intro_s_c4;
	}
	public String getIntro_s_c4_2() {
		return intro_s_c4_2;
	}
	public void setIntro_s_c4_2(String intro_s_c4_2) {
		this.intro_s_c4_2 = intro_s_c4_2;
	}
	public String getIntro_s_c4_3() {
		return intro_s_c4_3;
	}
	public void setIntro_s_c4_3(String intro_s_c4_3) {
		this.intro_s_c4_3 = intro_s_c4_3;
	}
	public String getIntro_s_c4_4() {
		return intro_s_c4_4;
	}
	public void setIntro_s_c4_4(String intro_s_c4_4) {
		this.intro_s_c4_4 = intro_s_c4_4;
	}
	public String getIntro_s_c4_5() {
		return intro_s_c4_5;
	}
	public void setIntro_s_c4_5(String intro_s_c4_5) {
		this.intro_s_c4_5 = intro_s_c4_5;
	}
	public String getIntro_s_c4_6() {
		return intro_s_c4_6;
	}
	public void setIntro_s_c4_6(String intro_s_c4_6) {
		this.intro_s_c4_6 = intro_s_c4_6;
	}
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
	public MultipartFile getUploadFile3() {
		return uploadFile3;
	}
	public void setUploadFile3(MultipartFile uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}
	public MultipartFile getUploadFile4() {
		return uploadFile4;
	}
	public void setUploadFile4(MultipartFile uploadFile4) {
		this.uploadFile4 = uploadFile4;
	}
	public MultipartFile getUploadFile5() {
		return uploadFile5;
	}
	public void setUploadFile5(MultipartFile uploadFile5) {
		this.uploadFile5 = uploadFile5;
	}
	@Override
	public String toString() {
		return "IntroVO [intro_no=" + intro_no + ", intro_img=" + intro_img + ", intro_t1=" + intro_t1 + ", intro_t1_2="
				+ intro_t1_2 + ", intro_t2=" + intro_t2 + ", intro_t2_2=" + intro_t2_2 + ", intro_s_img1="
				+ intro_s_img1 + ", intro_s_t1=" + intro_s_t1 + ", intro_s_c1=" + intro_s_c1 + ", intro_s_c1_2="
				+ intro_s_c1_2 + ", intro_s_img2=" + intro_s_img2 + ", intro_s_t2=" + intro_s_t2 + ", intro_s_c2="
				+ intro_s_c2 + ", intro_s_c2_2=" + intro_s_c2_2 + ", intro_s_img3=" + intro_s_img3 + ", intro_s_t3="
				+ intro_s_t3 + ", intro_s_c3=" + intro_s_c3 + ", intro_s_c3_2=" + intro_s_c3_2 + ", intro_info1="
				+ intro_info1 + ", intro_info1_2=" + intro_info1_2 + ", intro_s_img4=" + intro_s_img4 + ", intro_s_t4="
				+ intro_s_t4 + ", intro_s_c4=" + intro_s_c4 + ", intro_s_c4_2=" + intro_s_c4_2 + ", intro_s_c4_3="
				+ intro_s_c4_3 + ", intro_s_c4_4=" + intro_s_c4_4 + ", intro_s_c4_5=" + intro_s_c4_5 + ", intro_s_c4_6="
				+ intro_s_c4_6 + ", uploadFile=" + uploadFile + ", uploadFile2=" + uploadFile2 + ", uploadFile3="
				+ uploadFile3 + ", uploadFile4=" + uploadFile4 + ", uploadFile5=" + uploadFile5 + "]";
	}



}