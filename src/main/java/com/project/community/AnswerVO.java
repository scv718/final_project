package com.project.community;

import java.sql.Date;

public class AnswerVO {

	private int commu_no;
	private int answer_no;
	private int answer_cat;
	private String id;
	private String answer_con;
	private Date answer_date;
	
	public int getCommu_no() {
		return commu_no;
	}
	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
	}
	public int getAnswer_no() {
		return answer_no;
	}
	public void setAnswer_no(int answer_no) {
		this.answer_no = answer_no;
	}
	public int getAnswer_cat() {
		return answer_cat;
	}
	public void setAnswer_cat(int answer_cat) {
		this.answer_cat = answer_cat;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAnswer_con() {
		return answer_con;
	}
	public void setAnswer_con(String answer_con) {
		this.answer_con = answer_con;
	}
	public Date getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Date answer_date) {
		this.answer_date = answer_date;
	}
	@Override
	public String toString() {
		return "AnswerVO [commu_no=" + commu_no + ", answer_no=" + answer_no + ", answer_cat=" + answer_cat + ", id="
				+ id + ", answer_con=" + answer_con + ", answer_date=" + answer_date + "]";
	}
	

	
	
	
}
