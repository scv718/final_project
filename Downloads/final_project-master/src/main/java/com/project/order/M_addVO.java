package com.project.order;

public class M_addVO {
	private String id;
	// 이름
	private String m_name_1;
	private String m_name_2;
	private String m_name_3;
	// 주소 1~3
	private String m_address_1;
	private String m_address_2;
	private String m_address_3;
	// 전화번호1~3
	private String m_phone_1;
	private String m_phone_2;
	private String m_phone_3;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getM_name_1() {
		return m_name_1;
	}

	public void setM_name_1(String m_name_1) {
		this.m_name_1 = m_name_1;
	}

	public String getM_name_2() {
		return m_name_2;
	}

	public void setM_name_2(String m_name_2) {
		this.m_name_2 = m_name_2;
	}

	public String getM_name_3() {
		return m_name_3;
	}

	public void setM_name_3(String m_name_3) {
		this.m_name_3 = m_name_3;
	}

	public String getM_address_1() {
		return m_address_1;
	}

	public void setM_address_1(String m_address_1) {
		this.m_address_1 = m_address_1;
	}

	public String getM_address_2() {
		return m_address_2;
	}

	public void setM_address_2(String m_address_2) {
		this.m_address_2 = m_address_2;
	}

	public String getM_address_3() {
		return m_address_3;
	}

	public void setM_address_3(String m_address_3) {
		this.m_address_3 = m_address_3;
	}

	public String getM_phone_1() {
		return m_phone_1;
	}

	public void setM_phone_1(String m_phone_1) {
		this.m_phone_1 = m_phone_1;
	}

	public String getM_phone_2() {
		return m_phone_2;
	}

	public void setM_phone_2(String m_phone_2) {
		this.m_phone_2 = m_phone_2;
	}

	public String getM_phone_3() {
		return m_phone_3;
	}

	public void setM_phone_3(String m_phone_3) {
		this.m_phone_3 = m_phone_3;
	}

	@Override
	public String toString() {
		return "M_addVO [id=" + id + ", m_name_1=" + m_name_1 + ", m_name_2=" + m_name_2 + ", m_name_3=" + m_name_3
				+ ", m_address_1=" + m_address_1 + ", m_address_2=" + m_address_2 + ", m_address_3=" + m_address_3
				+ ", m_phone_1=" + m_phone_1 + ", m_phone_2=" + m_phone_2 + ", m_phone_3=" + m_phone_3 + "]";
	}

}
