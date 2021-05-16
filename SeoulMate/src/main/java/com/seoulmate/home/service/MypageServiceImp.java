package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.MypageDAO;
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

	
}
