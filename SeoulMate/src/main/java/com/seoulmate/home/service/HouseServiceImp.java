package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.HouseRoomDAO;
import com.seoulmate.home.dao.HouseWriteDAO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
@Service
public class HouseServiceImp implements HouseService {
	@Inject
	HouseRoomDAO dao; //방 등록
	@Inject
	HouseWriteDAO hDAO; //하우스 등록

	@Override
	public int roomInsert(HouseRoomVO vo) { //하우스(방) 등록
		return dao.roomInsert(vo);
	}

	@Override
	public int houseInsert(HouseWriteVO vo) { //하우스 등록
		// TODO Auto-generated method stub
		return hDAO.houseInsert(vo);
	}
	

}
