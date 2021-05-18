package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.PropensityVO;

public interface HouseWriteDAO {
	// 특정 대상의 하우스 목록 가져오기
	List<HouseWriteVO> houseList(String userid);
	// 특정 대상의 하우스 집이 등록된 성향의 목록을 가져오기
	List<HouseWriteVO> houseproList(String userid);
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
	
	//housewrite 가져오기
	public HouseWriteVO houseSelect(int no, String userid);
	
	//houseroom 가져오기
	public HouseRoomVO roomSelect(int no, String userid);

	// 하우스 성향 가져오기
	public PropensityVO propHouseSelect(String userid, int pno);
	
	//하우스 업데이트
	public int houseUpdate(HouseWriteVO vo);
	
	//하우스 삭제
	public int houseDel(HouseWriteVO vo);
	
	//하우스 사진 가져오기
	public String houseProfile(String housepic1,int no);
}
