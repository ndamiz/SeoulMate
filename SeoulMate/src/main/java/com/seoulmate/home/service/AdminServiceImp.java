package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.AdminDAO;
@Service
public class AdminServiceImp implements AdminService {
	@Inject
	AdminDAO dao;

	@Override
	public List<String> memberSelect() {
		return dao.memberSelect();
	}
}
