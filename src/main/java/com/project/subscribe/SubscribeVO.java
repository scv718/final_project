package com.project.subscribe;

public class SubscribeVO {
	private String id; //아이디
	private int level; //회원 등급 (디폴트(0), 초급(1), 중급(2), 고급(3) 총 4단계)
	private String option; //구독 선택
	private String s_date;//구독 시작일자
	//결제 여부
	//배송 여부
	private String e_date; //구독 종료 일자
	private int sub_status; //구독 상태
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	public int getSub_status() {
		return sub_status;
	}
	public void setSub_status(int sub_status) {
		this.sub_status = sub_status;
	}
	
	@Override
	public String toString() {
		return "SubscribeVO [id=" + id + ", level=" + level + ", option=" + option + ", s_date=" + s_date + ", e_date="
				+ e_date + ", sub_status=" + sub_status + "]";
	}
	
}
