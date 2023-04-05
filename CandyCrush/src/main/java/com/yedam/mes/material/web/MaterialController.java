package com.yedam.mes.material.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.mes.material.service.MaterialService;

@Controller
public class MaterialController {
	@Autowired
	MaterialService service;
	
	//자재발주관리 페이지
	@GetMapping("mtrlOrder")
	public String mtrlOrder(Model model) {
		model.addAttribute("material",service.mtrlAllList());
		model.addAttribute("materialOrder",service.mtrlOrderAllList());
	
		return "material/materialOrders";
	}
	
	//자재발주조회 페이지
	@GetMapping("mtrlOrderList")
	public String mtrlOrderList(Model model) {
		model.addAttribute("moList", service.mtrlAllList());
		
		return "material/materialOrderList";
	}
	
	//자재입고검사조회 페이지
	@GetMapping("mtrlInspCheck")
	public String mtrlInsp(Model model) {
		//model.addAttribute("materialInsp", );
		return "material/mtrlInspCheck";
	}
	
	//자재입고검사관리(품질로빼버리기) 페이지
	@GetMapping("mtrlInspManagement")
	public String mtrlInspManagement(Model model) {
		return "material/mtrlInspManagement";
	}
	
	//자재입고관리 페이지
	@GetMapping("mtrlInputManagement")
	public String mtrlInputManagement(Model model) {
		return "material/mtrlInputManagement";
	}
	
	//자재출고관리 페이지
	@GetMapping("mtrlOutputManagement")
	public String mtrlOutputManagement(Model model) {
		return "material/mtrlOutputManagement";
	}
}
