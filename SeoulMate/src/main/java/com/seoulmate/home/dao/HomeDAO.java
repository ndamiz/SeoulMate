package com.seoulmate.home.dao;

import com.seoulmate.home.vo.HouseRoomVO;

public interface HomeDAO {
	
	public String[] getHouseMap();
	public String[] getMateMap();
	public HouseRoomVO getPreHouse();
	public HouseRoomVO getNewHouse();
}
