package com.yedam.mes.process.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.OrderPlanVO;
import com.yedam.mes.process.vo.ProcPlanVO;

@Controller
public class ProcessController {
	
	@Autowired
	ProcService procService;
	
	// 생산관리 -> 생산계획관리 -> 페이지
	@GetMapping("ProcManagement")
	public String ProcessPlanManagement() {
		return "process/processManagement";
	}
	
	// 생산관리 -> 생산계획관리 -> 주문서버튼 클릭시 주문서정보 받아옴
	@GetMapping("getOrder")
	@ResponseBody
	public Map<String, Object> getOrderSheet(OrderPlanVO opVO) {
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", procService.getOrder());
	    resultMap.put("order", procService.getCprCd(opVO));
	    
		return resultMap;
	}
	
	// 생산관리 -> 생산계획관리 -> 주문서 정보 받아오기
	@PostMapping("getOrderDetail")
	@ResponseBody
	public List<OrderPlanVO> getOrderSheetDetail(OrderPlanVO opVO) {
		return procService.getOrderDetail(opVO);
	}
	
	@PostMapping("getDownOrders")
	@ResponseBody
	public List<OrderPlanVO> getDownOrders(@RequestBody OrderPlanVO opVO) {
		String[] orshNo = opVO.getOrshNo().split(",");
		String[] caNm = opVO.getCaNm().split(",");
		System.out.println(orshNo);
		System.out.println(caNm);
		
		return procService.addPlanbefore(orshNo, caNm);
	}
	
	// 생산관리 -> 생산계획 -> 생산계획코드, 생산계획상세코드
	@GetMapping("getProcPlanCode")
	@ResponseBody
	public Map<String, Object> getProcPlanCode() {
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("prplCd", procService.getPlanCode());
	    resultMap.put("prpldCd", procService.getPlanDetailCode());
	    
		return resultMap;
	}
	
	// 생산관리 -> 생산계획 -> 계획등록
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
	
	// 생산관리 -> 생산계획 -> BOM 자재 정보
	@GetMapping("getBomInfo")
	@ResponseBody
	public Map<String, Object> getBomInfo(OrderPlanVO opVO) {
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("bomInfo", procService.getBomMtrl(opVO));
	    
		return resultMap;
	}
	// 생산관리 -> 생산지시관리 -> 페이지
	@GetMapping("ProcOrder")
	public String ProcOrderManagement() {
		return "process/processOrder";
	}
	
	@PostMapping("ProcPlanOrder")
	@ResponseBody
	public List<ProcPlanVO> getProcPlanOrder(ProcPlanVO ppVO){
		return procService.getPlan(ppVO);
	}
	
	@PostMapping("cprSearch")
	@ResponseBody
	public List<ProcPlanVO> planCprSearch(ProcPlanVO ppVO){
		return procService.searchPlanList(ppVO);
	}
	
	
	// 생산관리 -> 생산공정관리
	@GetMapping("ProdProcManagement")
	public String ProdProcManagement() {
		return "process/prodProcManage";
	}
}
