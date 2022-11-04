package com.project.like;

public class LikeVO {
	private int likeno;
	private int re_no;
	private String id;
	
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "LikeVO [likeno=" + likeno + ", re_no=" + re_no + ", id=" + id + "]";
	}
	
}