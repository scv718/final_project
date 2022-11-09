package com.project.cart;

import java.util.Arrays;
import java.util.List;

public class CartVO {
	
	private int ord_cart_no; //카트 넘버
	private int ord_cart_noList[]; //카트 넘버
	

	private String id;
	private int w_no;// 와인 번호
	private int ord_quan;
	private int w_price;// 가격 = 판매가*상품수량 = 상품금액
	private String pay_stat;
	private String ord_code;// 주문 코드 = 오더 테이블 참조

	private String w_nm_k;
	private String w_nm_k_List[];

	private String w_nm_e;
	private String w_nm_e_List[];
	
	private int quantity;
	private String w_image1;
	
	private int totalCount ;            // 총 갯수
	private int totalKind ;            // 총 종류
	private int deliveryPrice;         // 배송비
	private int finalTotalPrice;       // 최종 가격(총 가격 + 배송비)
	public int getOrd_cart_no() {
		return ord_cart_no;
	}
	public void setOrd_cart_no(int ord_cart_no) {
		this.ord_cart_no = ord_cart_no;
	}
	public int[] getOrd_cart_noList() {
		return ord_cart_noList;
	}
	public void setOrd_cart_noList(int[] ord_cart_noList) {
		this.ord_cart_noList = ord_cart_noList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getW_no() {
		return w_no;
	}
	public void setW_no(int w_no) {
		this.w_no = w_no;
	}
	public int getOrd_quan() {
		return ord_quan;
	}
	public void setOrd_quan(int ord_quan) {
		this.ord_quan = ord_quan;
	}
	public int getW_price() {
		return w_price;
	}
	public void setW_price(int w_price) {
		this.w_price = w_price;
	}
	public String getPay_stat() {
		return pay_stat;
	}
	public void setPay_stat(String pay_stat) {
		this.pay_stat = pay_stat;
	}
	public String getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(String ord_code) {
		this.ord_code = ord_code;
	}
	public String getW_nm_k() {
		return w_nm_k;
	}
	public void setW_nm_k(String w_nm_k) {
		this.w_nm_k = w_nm_k;
	}
	public String[] getW_nm_k_List() {
		return w_nm_k_List;
	}
	public void setW_nm_k_List(String[] w_nm_k_List) {
		this.w_nm_k_List = w_nm_k_List;
	}
	public String getW_nm_e() {
		return w_nm_e;
	}
	public void setW_nm_e(String w_nm_e) {
		this.w_nm_e = w_nm_e;
	}
	public String[] getW_nm_e_List() {
		return w_nm_e_List;
	}
	public void setW_nm_e_List(String[] w_nm_e_List) {
		this.w_nm_e_List = w_nm_e_List;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getW_image1() {
		return w_image1;
	}
	public void setW_image1(String w_image1) {
		this.w_image1 = w_image1;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalKind() {
		return totalKind;
	}
	public void setTotalKind(int totalKind) {
		this.totalKind = totalKind;
	}
	public int getDeliveryPrice() {
		return deliveryPrice;
	}
	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}
	public int getFinalTotalPrice() {
		return finalTotalPrice;
	}
	public void setFinalTotalPrice(int finalTotalPrice) {
		this.finalTotalPrice = finalTotalPrice;
	}
	@Override
	public String toString() {
		return "CartVO [ord_cart_no=" + ord_cart_no + ", ord_cart_noList=" + Arrays.toString(ord_cart_noList) + ", id="
				+ id + ", w_no=" + w_no + ", ord_quan=" + ord_quan + ", w_price=" + w_price + ", pay_stat=" + pay_stat
				+ ", ord_code=" + ord_code + ", w_nm_k=" + w_nm_k + ", w_nm_k_List=" + Arrays.toString(w_nm_k_List)
				+ ", w_nm_e=" + w_nm_e + ", w_nm_e_List=" + Arrays.toString(w_nm_e_List) + ", quantity=" + quantity
				+ ", w_image1=" + w_image1 + ", totalCount=" + totalCount + ", totalKind=" + totalKind
				+ ", deliveryPrice=" + deliveryPrice + ", finalTotalPrice=" + finalTotalPrice + "]";
	}
	

	
}
