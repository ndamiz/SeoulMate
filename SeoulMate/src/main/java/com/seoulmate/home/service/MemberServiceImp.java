package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.MemberDAO;
import com.seoulmate.home.dao.PropensityDAO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PropensityVO;
@Service
public class MemberServiceImp implements MemberService {
	@Inject
	MemberDAO dao;
	@Inject
	PropensityDAO pDAO;
	
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
	@Override
	public int propInsert(PropensityVO vo) {
		return pDAO.propInsert(vo);
	}
}
