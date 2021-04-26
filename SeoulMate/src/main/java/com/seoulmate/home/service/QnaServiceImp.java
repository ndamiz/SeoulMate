package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.QnaDAO;

@Service
public class QnaServiceImp implements QnaService {
	@Inject
	QnaDAO dao;
}
