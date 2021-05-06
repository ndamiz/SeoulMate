package com.seoulmate.home.vo;

public class HouseVO {
	private int no;
	private int pno;
	private String userid;
	private String addr;
	private String housename;
	private String housepic1;
	private String housepic2; 
	private String housepic3;
	private String housepic4;
	private String housepic5;
	private int room;
	private int bathroom;
	private int nowpeople;
	private int searchpeople;
	private String publicfacility; 
	private String writedate;
	private String enddate;
	private String housestate;
	private String houseprofile;
	
//	private int no;
	private int hno;
//	private String userid;
	private String roomName;
	private int deposit;
	private int rent;
	private String enterdate;
	private String minStay;
	private String maxStay;
	private int roomPeople;
	private int furniture;
	private String incFurniture;
	
//	private int pno;
//	private String userid;
	private String pcase;
//	private String housename;
	private int h_noise;
	private int h_pattern;
	private int h_pet;
	private int h_petwith;
	private int h_smoke;
	private int h_mood;
	private int h_communication;
	private int h_party;
	private int h_enter;
	private String h_support[];
	private String h_supportStr="";
	private String h_etc[];
	private String h_etcStr="";
	
	private int m_pattern;	
	private int m_personality;
	private int m_pet;
	private int m_smoke;
	private int m_age;
	private int m_gender;
	private int m_global;
	private int m_now;
	private String pdate;
	
	
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
	public String getHousepic2() {
		return housepic2;
	}
	public void setHousepic2(String housepic2) {
		this.housepic2 = housepic2;
	}
	public String getHousepic3() {
		return housepic3;
	}
	public void setHousepic3(String housepic3) {
		this.housepic3 = housepic3;
	}
	public String getHousepic4() {
		return housepic4;
	}
	public void setHousepic4(String housepic4) {
		this.housepic4 = housepic4;
	}
	public String getHousepic5() {
		return housepic5;
	}
	public void setHousepic5(String housepic5) {
		this.housepic5 = housepic5;
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
	public int getSearchpeople() {
		return searchpeople;
	}
	public void setSearchpeople(int searchpeople) {
		this.searchpeople = searchpeople;
	}
	public String getPublicfacility() {
		return publicfacility;
	}
	public void setPublicfacility(String publicfacility) {
		this.publicfacility = publicfacility;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getHousestate() {
		return housestate;
	}
	public void setHousestate(String housestate) {
		this.housestate = housestate;
	}
	public String getHouseprofile() {
		return houseprofile;
	}
	public void setHouseprofile(String houseprofile) {
		this.houseprofile = houseprofile;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	public String getEnterdate() {
		return enterdate;
	}
	public void setEnterdate(String enterdate) {
		this.enterdate = enterdate;
	}
	public String getMinStay() {
		return minStay;
	}
	public void setMinStay(String minStay) {
		this.minStay = minStay;
	}
	public String getMaxStay() {
		return maxStay;
	}
	public void setMaxStay(String maxStay) {
		this.maxStay = maxStay;
	}
	public int getRoomPeople() {
		return roomPeople;
	}
	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}
	public int getFurniture() {
		return furniture;
	}
	public void setFurniture(int furniture) {
		this.furniture = furniture;
	}
	public String getIncFurniture() {
		return incFurniture;
	}
	public void setIncFurniture(String incFurniture) {
		this.incFurniture = incFurniture;
	}
	public String getPcase() {
		return pcase;
	}
	public void setPcase(String pcase) {
		this.pcase = pcase;
	}
	public int getH_noise() {
		return h_noise;
	}
	public void setH_noise(int h_noise) {
		this.h_noise = h_noise;
	}
	public int getH_pattern() {
		return h_pattern;
	}
	public void setH_pattern(int h_pattern) {
		this.h_pattern = h_pattern;
	}
	public int getH_pet() {
		return h_pet;
	}
	public void setH_pet(int h_pet) {
		this.h_pet = h_pet;
	}
	public int getH_petwith() {
		return h_petwith;
	}
	public void setH_petwith(int h_petwith) {
		this.h_petwith = h_petwith;
	}
	public int getH_smoke() {
		return h_smoke;
	}
	public void setH_smoke(int h_smoke) {
		this.h_smoke = h_smoke;
	}
	public int getH_mood() {
		return h_mood;
	}
	public void setH_mood(int h_mood) {
		this.h_mood = h_mood;
	}
	public int getH_communication() {
		return h_communication;
	}
	public void setH_communication(int h_communication) {
		this.h_communication = h_communication;
	}
	public int getH_party() {
		return h_party;
	}
	public void setH_party(int h_party) {
		this.h_party = h_party;
	}
	public int getH_enter() {
		return h_enter;
	}
	public void setH_enter(int h_enter) {
		this.h_enter = h_enter;
	}
	public String[] getH_support() {
		return h_support;
	}
	public void setH_support(String[] h_support) {
		this.h_support = h_support;
	}
	public String getH_supportStr() {
		return h_supportStr;
	}
	public void setH_supportStr(String h_supportStr) {
		this.h_supportStr = h_supportStr;
	}
	public String[] getH_etc() {
		return h_etc;
	}
	public void setH_etc(String[] h_etc) {
		this.h_etc = h_etc;
	}
	public String getH_etcStr() {
		return h_etcStr;
	}
	public void setH_etcStr(String h_etcStr) {
		this.h_etcStr = h_etcStr;
	}
	public int getM_pattern() {
		return m_pattern;
	}
	public void setM_pattern(int m_pattern) {
		this.m_pattern = m_pattern;
	}
	public int getM_personality() {
		return m_personality;
	}
	public void setM_personality(int m_personality) {
		this.m_personality = m_personality;
	}
	public int getM_pet() {
		return m_pet;
	}
	public void setM_pet(int m_pet) {
		this.m_pet = m_pet;
	}
	public int getM_smoke() {
		return m_smoke;
	}
	public void setM_smoke(int m_smoke) {
		this.m_smoke = m_smoke;
	}
	public int getM_age() {
		return m_age;
	}
	public void setM_age(int m_age) {
		this.m_age = m_age;
	}
	public int getM_gender() {
		return m_gender;
	}
	public void setM_gender(int m_gender) {
		this.m_gender = m_gender;
	}
	public int getM_global() {
		return m_global;
	}
	public void setM_global(int m_global) {
		this.m_global = m_global;
	}
	public int getM_now() {
		return m_now;
	}
	public void setM_now(int m_now) {
		this.m_now = m_now;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	
}
