package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;

public interface HomeDAO {
	public String[] getHouseMap();
	public String[] getMateMap();
	public List<HouseWriteVO> getPreHouse();
	public List<HouseWriteVO> getNewHouse();
	public HouseRoomVO getDesposit(int no);
}
