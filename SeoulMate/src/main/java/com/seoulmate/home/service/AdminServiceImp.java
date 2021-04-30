package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.AdminDAO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PayVO;

@Service
public class AdminServiceImp implements AdminService {
	@Inject
	AdminDAO dao;

	@Override
	public List<String> memberSelect() {
		return dao.memberSelect();
	}
	@Override
	public MemberVO memberInfo(String userid) {
		return dao.memberInfo(userid);

	}
	
	@Override
	public List<PayVO> payAllListSelect() {
		return dao.payAllListSelect();
	}

	@Override
	public int totalRecode(PayVO payVO) {
		// TODO Auto-generated method stub
		return dao.totalRecode(payVO);
	}
}
