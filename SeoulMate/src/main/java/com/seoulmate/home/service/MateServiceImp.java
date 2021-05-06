package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.PropensityDAO;
import com.seoulmate.home.vo.MateWriteVO;
@Service
public class MateServiceImp implements MateService {
	@Inject
	PropensityDAO dao;

	@Override
	public int mateInsert(MateWriteVO vo) { //메이트 등록
		// TODO Auto-generated method stub
		return 0;
	}
}
