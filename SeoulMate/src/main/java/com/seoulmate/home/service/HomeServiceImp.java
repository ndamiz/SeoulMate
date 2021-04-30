package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.HomeDAO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
@Service
public class HomeServiceImp implements HomeService {
	@Inject
	HomeDAO dao;
	
	@Override
	public String[] getHouseMap() {
		return dao.getHouseMap();
	}

	@Override
	public String[] getMateMap() {
		return dao.getMateMap();
	}

	@Override
	public List<HouseWriteVO> getPreHouse() {
		return dao.getPreHouse();
	}

	@Override
	public List<HouseWriteVO> getNewHouse() {
		return dao.getNewHouse();
	}

	@Override
	public HouseRoomVO getDesposit(int no) {
		return dao.getDesposit(no);
	}

	@Override
	public List<MateWriteVO> getPreMate() {
		return dao.getPreMate();
	}

	@Override
	public List<MateWriteVO> getNewMate() {
		return dao.getNewMate();
	}

	@Override
	public MemberVO getDetail(String userid) {
		return dao.getDetail(userid);
	}
	
	
}
