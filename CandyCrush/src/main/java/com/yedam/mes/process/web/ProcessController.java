package com.yedam.mes.process.web;


import java.util.ArrayList;
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
	
	// 생산관리 -> 생산계획관리 -> 제품코드, 제품명 가져옴 ^^
	@GetMapping("getProductList")
	@ResponseBody
	public List<OrderPlanVO> getProductList() {
		return procService.getCprCdList();
	}
	
	// 생산관리 -> 생산계획관리 -> 주문서버튼 클릭시 주문서정보 받아옴
	@GetMapping("getOrder")
	@ResponseBody
	public List<OrderPlanVO> getOrderSheet() {
		return procService.getOrder();
	}
	
	
	// 생산관리 -> 생산계획관리 -> 주문서 정보 받아오기
	@PostMapping("getOrderDetail")
	@ResponseBody
	public List<OrderPlanVO> getOrderSheetDetail(OrderPlanVO opVO) {
		return procService.getOrderDetail(opVO);
	}
	
	// 주문상세코드 가져오기
	@PostMapping("getOrdrDtlCd")
	@ResponseBody
	public List<OrderPlanVO> getOrdrDtlCd(@RequestBody Map<String, Object> onn){
		String orshNoList = (String) onn.get("orshNo");

		String[] orshNo = orshNoList.split(",");

		return procService.getOrdrDtlCd(orshNo);
	}
	
	// 생산관리 -> 생산계획관리 -> 미계획주문서 리스트 체크후 추가버튼시 넘어오는 정보 처리
	//					  -> 생산계획코드, 생산계획상세코드
	// db에서 데이터 꺼내오는 역활
	@PostMapping("getDownOrders")
	@ResponseBody
	public Map<String, Object> getDownOrders(@RequestBody Map<String, Object> list) {
		
		String orshNoList = (String) list.get("orshNo");
		
		String[] orshNo = orshNoList.split(",");
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("orderNPlan", procService.addPlanbefore(orshNo));
		resultMap.put("orshNoArr", orshNo);
		return resultMap;
	}
	
	
	// 생산관리 -> 생산계획 -> 계획등록
	@PostMapping("insertProcPlan")
	@ResponseBody
	public Map<String, Object> insertProcPlan(@RequestBody List<ProcPlanVO> insertList, RedirectAttributes rrtt) {

		
		List<ProcPlanVO> planVO = new ArrayList<>();
		Map<String, Object> message = new HashMap<>();
		
		
		for(int i=0;i<insertList.size();i++) {
				planVO.add(insertList.get(i));
			
		}

//		int update = procService.updateOrderStatus(planVO);	
		int insertPlan = procService.addPlan(planVO);
		int insertPlanDetail = procService.addPlanDetail(planVO);
		
//		if(insertPlan < 1 && insertPlanDetail < 1 && update < 1) {
		if(insertPlan < 1 && insertPlanDetail < 1) {
			message.put("retCode","실패");
			
		} else {
			message.put("retCode","성공");
		} 

		
		return message;
	}
	
	// 생산관리 -> 생산계획 -> BOM 자재 정보
	@PostMapping("getBomInfo")
	@ResponseBody
	public Map<String, Object> getBomInfo(@RequestBody OrderPlanVO opVO) {
	    System.out.println(opVO);
		Map<String, Object> resultMap = new HashMap<>();
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
