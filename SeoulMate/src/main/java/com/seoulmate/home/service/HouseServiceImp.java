package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.HouseRoomDAO;
import com.seoulmate.home.vo.HouseRoomVO;
@Service
public class HouseServiceImp implements HouseService {
	@Inject
	HouseRoomDAO dao;
	
	@Override
	public int houseInsert(HouseRoomVO vo) {
		return 0;
	}
}
