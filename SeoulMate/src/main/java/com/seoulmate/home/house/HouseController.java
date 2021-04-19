package com.seoulmate.home.house;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HouseController {

	@RequestMapping("/houseIndex")
	public String houserIndex() {
	return "house/houseIndex";
	}
	
	@RequestMapping("/houseWrite1")
	public String houseWirte1() {
		return "house/houseWrite1";
	}
	
	@RequestMapping("/houseWrite2")
	public String houseWirte2() {
		return "house/houseWrite2";
	}
	
	@RequestMapping("/houseWrite3")
	public String houseWirte3() {
		return "house/houseWrite3";
	}
	
	@RequestMapping("/houseWrite4")
	public String houseWirte4() {
		return "house/houseWrite4";
	}
	
	@RequestMapping("/houseWrite5")
	public String houseWirte5() {
		return "house/houseWrite5";
	}
	
	@RequestMapping("/houseWrite6")
	public String houseWirte6() {
		return "house/houseWrite6";
	}
	
	@RequestMapping("/houseWrite7")
	public String houseWirte7() {
		return "house/houseWrite7";
	}
	
	@RequestMapping("/houseWrite8")
	public String houseWirte8() {
		return "house/houseWrite8";
	}
	
	@RequestMapping("/houseWrite9")
	public String houseWirte9() {
		return "house/houseWrite9";
	}
	
	@RequestMapping("/houseWrite10")
	public String houseWirte10() {
		return "house/houseWrite10";
	}
	
	
	
}
