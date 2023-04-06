package com.yedam.mes.process.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.OrderPlanVO;

@Controller
public class ProcessController {
	
	@Autowired
	ProcService procService;
	
	// 생산관리 -> 생산계획관리
	@GetMapping("ProcManagement")
	public String ProcessPlanManagement(Model model) {

		model.addAttribute("orderInfo", procService.getOrder());
		return "process/processManagement";
	}
	
	@PostMapping("getOrder")	
	public String getOrder(OrderPlanVO opVO, Model model) {		
		System.out.println("opVO = "+ opVO);
		OrderPlanVO odpVO = procService.getOneOrder(opVO);
		System.out.println("odpVO = "+ odpVO);
		
		model.addAttribute("opInfo", odpVO);
		return "process/processManagement";
	}
	
	// 생산관리 -> 생산지시관리
	@GetMapping("ProcOrder")
	public String ProcOrderManagement() {
		return "process/processOrder";
	}
	
	// 생산관리 -> 생산공정관리
	@GetMapping("ProdProcManagement")
	public String ProdProcManagement() {
		return "process/prodProcManage";
	}
}
