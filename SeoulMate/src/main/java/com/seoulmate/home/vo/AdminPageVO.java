package com.seoulmate.home.vo;

public class AdminPageVO {
	private int pageNum = 1; //현재페이지
	private int onePageNum = 5; //한페이지당 나오는 페이지 번호 수
	private int onePageRecord = 10;// 한페이지당 레코드 수
	
	private int totalRecord;	//총 레코드 수 
	private int totalPage;		//마지막 페이지(총 페이지 수)
	private int startPageNum = 1;	//시작페이지
	
	private int lastPageRecord = 5; //마지막 페이지의 남은 레코드 수

	//각 페이지에 맞는 검색키 검색어 vo
	//	신고관리
	
	


	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		
		//시작페이지 번호를 계산
		startPageNum = (pageNum-1)/onePageNum*onePageNum+1;
	}

	public int getOnePageNum() {
		return onePageNum;
	}

	public void setOnePageNum(int onePageNum) {
		this.onePageNum = onePageNum;
	}

	public int getOnePageRecord() {
		return onePageRecord;
	}

	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//총 레코드수를 이용하여 총페이지수를 계산
		totalPage = (int)Math.ceil(totalRecord/(double)onePageRecord);

		//마지막페이지 레코드 수
		if(totalRecord%onePageRecord==0) {
			lastPageRecord = onePageRecord;
		}else {
			lastPageRecord = totalRecord%onePageRecord; //마지막페이지의 남은 레코드 수
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getLastPageRecord() {
		return lastPageRecord;
	}

	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}
}
