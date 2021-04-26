package com.seoulmate.home.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.CommunityReplyDAO;
@Service
public class CommunityReplyServiceImp implements CommunityReplyService {
	@Inject
	CommunityReplyDAO dao;
}
