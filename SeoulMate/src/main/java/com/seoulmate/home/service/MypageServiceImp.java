package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.MypageDAO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;
@Service
public class MypageServiceImp implements MypageService {
	@Inject
	MypageDAO dao;

	@Override
	public int houseConfirm(String userid) {
		return dao.houseConfirm(userid);
	}
	@Override
	public List<HouseWriteVO> myPageHouseWriteSelect(String userid) {
		return dao.myPageHouseWriteSelect(userid);
	}
	@Override
	public int mateConfirm(String userid) {
		return dao.mateConfirm(userid);
	}
	@Override
	public MateWriteVO myPageMateWriteSelect(String userid) {
		return dao.myPageMateWriteSelect(userid);
	}
	@Override
	public int likeMarkConfirm(String userid) {
		return dao.likeMarkConfirm(userid);
	}
	@Override
	public List<LikeMarkVO> likeMarkSelect(String userid) {
		return dao.likeMarkSelect(userid);
	}
	@Override
	public HouseWriteVO houseLikeSelect(int no) {
		return dao.houseLikeSelect(no);
	}

	@Override
	public MateWriteVO mateLikeSelect(int no) {
		return dao.mateLikeSelect(no);
	}



	
}
