package com.project.community;

import java.sql.Date;

public class QnaVO {

	 private int commu_cat;
	 private String id;
	 private String commu_title;
	 private Date commu_date;
	 private int commu_count;
	 private String answer_status;
	 private String commu_content;
	 
	 
	@Override
	public String toString() {
		return "QnaVO [commu_cat=" + commu_cat + ", id=" + id + ", commu_title=" + commu_title + ", commu_date="
				+ commu_date + ", commu_count=" + commu_count + ", answer_status=" + answer_status + ", commu_content="
				+ commu_content + "]";
	}
	
	public int getCommu_cat() {
		return commu_cat;
	}
	public void setCommu_cat(int commu_cat) {
		this.commu_cat = commu_cat;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCommu_title() {
		return commu_title;
	}
	public void setCommu_title(String commu_title) {
		this.commu_title = commu_title;
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
	public String getAnswer_status() {
		return answer_status;
	}
	public void setAnswer_status(String answer_status) {
		this.answer_status = answer_status;
	}
	public String getCommu_content() {
		return commu_content;
	}
	public void setCommu_content(String commu_content) {
		this.commu_content = commu_content;
	}
	 

	 
	 
}
