package com.seoulmate.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoulmate.home.service.PremiumService;
@Controller
public class PremiumController {
	@Inject
	PremiumService service;
	
	@RequestMapping("/premiumInfo")
	public String premiumInfo(HttpSession session) {
		
		return "premium/premiumInfo";
	}
}
