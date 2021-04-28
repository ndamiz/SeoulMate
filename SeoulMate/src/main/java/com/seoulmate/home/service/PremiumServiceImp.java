package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.PayDAO;
import com.seoulmate.home.dao.PremiumDAO;
@Service
public class PremiumServiceImp implements PremiumService {
	@Inject
	PayDAO dao;
	@Inject
	PremiumDAO pDAO;

	@Override
	public String payEndCalculate() {
		// TODO Auto-generated method stub
		return pDAO.payEndCalculate();
	}
}
