package com.yedam.mes.process.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.BomInfoVO;
import com.yedam.mes.process.vo.OrderPlanVO;
import com.yedam.mes.process.vo.ProcPlanVO;
import com.yedam.mes.process.vo.ProcResultAllVO;

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
	
	// 생산관리 -> 생산계획 -> 계획등록후 주문서 상태 변경
	@PostMapping("orderUpdate")
	@ResponseBody
	public Map<String, Object> orderUpdate(@RequestBody Map<String, Object> list){

		String orshNoList = (String) list.get("orshNo");
		
		String[] orshNo = orshNoList.split(",");
		
		
		Map<String, Object> message = new HashMap<>();
		int update = procService.updateOrderStatus(orshNo);
		if(update < 1) {
			message.put("retCode","실패");
			
		} else {
			message.put("retCode","성공");
		} 

		
		return message;
	}
	
	// 생산관리 -> 생산계획 -> 계획등록
	@PostMapping("insertProcPlan")
	@ResponseBody
	public Map<String, Object> insertProcPlan(@RequestBody List<ProcPlanVO> insertList, RedirectAttributes rrtt) {

		
		Map<String, Object> message = new HashMap<>();
		
		int insertPlan = procService.addPlan(insertList.get(0));
		int insertPlanDetail = procService.addPlanDetail(insertList);
		
		if(insertPlan < 1 && insertPlanDetail < 1) {
			message.put("retCode","실패");
			
		} else {
			message.put("retCode","성공");
		} 

		
		return message;
	}
	
	
	
	
	// 생산관리 -> 생산지시관리 -> 페이지
	@GetMapping("ProcOrder")
	public String ProcOrderManagement() {
		return "process/processOrder";
	}
	

	@PostMapping("ProcPlanOrderDetail")
	@ResponseBody
	public List<ProcPlanVO> procPlanOrderDetail(@RequestBody ProcPlanVO ppVO){
		return procService.searchPlanList(ppVO);
	}
	
	@GetMapping("ProcPlanOrder")
	@ResponseBody
	public List<ProcPlanVO> getProcPlanOrder(){
		return procService.getPlan();
	}
	
	@PostMapping("getBomInfo")
	@ResponseBody
	public List<BomInfoVO> getBomInfoProcess(@RequestBody OrderPlanVO opVO){
		System.out.println(procService.getBom(opVO));
		return procService.getBom(opVO);
	}
	
	
	@PostMapping("getMtrlInput")
	@ResponseBody
	public Map<String, Object> getMtrlInput(@RequestBody BomInfoVO biVO){
		Map<String, Object> mtrlMap = new HashMap<>();
		
		mtrlMap.put("mtrlMap", procService.selectMtrlInput(biVO));
		
		return mtrlMap;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 생산관리 -> 생산공정관리
	@GetMapping("ProdProcManagement")
	public String ProdProcManagement() {
		return "process/prodProcManage";
	}
	
	//생산실적관리 (영주 작업중~~)===살=려=줘=왜=나=만=엉=엉=엉=멘=탈=나=간=거=같=에=나=죽=어=내=가=무=슨=부=귀=영=화=를=누=리=려=고=이=런=걸=해=!=! (영주 자살중~~)
	@GetMapping("ProcResult")
	public String ProcResult() {
		return "process/prodProcResult";
	}
	
	@GetMapping("getProcCommand")
	@ResponseBody
	public List<ProcResultAllVO> getProcCommand(){
		return procService.getProcCommand();
	}
	
	@PostMapping("getProc")
	@ResponseBody
	public List<ProcResultAllVO> getProcProg(@RequestParam String prcmCd) {
		return procService.getProc(prcmCd);
	}
	

	@PostMapping("getProcFac")
	@ResponseBody
	public List<ProcResultAllVO> getProcFac(@RequestParam("prcmPrcd") String prcmPrcd){
		return procService.getProcFac(prcmPrcd);
	}
	
	@GetMapping("getProcProg")
	@ResponseBody
	public List<ProcResultAllVO> getProcProg(){
		return procService.getProcProg();
	}
	
	@PostMapping("startProg")
	@ResponseBody
	public int startProg(ProcResultAllVO startVO) {
		return procService.startProg(startVO);
	}
}
