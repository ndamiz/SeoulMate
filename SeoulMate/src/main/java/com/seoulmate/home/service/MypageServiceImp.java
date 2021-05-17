package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.MypageDAO;
import com.seoulmate.home.vo.ApplyInviteVO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;
@Service
public class MypageServiceImp implements MypageService {
	@Inject
	MypageDAO dao;

	@Override
	public int likemarkInsert(int no, String userid, String category) {
		// 찜 등록
		return dao.likemarkInsert(no, userid, category);
	}
	@Override
	public List<LikeMarkVO> likemarkAllRecord(String category, String userid) {
		// 찜 목록 출력
		return dao.likemarkAllRecord(category, userid);
	}

	@Override
	public HouseWriteVO getHousedetails(int no) {
		// 하우스
		return dao.getHousedetails(no);
	}

	@Override
	public HouseRoomVO getMinRentDeposit(int no) {
		// min rent, min deposit
		return dao.getMinRentDeposit(no);
	}
	
	@Override
	public MateWriteVO getMatedetails(int no) {
		// 메이트
		return dao.getMatedetails(no);
	}
	
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
	//팝업
	@Override
	public List<ApplyInviteVO> applyInviteSelect(ApplyInviteVO aiVO) {
		// 메이트확인. 받은초대, 보낸신청 (userid)
		// 하우스확인. 받은신청, 보낸초대 (no)
		return dao.applyInviteSelect(aiVO);
	}
	// 메이트 글 vo받아오는거는 myPageMateWriteSelect사용하여 받기, 
	// 하우스 글 vo받아오기 
	@Override
	public HouseWriteVO oneHouseWriteSelect(int no) {
		return dao.oneHouseWriteSelect(no);
	}
	
}
