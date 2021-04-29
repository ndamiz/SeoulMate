package com.seoulmate.home.service;

import com.seoulmate.home.vo.HouseRoomVO;

public interface HomeService {
	public String[] getHouseMap();
	public String[] getMateMap();
	public HouseRoomVO getPreHouse();
}
