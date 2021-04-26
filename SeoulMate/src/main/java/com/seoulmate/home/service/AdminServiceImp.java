package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.AdminDAO;
@Service
public class AdminServiceImp implements AdminService {
	@Inject
	AdminDAO dao;
}
