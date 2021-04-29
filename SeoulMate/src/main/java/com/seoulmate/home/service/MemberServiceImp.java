package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.HouseWriteDAO;
import com.seoulmate.home.dao.MemberDAO;
import com.seoulmate.home.dao.PropensityDAO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PropensityVO;
@Service
public class MemberServiceImp implements MemberService {
	@Inject
	MemberDAO dao;
	@Inject
	PropensityDAO pDAO;
	@Inject
	HouseWriteDAO hwDAO;
	
	@Override
	public MemberVO loginCheck(String userid, String username) {
		return dao.loginCheck(userid, username);
	}
	@Override
	public int idCheck(String userid) {
		return dao.idCheck(userid);
	}
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}
	@Override
	public MemberVO memberSelect(String userid) {
		return dao.memberSelect(userid);
	}
	@Override
	public int memberPwdSelect(String userid, String userpwd) {
		return dao.memberPwdSelect(userid, userpwd);
	}
	@Override
	public int memberUpdatePwdY(MemberVO vo) {
		return dao.memberUpdatePwdY(vo);
	}
	@Override
	public int memberUpdatePwdN(MemberVO vo) {
		return dao.memberUpdatePwdN(vo);
	}
	@Override
	public String memberFindId(MemberVO vo) {
		return dao.memberFindId(vo);
	}
	@Override
	public int memberExit(String userid, String userpwd) {
		return dao.memberExit(userid, userpwd);
	}
	// 성향 관련
	@Override
	public int propInsert(PropensityVO vo) {
		return pDAO.propInsert(vo);
	}
	@Override
	public PropensityVO propMateSelect(String userid) {
		return pDAO.propMateSelect(userid);
	}
	@Override
	public int propMateUpdate(PropensityVO pVO) {
		return pDAO.propMateUpdate(pVO);
	}
	@Override
	public int gradePremiumUpdate(String userid) {
		return dao.gradePremiumUpdate(userid);
	}
	@Override
	public int propPcaseM(String userid) {
		return pDAO.propPcaseM(userid);
	}
	@Override
	public int propPcaseH(String userid) {
		return pDAO.propPcaseH(userid);
	}
	@Override
	public PropensityVO propHouseSelect(String userid, int pno) {
		return pDAO.propHouseSelect(userid, pno);
	}
	@Override
	public int propHouseUpdate(PropensityVO pVO) {
		return pDAO.propHouseUpdate(pVO);
	}
	@Override
	public List<HouseWriteVO> houseList(String userid) {
		return hwDAO.houseList(userid);
	}
	@Override
	public int pnoCheck(String userid, int pno) {
		return hwDAO.pnoCheck(userid, pno);
	}
	
	
}
