package com.yedam.mes.material.web;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.material.service.MaterialInputVO;
import com.yedam.mes.material.service.MaterialOrderVO;
import com.yedam.mes.material.service.MaterialService;
import com.yedam.mes.material.service.MaterialVO;
import com.yedam.mes.material.service.MtrlAccountVO;

@Controller
public class MaterialController {
	@Autowired
	MaterialService service;
	
	
	//자재발주관리 페이지
	@GetMapping("mtrlOrder")
	public String mtrlOrder(Model model) {
		//model.addAttribute("moList", service.mtrlAllList());
		model.addAttribute("accountList", service.accountCheck());
		model.addAttribute("getmtrlOrderCode", service.getMtrlOrderCode());
		return "material/materialOrders";
	}
	
	//자재발주관리/자재검색기능
	@PostMapping("mtrlSearch")
	@ResponseBody
	public List<MaterialVO> mtrlSearch(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String cmmNm){
		return service.mtrlSearch(caNm, cmmNm);
	}
	
	//자재발주관리/모달/업체검색
	@PostMapping("accountCheck")
	@ResponseBody
	public List<MtrlAccountVO> accountCheck(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String caNo){
		return service.accountCheckModal(caNm, caNo);
	}
	
	//자재발주관리/자재목록 -> 자재발주로 List 뿌리기
	@PostMapping("mtrlOrderOneCheck")
	@ResponseBody
	public List<MaterialOrderVO> mtrlOrderOneCheck(@Param("cmmCd") String cmmCd){
		return service.mtrlOrderOneCheck(cmmCd);
	}
	
	//자재발주관리/자재발주 헤더와 디테일에 데이터 등록
	@PostMapping("mtrlOrder")
	@ResponseBody
	public Boolean orderInsertProcess(@RequestBody List<MaterialOrderVO> vo){
		//System.out.println(vo.get(0).getMoCd()); --> 배열 중 첫번째 object에 moCd 값을 print
		
		//vo 인스턴스 선언
		MaterialOrderVO newVo = new MaterialOrderVO();
		newVo.setMoCd(vo.get(0).getMoCd());			// moCd 값을 가져와서 db에 전달
		newVo.setMoTitle(vo.get(0).getMoTitle());	// moTitle 값을 가져와서 db에 전달
		newVo.setMoReoDt(vo.get(0).getMoReoDt());	// moReoDt 값을 가져와서 db에 전달
		//System.out.println(newVo.getMoCd() + ", " + newVo.getMoTitle() + ", " + newVo.getMoReoDt());
		
		Boolean response = true;
		int result = service.orderInsert(newVo, vo); 	//발주관리헤더, 발주관리디테일
		if(result < 1) {
			response = false;
		}
		
		return response;
	}
	
	//------------------------------------------------------------------------
	
	//자재발주조회 페이지
	@GetMapping("mtrlOrderList")
	public String mtrlOrderList(Model model) {
		model.addAttribute("accountList", service.accountCheck());
		return "material/materialOrderList";
	}
	
	//자재발주조회 / 업체명 또는 발주신청일 시작일자~종료일자 검색
	@PostMapping("mtrlOrderDateSearch")
	@ResponseBody
	public List<MaterialOrderVO> mtrlOrderDateSearch(@RequestParam(required = false) String caNm, @RequestParam(required = false) String start, @RequestParam(required = false) String end) {
		return service.mtrlOrderDateSearch(caNm, start, end);
	}
	//자재발주조회 / 발주코드 더블클릭하면 해당되는 발주코드에 대한 상세정보를 Modal로 띄어준다 
	@PostMapping("mtrlOrderDetailList")
	@ResponseBody
	public List<MaterialOrderVO> mtrlOrderDetailList(@Param("moCd") String moCd){
		return service.mtrlOrderDetailList(moCd);
	}
	
	@PostMapping("mtrlOrderDetailUpdate")
	@ResponseBody
	public Boolean mtrlOrderDetailUpdate(@RequestParam(required = false) int moCnt, @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") Date moReqDt,
														@RequestParam(required = false) String moCd, @RequestParam(required = false) String cmmCd){
		
		int result = service.orderDetailUpdate(moCnt, moReqDt, moCd, cmmCd);
		Boolean response = true;
		
		if(result < 1) {
			response = false;
		};
		
		return response;
	}
	
	//------------------------------------------------------------------------
	
	//자재입고관리 페이지
	@GetMapping("mtrlInputManagement")
	public String mtrlInputManagement(Model model) {
		model.addAttribute("accountList", service.accountCheck());
		return "material/mtrlInputManagement";
	}
	
	//자재입고관리/자재입고검사 정보가져오기
	@PostMapping("mtrlInputGetList")
	@ResponseBody
	public List<MaterialInputVO> mtrlInputGetList(@RequestParam(required = false) String caNm, @RequestParam(required = false) String start, @RequestParam(required = false) String end){
		return service.mtrlInputGetList(caNm, start, end);
	}
	
	//------------------------------------------------------------------------
	
	//자재입고검사조회 페이지
	@GetMapping("mtrlInspCheck")
	public String mtrlInsp(Model model) {
		return "material/mtrlInspCheck";
	}
	
	//자재입고검사관리(품질로빼버리기) 페이지
	@GetMapping("mtrlInspManagement")
	public String mtrlInspManagement(Model model) {
		return "material/mtrlInspManagement";
	}
	
	
	
	//자재출고관리 페이지
	@GetMapping("mtrlOutputManagement")
	public String mtrlOutputManagement(Model model) {
		return "material/mtrlOutputManagement";
	}
}
