package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.AdminDAO;
import com.seoulmate.home.dao.MemberDAO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PayVO;

@Service
public class AdminServiceImp implements AdminService {
	@Inject
	AdminDAO dao;
	@Inject
	MemberDAO mDAO;
	
	@Override
	public List<String> memberSelect() {
		return dao.memberSelect();
	}
	@Override
	public MemberVO memberInfo(String userid) {
		return dao.memberInfo(userid);
	}
	@Override
	public int memberInfoSave(MemberVO vo) {
		return dao.memberInfoSave(vo);
	}
	@Override
	public String memberProfile(String userid) {
		return mDAO.memberProfile(userid);
	}
	
// pay management ///////////////////////////////////
	@Override
	public int totalRecode(PayVO payVO) {
		return dao.totalRecode(payVO);
	}
	@Override
	public List<PayVO> payOnePageListSelect(PayVO payVO) {
		return dao.payOnePageListSelect(payVO);
	}
	
	
}
