package com.seoulmate.home.pay;

public class PremiumVO {
	private int no;				//paysq
	private String userid;		
	private String username;
	private String payStart;	//결제일 
	private String payEnd;		//결제 종료일 (결제일로부터 한달) 
	private String payMethod; 	//결제수단 
	private String refund; 		// 환불날짜 (null) 
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPayStart() {
		return payStart;
	}
	public void setPayStart(String payStart) {
		this.payStart = payStart;
	}
	public String getPayEnd() {
		return payEnd;
	}
	public void setPayEnd(String payEnd) {
		this.payEnd = payEnd;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
}
