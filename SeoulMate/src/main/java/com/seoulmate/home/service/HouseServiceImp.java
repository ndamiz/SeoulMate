package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.HouseRoomDAO;
import com.seoulmate.home.dao.HouseWriteDAO;
import com.seoulmate.home.dao.PropensityDAO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.PropensityVO;
@Service
public class HouseServiceImp implements HouseService {
	@Inject
	HouseRoomDAO dao; //방 등록
	@Inject
	HouseWriteDAO hDAO; //하우스 등록
	@Inject
	PropensityDAO pDAO; //성향 등록

	@Override
	public int roomInsert(HouseRoomVO vo) { //하우스(방) 등록
		return dao.roomInsert(vo);
	}

	@Override
	public int houseInsert(HouseWriteVO vo) { //하우스 등록
		// TODO Auto-generated method stub
		return hDAO.houseInsert(vo);
	}

	@Override
	public int propInsert(PropensityVO vo) { //성향 등록
		// TODO Auto-generated method stub
		return pDAO.propInsert(vo);
	}

	@Override
	public int propHouseUpdate(PropensityVO vo) { //하우스성향 수정
		return pDAO.propHouseUpdate(vo);
	}

	@Override
	public int houseCheck(String userid) {
		return pDAO.houseCheck(userid);
	}

	@Override
	public int housePnoCheck(String userid) {
		return pDAO.housePnoCheck(userid);
	}

	@Override
	public int proPnoCheck(String userid) {
		return pDAO.proPnoCheck(userid);
	}

	@Override
	public int proHouseCheck(String userid) {
		// TODO Auto-generated method stub
		return pDAO.proHouseCheck(userid);
	}

//	@Override
//	public String housenameCheck(String housename) { //하우스네임 가져오기
//		return hDAO.housenameCheck(housename);
//	}

	@Override
	public int housenameUpdate(String housename, int pno) {
		return hDAO.housenameUpdate(housename, pno);
	}

	@Override
	public PropensityVO propHouseSelect(String userid, int pno) {
		return pDAO.propHouseSelect(userid, pno);
	}

	@Override
	public HouseWriteVO houseSelect(String userid) { //housewrite 가져오기
		return hDAO.houseSelect(userid);
	}



	

}
