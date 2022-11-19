package com.project.order;

import java.util.Arrays;
import java.util.Date;

public class OrderVO {
	private String ord_code;
	private String id;
	private String ord_date;
	private String ord_stat;
	private String pay_stat;
	private String cs_stat;
	private int prod_price;
	private int prod_p_price;
	private int deli_price;
	private int ord_t_price;
	private String ord_addr;
	private String ord_phone;
	private String ord_memo;
	private int w_noList[];
	private String w_image1;
	private String w_no;
	private String w_nm_k;
	private String w_nm_e;
	private String merchant_uid;
	private String ord_name;
	
	
	
	
	
	
	public String getOrd_name() {
		return ord_name;
	}

	public void setOrd_name(String ord_name) {
		this.ord_name = ord_name;
	}

	@Override
	public String toString() {
		return "OrderVO [ord_code=" + ord_code + ", id=" + id + ", ord_date=" + ord_date + ", ord_stat=" + ord_stat
				+ ", pay_stat=" + pay_stat + ", cs_stat=" + cs_stat + ", prod_price=" + prod_price + ", prod_p_price="
				+ prod_p_price + ", deli_price=" + deli_price + ", ord_t_price=" + ord_t_price + ", ord_addr="
				+ ord_addr + ", ord_phone=" + ord_phone + ", ord_memo=" + ord_memo + ", w_noList="
				+ Arrays.toString(w_noList) + ", w_image1=" + w_image1 + ", w_no=" + w_no + ", w_nm_k=" + w_nm_k
				+ ", w_nm_e=" + w_nm_e + ", merchant_uid=" + merchant_uid + "]";
	}

	public String getW_image1() {
		return w_image1;
	}

	public void setW_image1(String w_image1) {
		this.w_image1 = w_image1;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
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
	
	public int[] getW_noList() {
		return w_noList;
	}
	public void setW_noList(int[] w_noList) {
		this.w_noList = w_noList;
	}
	public String getW_no() {
		return w_no;
	}
	public void setW_no(String w_no) {
		this.w_no = w_no;
	}
	public String getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(String ord_code) {
		this.ord_code = ord_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getOrd_stat() {
		return ord_stat;
	}
	public void setOrd_stat(String ord_stat) {
		this.ord_stat = ord_stat;
	}
	public String getPay_stat() {
		return pay_stat;
	}
	public void setPay_stat(String pay_stat) {
		this.pay_stat = pay_stat;
	}
	public String getCs_stat() {
		return cs_stat;
	}
	public void setCs_stat(String cs_stat) {
		this.cs_stat = cs_stat;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getProd_p_price() {
		return prod_p_price;
	}
	public void setProd_p_price(int prod_p_price) {
		this.prod_p_price = prod_p_price;
	}
	public int getDeli_price() {
		return deli_price;
	}
	public void setDeli_price(int deli_price) {
		this.deli_price = deli_price;
	}
	public int getOrd_t_price() {
		return ord_t_price;
	}
	public void setOrd_t_price(int ord_t_price) {
		this.ord_t_price = ord_t_price;
	}
	public String getOrd_addr() {
		return ord_addr;
	}
	public void setOrd_addr(String ord_addr) {
		this.ord_addr = ord_addr;
	}
	public String getOrd_phone() {
		return ord_phone;
	}
	public void setOrd_phone(String ord_phone) {
		this.ord_phone = ord_phone;
	}
	public String getOrd_memo() {
		return ord_memo;
	}
	public void setOrd_memo(String ord_memo) {
		this.ord_memo = ord_memo;
	}
	

	
}
