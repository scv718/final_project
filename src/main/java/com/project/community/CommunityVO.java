package com.project.community;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class CommunityVO {

	private int commu_no;
	private int commu_cat;
	private int commu_cat_no;
	private String commu_title;
	private String id;
	private String commu_content;
	private Date commu_date;
	private int commu_count;
	
//	private String commu_photo1;
//	private String files;
	private String commu_photo2;
	private String commu_photo3;
	private String faq_cat;
		
	private MultipartFile uploadFile; // 웹서버 물리적 경로에 저장=> 데이터 테이블에는 없음
	
	//검색
	private String searchCondition;
	private String searchKeyword;
	
	//필터
	private String alignlist;
	
	
	//페이징
	private int offset;
	
	public int getCommu_no() {
		return commu_no;
	}
	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
	}
	public int getCommu_cat() {
		return commu_cat;
	}
	public void setCommu_cat(int commu_cat) {
		this.commu_cat = commu_cat;
	}
	public int getCommu_cat_no() {
		return commu_cat_no;
	}
	public void setCommu_cat_no(int commu_cat_no) {
		this.commu_cat_no = commu_cat_no;
	}
	public String getCommu_title() {
		return commu_title;
	}
	public void setCommu_title(String commu_title) {
		this.commu_title = commu_title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommu_content() {
		return commu_content;
	}
	public void setCommu_content(String commu_content) {
		this.commu_content = commu_content;
	}
	public Date getCommu_date() {
		return commu_date;
	}
	public void setCommu_date(Date commu_date) {
		this.commu_date = commu_date;
	}
	public int getCommu_count() {
		return commu_count;
	}
	public void setCommu_count(int commu_count) {
		this.commu_count = commu_count;
	}
//	public String getCommu_photo1() {
//		return commu_photo1;
//	}
//	public void setCommu_photo1(String commu_photo1) {
//		this.commu_photo1 = commu_photo1;
//	}
	public String getCommu_photo2() {
		return commu_photo2;
	}
	public void setCommu_photo2(String commu_photo2) {
		this.commu_photo2 = commu_photo2;
	}
	public String getCommu_photo3() {
		return commu_photo3;
	}
	public void setCommu_photo3(String commu_photo3) {
		this.commu_photo3 = commu_photo3;
	}
	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
//	@Override
//	public String toString() {
//		return "CommunityVO [commu_no=" + commu_no + ", commu_cat=" + commu_cat + ", commu_cat_no=" + commu_cat_no
//				+ ", commu_title=" + commu_title + ", id=" + id + ", commu_content=" + commu_content + ", commu_date="
//				+ commu_date + ", commu_count=" + commu_count + ", commu_photo1=" + commu_photo1 + ", commu_photo2="
//				+ commu_photo2 + ", commu_photo3=" + commu_photo3 + ", uploadFile=" + uploadFile + "]";
//	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getFaq_cat() {
		return faq_cat;
	}
	public void setFaq_cat(String faq_cat) {
		this.faq_cat = faq_cat;
	}
	public String getAlignlist() {
		return alignlist;
	}
	public void setAlignlist(String alignlist) {
		this.alignlist = alignlist;
	}
//	public String getFiles() {
//		return files;
//	}
//	public void setFiles(String files) {
//		this.files = files;
//	}
	
	
	
}
