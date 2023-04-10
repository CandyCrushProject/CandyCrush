package com.yedam.mes.facility.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.mes.facility.service.FacilityService;
import com.yedam.mes.facility.service.vo.FacilityMaintenanceVO;
import com.yedam.mes.facility.service.vo.FacilityOperationVO;

@Controller
public class FacilityController {
	@Autowired
	FacilityService facilityService;
	
	@GetMapping("facilityMain")
	public String statList(Model model) {
		model.addAttribute("statList",facilityService.selectFacilityStat());
		return "facility/facilityMain";
	}
	@GetMapping("facilityMaintenance")
	public String facilityMaintenance(Model model) {
		model.addAttribute("statList",facilityService.selectFacilityStat());
		model.addAttribute("mtnList",facilityService.selectFacilityMaintenance());
		return "facility/facilityMaintenance";
	}
	@PostMapping("insertFacilityMaintenance")
	public String insertFacilityMaintenance(FacilityMaintenanceVO mtnVO) {
		facilityService.insertFacilityMaintenance(mtnVO);
		return "redirect:facilityMaintenance";
	}
	@GetMapping("facilityOperation")
	public String facilityOperation(Model model) {
		model.addAttribute("opStatList",facilityService.facilityOperationStat());
		model.addAttribute("opList",facilityService.selectFacilityOperation());
		model.addAttribute("dwnList",facilityService.getFacilityDownCode());
		return "facility/facilityOperation";
	}
	
	@PostMapping("insertFacilityAbortOpertation")
	public String insertFacilityAbortOpertation(FacilityOperationVO oprVO) {
		facilityService.insertFacilityAbortOpertation(oprVO);
		return "redirect:facilityOperation";
		
	}
	
	@PostMapping("insertFacilityRestartOpertation")
	public String insertFacilityRestartOpertation(FacilityOperationVO oprVO) {
		facilityService.insertFacilityRestartOpertation(oprVO);
		return "redirect:facilityOperation";
		
	}
}
