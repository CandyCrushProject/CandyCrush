package com.yedam.mes.facility.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yedam.mes.facility.service.FacilityService;

@Controller
public class FacilityController {
	@Autowired
	FacilityService facilityService;
	
	@GetMapping("facilityMain")
	public String statList(Model model) {
		model.addAttribute("statList",facilityService.selectFacilityStat());
		return "facility/facilityMain";
	}
}
