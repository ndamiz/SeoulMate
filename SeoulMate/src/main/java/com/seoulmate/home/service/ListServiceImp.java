package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.ListDAO;
import com.seoulmate.home.vo.ListVO;

@Service
public class ListServiceImp implements ListService{
	@Inject
	ListDAO dao;

	@Override
	public List<ListVO> premiumHouseList(String userid) {
		return dao.premiumHouseList(userid);
	}

	@Override
	public ListVO premiumHouseSocre(String userid, int pno) {
		return dao.premiumHouseSocre(userid, pno);
	}

	@Override
	public int myHousePnoCount(String userid) {
		return dao.myHousePnoCount(userid);
	}
	
	@Override
	public int[] myHousePno(String userid) {
		return dao.myHousePno(userid);
	}

	
}
