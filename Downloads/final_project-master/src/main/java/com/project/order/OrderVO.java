package com.project.order;

import java.util.Date;
import java.util.List;

public class OrderVO {

	private String ORD_CODE;
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

	private int w_no;

	public String getORD_CODE() {
		return ORD_CODE;
	}

	public void setORD_CODE(String oRD_CODE) {
		ORD_CODE = oRD_CODE;
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

	public int getW_no() {
		return w_no;
	}

	public void setW_no(int w_no) {
		this.w_no = w_no;
	}

	@Override
	public String toString() {
		return "OrderVO [ORD_CODE=" + ORD_CODE + ", id=" + id + ", ord_date=" + ord_date + ", ord_stat=" + ord_stat
				+ ", pay_stat=" + pay_stat + ", cs_stat=" + cs_stat + ", prod_price=" + prod_price + ", prod_p_price="
				+ prod_p_price + ", deli_price=" + deli_price + ", ord_t_price=" + ord_t_price + ", ord_addr="
				+ ord_addr + ", ord_phone=" + ord_phone + ", ord_memo=" + ord_memo + ", w_no=" + w_no + "]";
	}


//	public void getOrderPriceInfo() {
//		/* 상품 비용 & 적립포인트 */
//		for (OrderItemDTO order : orders) {
//			orderSalePrice += order.getTotalPrice();
//			orderSavePoint += order.getTotalSavePoint();
//		}
//		/* 배송비용 */
//		if (orderSalePrice >= 30000) {
//			deliveryCost = 0;
//		} else {
//			deliveryCost = 3000;
//		}
//		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
//		orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
//	}

}
