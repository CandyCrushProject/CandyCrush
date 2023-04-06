//package com.yedam.spring.production.web;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import com.yedam.spring.common.Criteria;
//import com.yedam.spring.common.PageDTO;
//import com.yedam.spring.production.service.BomVO;
//import com.yedam.spring.production.service.ProPlanVO;
//import com.yedam.spring.production.service.ProService;
//
//@Controller
//public class ProController {
//
//	@Autowired
//	ProService proService;
//	//생산계획 페이지 이동`	```````````````````````````````````````````````````
//	@GetMapping("/productionPlan")
//	public String proPlanPage(Criteria cri,Model model) {
//		model.addAttribute("nextPlanCd",proService.getNextPlanCd());
//		model.addAttribute("bomInfo", proService.getBomInfo());
//		int total = proService.getProPlanCnt();
//		model.addAttribute("ProPlans",proService.getProPlans(cri));
//		model.addAttribute("pageMaker",new PageDTO(cri,total));
//		return"production/productionplan";
//	}
//	// 생산계획 등록처리
//	@PostMapping("/newPlanInsert")
//	public String empInsertProc(ProPlanVO vo, RedirectAttributes rrtt) {
//		System.out.println(vo.getOrderCnt());
//		String result = proService.newPlanInsert(vo);
//		String message = null;
//		if(result != null) {
//			message = "등록에 성공했습니다.";
//		} else {
//			message = "등록에 실패했습니다.";
//		} 
//		rrtt.addFlashAttribute("message",message);
//		return "redirect:/productionPlan";
//	}
//	//미지시된 주문서 조회
//	@GetMapping("/getOrderSheet")
//	@ResponseBody
//	public Map<String, Object> getOrderSheet() {
//	    Map<String, Object> resultMap = new HashMap<>();
//	    resultMap.put("result", proService.getOrdSheet());
//		System.out.println(resultMap);
//		return resultMap;
//	}
//	
//	//BOM에 맞는 자재 정보
//	@GetMapping("/getBomRscInfo")
//	@ResponseBody
//	public Map<String, Object> getBomRscInfo(BomVO vo) {
//	    Map<String, Object> resultMap = new HashMap<>();
//	    resultMap.put("BomRscInfo", proService.getBomRscInfo(vo));
//		return resultMap;
//	}
//	
//	//생산계획삭제
//	@PostMapping("/deletePlan")
//	@ResponseBody
//	public String deleteProPlan(@RequestBody List<String> planCdList) {
//		String result = null;
//
//	    for(String planCd : planCdList) {
//	        result = proService.removePlan(planCd);
//	    }
//
//	    return result;
//	}
//
//	
//
//
//}
