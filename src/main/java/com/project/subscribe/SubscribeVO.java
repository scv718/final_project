package com.project.subscribe;

public class SubscribeVO {
 
	private String id;//회원 아이디
	private int level;//회원 등급 <디폴트(0), 초급(1), 중급(2), 고급(3) 총 4단계
	private String sub_date;//구독 시작일자
	private String sub_pm_status;//결제여부 <입금전/추가입금대기/입금완료(수동)/입급완료(자동)/결제완료
	private int sub_deli;//구독 배송 확인 <배송대기(0)/배송중(1)/배송완료(2)
	private String e_date;//구독 종료일자
	private int sub_status;//구독 상태
	
	private int s_sweet;//선호 당도
	private int s_body;//선호 바디감
	private int s_acidity;//선호 산미
	private int s_tannins;//선호 타닌
	
	private int prod_price;//상품 금액
	private int deli_price;//배송비
	private String s_product;
	private String s_product2;
	private String s_product3;
	
	public String getS_product() {
		return s_product;
	}

	public void setS_product(String s_product) {
		this.s_product = s_product;
	}

	public String getS_product2() {
		return s_product2;
	}

	public void setS_product2(String s_product2) {
		this.s_product2 = s_product2;
	}

	public String getS_product3() {
		return s_product3;
	}

	public void setS_product3(String s_product3) {
		this.s_product3 = s_product3;
	}

	@Override
	public String toString() {
		return "SubscribeVO [id=" + id + ", level=" + level + ", sub_date=" + sub_date + ", sub_pm_status="
				+ sub_pm_status + ", sub_deli=" + sub_deli + ", e_date=" + e_date + ", sub_status=" + sub_status
				+ ", s_sweet=" + s_sweet + ", s_body=" + s_body + ", s_acidity=" + s_acidity + ", s_tannins="
				+ s_tannins + ", prod_price=" + prod_price + ", deli_price=" + deli_price + "]";
	}
	
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
	public String getSub_date() {
		return sub_date;
	}
	public void setSub_date(String sub_date) {
		this.sub_date = sub_date;
	}
	public String getSub_pm_status() {
		return sub_pm_status;
	}
	public void setSub_pm_status(String sub_pm_status) {
		this.sub_pm_status = sub_pm_status;
	}
	public int getSub_deli() {
		return sub_deli;
	}
	public void setSub_deli(int sub_deli) {
		this.sub_deli = sub_deli;
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
	public int getS_sweet() {
		return s_sweet;
	}
	public void setS_sweet(int s_sweet) {
		this.s_sweet = s_sweet;
	}
	public int getS_body() {
		return s_body;
	}
	public void setS_body(int s_body) {
		this.s_body = s_body;
	}
	public int getS_acidity() {
		return s_acidity;
	}
	public void setS_acidity(int s_acidity) {
		this.s_acidity = s_acidity;
	}
	public int getS_tannins() {
		return s_tannins;
	}
	public void setS_tannins(int s_tannins) {
		this.s_tannins = s_tannins;
	}
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public int getDeli_price() {
		return deli_price;
	}
	public void setDeli_price(int deli_price) {
		this.deli_price = deli_price;
	}

	
}
