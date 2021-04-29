package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.HomeDAO;
import com.seoulmate.home.vo.HouseRoomVO;
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
	public HouseRoomVO getPreHouse() {
		return dao.getPreHouse();
	}

}
