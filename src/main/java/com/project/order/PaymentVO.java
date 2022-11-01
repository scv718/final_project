package com.project.order;

public class PaymentVO {
	private String PAYMENT_CODE;
	private String ORDER_CODE;
	private String PAYMENT_METHOD;
	private String PAYMENT_DATE;
	private int TOTAL_PAYMENT;
	private int DEPOSIT_AMOUNT;
	private String DEPOSIT_NAME;
	private String DEPOSIT_BANK;
	public String getPAYMENT_CODE() {
		return PAYMENT_CODE;
	}
	public void setPAYMENT_CODE(String pAYMENT_CODE) {
		PAYMENT_CODE = pAYMENT_CODE;
	}
	public String getORDER_CODE() {
		return ORDER_CODE;
	}
	public void setORDER_CODE(String oRDER_CODE) {
		ORDER_CODE = oRDER_CODE;
	}
	public String getPAYMENT_METHOD() {
		return PAYMENT_METHOD;
	}
	public void setPAYMENT_METHOD(String pAYMENT_METHOD) {
		PAYMENT_METHOD = pAYMENT_METHOD;
	}
	public String getPAYMENT_DATE() {
		return PAYMENT_DATE;
	}
	public void setPAYMENT_DATE(String pAYMENT_DATE) {
		PAYMENT_DATE = pAYMENT_DATE;
	}
	public int getTOTAL_PAYMENT() {
		return TOTAL_PAYMENT;
	}
	public void setTOTAL_PAYMENT(int tOTAL_PAYMENT) {
		TOTAL_PAYMENT = tOTAL_PAYMENT;
	}
	public int getDEPOSIT_AMOUNT() {
		return DEPOSIT_AMOUNT;
	}
	public void setDEPOSIT_AMOUNT(int dEPOSIT_AMOUNT) {
		DEPOSIT_AMOUNT = dEPOSIT_AMOUNT;
	}
	public String getDEPOSIT_NAME() {
		return DEPOSIT_NAME;
	}
	public void setDEPOSIT_NAME(String dEPOSIT_NAME) {
		DEPOSIT_NAME = dEPOSIT_NAME;
	}
	public String getDEPOSIT_BANK() {
		return DEPOSIT_BANK;
	}
	public void setDEPOSIT_BANK(String dEPOSIT_BANK) {
		DEPOSIT_BANK = dEPOSIT_BANK;
	}
	@Override
	public String toString() {
		return "PaymentVO [PAYMENT_CODE=" + PAYMENT_CODE + ", ORDER_CODE=" + ORDER_CODE + ", PAYMENT_METHOD="
				+ PAYMENT_METHOD + ", PAYMENT_DATE=" + PAYMENT_DATE + ", TOTAL_PAYMENT=" + TOTAL_PAYMENT
				+ ", DEPOSIT_AMOUNT=" + DEPOSIT_AMOUNT + ", DEPOSIT_NAME=" + DEPOSIT_NAME + ", DEPOSIT_BANK="
				+ DEPOSIT_BANK + "]";
	}
	
	
}
