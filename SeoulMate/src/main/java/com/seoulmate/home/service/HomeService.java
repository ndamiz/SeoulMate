package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;

public interface HomeService {
	public String[] getHouseMap();
	public String[] getMateMap();
	public List<HouseWriteVO> getPreHouse();
	public List<HouseWriteVO> getNewHouse();
	public HouseRoomVO getDesposit(int no);
}
