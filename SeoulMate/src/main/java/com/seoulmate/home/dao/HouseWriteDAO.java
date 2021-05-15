package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.HouseWriteVO;

public interface HouseWriteDAO {
	// 특정 대상의 하우스 목록 가져오기
	List<HouseWriteVO> houseList(String userid);
	// 하우스글의 성향 번호 가져오기
	int pnoCheck(String userid, int pno);
	
	//하우스 등록
	public int houseInsert(HouseWriteVO vo);
	
	//성향pno의 psq.currval 값 가져오기
	public int proPnoCheck(HouseWriteVO vo);
	
//	public int houseInsert2(HouseWriteVO vo);
	
	//가입할때 h 유형가입, pno 확인
//	public int proHouseCheck(String userid);
	
	//house name 가져오기
//	public String housenameCheck(String housename);
	
	//house name 수정하기
	public int housenameUpdate(String housename, int pno);
}
