package com.yedam.mes.process.web;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.OrderPlanVO;
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
	    
		return resultMap;
	}
	
	@GetMapping("getOrderList")
	@ResponseBody
	public Map<String, Object> getOrderSheetList(OrderPlanVO opVO) {
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", procService.getOrderList(opVO));
	    
		return resultMap;
	}
	
	@GetMapping("getProcPlanCode")
	@ResponseBody
	public Map<String, Object> getProcPlanCode() {
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("prplCd", procService.getPlanCode());
	    resultMap.put("prpldCd", procService.getPlanDetailCode());
	    
		return resultMap;
	}
	@PostMapping("insertProcPlan")
	public String insertProcPlan(ProcPlanVO ppVO, OrderPlanVO opVO, RedirectAttributes rrtt) {
		int update = procService.updateOrderStatus(opVO);
		int insert = procService.addPlan(ppVO);
		int insert2 = procService.addPlanDetail(ppVO);
		String message = null;
		if(insert != -1 && insert2 != -1 && update != -1) {
			message = "실패";
		} else {
			message = "성공";
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
