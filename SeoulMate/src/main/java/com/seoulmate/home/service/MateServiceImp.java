package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.PropensityDAO;
@Service
public class MateServiceImp implements MateService {
	@Inject
	PropensityDAO dao;
}
