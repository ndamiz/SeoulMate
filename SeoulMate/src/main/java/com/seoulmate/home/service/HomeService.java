package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;

public interface HomeService {
	public String[] getHouseMap();
	public String[] getMateMap();
	public List<HouseWriteVO> getPreHouse();
	public List<HouseWriteVO> getNewHouse();
	public List<MateWriteVO> getPreMate();
	public List<MateWriteVO> getNewMate();
	public HouseRoomVO getDesposit(int no);
	public MemberVO getDetail(String userid);
}
