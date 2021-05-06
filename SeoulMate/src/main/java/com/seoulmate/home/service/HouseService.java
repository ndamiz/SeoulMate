package com.seoulmate.home.service;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;

public interface HouseService {
	
	//하우스 등록
	public int houseInsert(HouseWriteVO vo);
	
	//하우스(방) 등록
	public int roomInsert(HouseRoomVO vo);
}
