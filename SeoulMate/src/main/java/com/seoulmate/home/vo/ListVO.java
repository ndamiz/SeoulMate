package com.seoulmate.home.vo;

public class ListVO {
	private int no; // 글 번호
	private int pno; // 성향 번호
	private String userid; // 아이디
	private String addr; // 주소
	private String housename; // 집 이름
	
	private String housepic1; // 하우스 사진
	private int room; // 방 갯수
	private int bathroom; // 욕실 갯수
	private int nowpeople; // 현재 인원
	
	private int score; // 점수
	
	private int deposit; // 보증금
	private int rent; // 월세
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getHousename() {
		return housename;
	}
	public void setHousename(String housename) {
		this.housename = housename;
	}
	public String getHousepic1() {
		return housepic1;
	}
	public void setHousepic1(String housepic1) {
		this.housepic1 = housepic1;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public int getBathroom() {
		return bathroom;
	}
	public void setBathroom(int bathroom) {
		this.bathroom = bathroom;
	}
	public int getNowpeople() {
		return nowpeople;
	}
	public void setNowpeople(int nowpeople) {
		this.nowpeople = nowpeople;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
}
