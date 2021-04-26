package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.MypageDAO;
@Service
public class MypageServiceImp implements MypageService {
	@Inject
	MypageDAO dao;
	
}
