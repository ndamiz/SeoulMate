package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.QnaDAO;
import com.seoulmate.home.vo.ContactVO;

@Service
public class QnaServiceImp implements QnaService {
	@Inject
	QnaDAO dao;

	@Override
	public int contactInsert(ContactVO cVO) {
		return dao.contactInsert(cVO);
	}

	@Override
	public String useridCheck(String userid) {
		return dao.useridCheck(userid);
	}
}
