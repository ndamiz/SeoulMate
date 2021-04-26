package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.PayDAO;
@Service
public class PremiumServiceImp implements PremiumService {
	@Inject
	PayDAO dao;
}
