package com.seoulmate.home.dao;

import com.seoulmate.home.vo.HouseRoomVO;

public interface HouseRoomDAO {
	//하우스(방) 등록
	public int roomInsert(HouseRoomVO vo);
	
	//houseroom 가져오기
	public HouseRoomVO roomSelect(int no, String userid);
	
	//방 수정
	public int roomUpdate(HouseRoomVO vo);
	
	//방 삭제
	public int roomDel(HouseRoomVO vo);
}
