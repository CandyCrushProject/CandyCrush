package com.yedam.mes.process.web;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.ProcPlanVO;

@Controller
public class ProcessController {
	
	@Autowired
	ProcService procService;
	
	// 생산관리 -> 생산계획관리
	@GetMapping("ProcManagement")
	public String ProcessPlanManagement() {
		return "process/processManagement";
	}
	
	
	@GetMapping("getOrder")
	@ResponseBody
	public Map<String, Object> getOrderSheet() {
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", procService.getOrder());
	    resultMap.put("prplCd", procService.getPlanCode());
	    
		return resultMap;
	}
	@PostMapping("insertProcPlan")
	public String insertProcPlan(ProcPlanVO ppVO, RedirectAttributes rrtt) {
		int result = procService.addPlan(ppVO);
		int result2 = procService.addPlanDetail(ppVO);
		String message = null;
		if(result == 1 && result2 == 1) {
			message = "등록에 성공했습니다.";
		} else {
			message = "등록에 실패했습니다.";
		} 
		rrtt.addFlashAttribute("message",message);
		return "redirect:ProcManagement";
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
