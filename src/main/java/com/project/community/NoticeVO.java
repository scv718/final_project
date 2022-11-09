package com.project.community;

import java.sql.Date;

public class NoticeVO {
	private int commu_no;
	private String commu_title;
	private String id;
	private String commu_content;
	private Date commu_date;
	private int commu_count;
	
	@Override
	public String toString() {
		return "NoticeVO [commu_no=" + commu_no + ", commu_title=" + commu_title + ", id=" + id + ", commu_content="
				+ commu_content + ", commu_date=" + commu_date + ", commu_count=" + commu_count + ", getCommu_no()="
				+ getCommu_no() + ", getCommu_title()=" + getCommu_title() + ", getId()=" + getId()
				+ ", getCommu_content()=" + getCommu_content() + ", getCommu_date()=" + getCommu_date()
				+ ", getCommu_count()=" + getCommu_count() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	public int getCommu_no() {
		return commu_no;
	}
	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
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
	
	

	
	
}
