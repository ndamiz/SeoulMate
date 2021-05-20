package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.HouseRoomDAO;
import com.seoulmate.home.dao.HouseWriteDAO;
import com.seoulmate.home.dao.PropensityDAO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.ListVO;
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
		return hDAO.houseInsert(vo);
	}

	@Override
	public int propInsert(PropensityVO vo) { //성향 등록
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
	public PropensityVO propHouseSelect(String userid, int pno) { //pcase='h' 일 경우 성향 가져오기, 하우스 성향 가져오기
		return pDAO.propHouseSelect(userid, pno);
	}

	@Override
	public HouseWriteVO houseSelect(int no, String userid) { //housewrite 가져오기
		return hDAO.houseSelect(no, userid);
	}

	@Override
	public HouseRoomVO roomSelect(int no, String userid) { //houseRoom 가져오기
		return dao.roomSelect(no, userid);
	}

	@Override
	public int houseUpdate(HouseWriteVO vo) { //하우스 수정하기
		return hDAO.houseUpdate(vo);
	}
	
	@Override
	public int roomUpdate(HouseRoomVO vo) { //방 수정하기
		return dao.roomUpdate(vo);
	}

	@Override
	public int houseDel(HouseWriteVO vo) { //하우스 삭제
		return hDAO.houseDel(vo);
	}

	@Override
	public int roomDel(HouseRoomVO vo) { //방 삭제
		return dao.roomDel(vo);
	}

	@Override
	public String houseProfile(String housepic1,int no) { //하우스사진 가져오기
		return hDAO.houseProfile(housepic1, no);
	}

	@Override
	public List<HouseWriteVO> getNewIndexHouse(String addr, int rent, int deposit, int m_gen) {
		return hDAO.getNewIndexHouse(addr, rent, deposit, m_gen);
	}

	@Override
	public HouseWriteVO houseSelect2(int no) { //하우스 보기 (내가쓴글 아니여도 가능)
		return hDAO.houseSelect2(no);
	}

	@Override
	public HouseRoomVO roomSelect2(int no) { //HouseRoom 가져오기 (본인 작성글 아니여도 가능)
		return dao.roomSelect2(no);
	}

	@Override
	public PropensityVO propHouseSelect2(int pno) {
		// TODO Auto-generated method stub
		return pDAO.propHouseSelect2(pno);
	}
}
