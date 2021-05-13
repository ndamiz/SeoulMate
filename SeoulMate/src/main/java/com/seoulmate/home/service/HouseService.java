package com.seoulmate.home.service;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.PropensityVO;

public interface HouseService {
	
	//하우스 등록
	public int houseInsert(HouseWriteVO vo);
	
	//하우스(방) 등록
	public int roomInsert(HouseRoomVO vo);
	
	// 성향 추가
	public int propInsert(PropensityVO vo);
	
	// 성향 업데이트
	public int propHouseUpdate(PropensityVO vo);
	
	//하우스 등록했는지 확인 (0-> 성향pno 확인해야함)
	public int houseCheck(String userid);
	
	//성향 pno 확인
	public int housePnoCheck(String userid);
	
	//성향pno의 psq.currval 값 가져오기
	public int proPnoCheck(String userid);

	//가입할때 h 유형가입, pno 확인
	public int proHouseCheck(String userid);
}
