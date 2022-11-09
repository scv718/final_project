package com.project.review;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	//review 컬럼
	private int re_no;
	private int w_no;
	private String id;
	private String re_title;
	private String re_content;
	private int re_score;
	private String re_photo1;
	private String re_photo2;
	private String re_photo3;
	private Date re_date;
	private int re_like;

	//wine 컬럼
	private String w_nm_k;
	private String w_nm_e;
	
	//order 컬럼
	private String ord_code;
	private String ord_stat;

	//구분검색
	private String searchCondition;
	private String searchKeyword;
	
	//리뷰정렬
	private String filter;
	
	//첨부파일
	private MultipartFile uploadFile;
	
	//페이징
	private int offset;

	
	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public int getW_no() {
		return w_no;
	}

	public void setW_no(int w_no) {
		this.w_no = w_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRe_title() {
		return re_title;
	}

	public void setRe_title(String re_title) {
		this.re_title = re_title;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public int getRe_score() {
		return re_score;
	}

	public void setRe_score(int re_score) {
		this.re_score = re_score;
	}

	public String getRe_photo1() {
		return re_photo1;
	}

	public void setRe_photo1(String re_photo1) {
		this.re_photo1 = re_photo1;
	}

	public String getRe_photo2() {
		return re_photo2;
	}

	public void setRe_photo2(String re_photo2) {
		this.re_photo2 = re_photo2;
	}

	public String getRe_photo3() {
		return re_photo3;
	}

	public void setRe_photo3(String re_photo3) {
		this.re_photo3 = re_photo3;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public int getRe_like() {
		return re_like;
	}

	public void setRe_like(int re_like) {
		this.re_like = re_like;
	}

	public String getW_nm_k() {
		return w_nm_k;
	}

	public void setW_nm_k(String w_nm_k) {
		this.w_nm_k = w_nm_k;
	}

	public String getW_nm_e() {
		return w_nm_e;
	}

	public void setW_nm_e(String w_nm_e) {
		this.w_nm_e = w_nm_e;
	}

	public String getOrd_code() {
		return ord_code;
	}

	public void setOrd_code(String ord_code) {
		this.ord_code = ord_code;
	}

	public String getOrd_stat() {
		return ord_stat;
	}

	public void setOrd_stat(String ord_stat) {
		this.ord_stat = ord_stat;
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

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getFilter() {
		return filter;
	}

	public void setFilter(String filter) {
		this.filter = filter;
	}

	@Override
	public String toString() {
		return "ReviewVO [re_no=" + re_no + ", w_no=" + w_no + ", id=" + id + ", re_title=" + re_title + ", re_content="
				+ re_content + ", re_score=" + re_score + ", re_photo1=" + re_photo1 + ", re_photo2=" + re_photo2
				+ ", re_photo3=" + re_photo3 + ", re_date=" + re_date + ", re_like=" + re_like + ", w_nm_k=" + w_nm_k
				+ ", w_nm_e=" + w_nm_e + ", ord_code=" + ord_code + ", ord_stat=" + ord_stat + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + ", filter=" + filter + ", uploadFile="
				+ uploadFile + ", offset=" + offset + "]";
	}
	
}
