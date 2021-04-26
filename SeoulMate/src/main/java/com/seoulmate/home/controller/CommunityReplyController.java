package com.seoulmate.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.seoulmate.home.service.CommunityReplyService;

@Controller
public class CommunityReplyController {
	@Inject
	CommunityReplyService service;
	
}
