package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.MateWriteDAO;
import com.seoulmate.home.dao.PropensityDAO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.PropensityVO;
@Service
public class MateServiceImp implements MateService {
	@Inject
	MateWriteDAO dao; //mate DAO
	@Inject
	PropensityDAO pDAO; //성향 DAO

	@Override
	public int mateInsert(MateWriteVO vo) { //메이트 등록
		return dao.mateInsert(vo);
	}

	@Override
	public int propMateUpdate(PropensityVO vo) { //메이트성향 수정
		return pDAO.propMateUpdate(vo);
	}

	@Override
	public PropensityVO mateSelect(String userid) {
		// TODO Auto-generated method stub
		return dao.mateSelect(userid);
	}

	@Override
	public int mateUpdate(MateWriteVO vo) { //메이트 수정
		return dao.mateUpdate(vo);
	}


}
