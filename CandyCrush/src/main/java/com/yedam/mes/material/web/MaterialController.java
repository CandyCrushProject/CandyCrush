package com.yedam.mes.material.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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
		model.addAttribute("accountList", service.accountCheck());
		//model.addAttribute("getmtrlOrderCode", service.getMtrlOrderCode());
		return "material/materialOrders";
	};
	
	//자재발주관리/자재검색기능
	@PostMapping("mtrlSearch")
	@ResponseBody
	public List<MaterialVO> mtrlSearch(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String cmmNm){
		return service.mtrlSearch(caNm, cmmNm);
	};
	
	//자재발주관리/모달/업체검색
	@PostMapping("accountCheck")
	@ResponseBody
	public List<MtrlAccountVO> accountCheck(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String caNo){
		return service.accountCheckModal(caNm, caNo);
	};
	
	//자재발주관리/자재목록 -> 자재발주로 List 뿌리기
	/*@PostMapping("mtrlOrderOneCheck")
	@ResponseBody
	public List<MaterialOrderVO> mtrlOrderOneCheck(@Param("cmmCd") String cmmCd){
		return service.mtrlOrderOneCheck(cmmCd);
	};*/
	
	//자재발주관리/자재발주 헤더와 디테일에 데이터 등록
	@PostMapping("mtrlOrder")
	@ResponseBody
	public Boolean orderInsertProcess(@RequestBody List<MaterialOrderVO> vo){
		//System.out.println(vo.get(0).getMoCd()); --> 배열 중 첫번째 object에 moCd 값을 print
		
		//vo 인스턴스 선언
		MaterialOrderVO newVo = new MaterialOrderVO();
		newVo.setMoTitle(vo.get(0).getMoTitle()				// moTitle 값을 가져와서 db에 전달
						 + " 외 " + (vo.size() - 1)			//  ㄴ 예시) 딸기향료 외 3건
						 + "건" );
		newVo.setMoReoDt(vo.get(0).getMoReoDt());			// moReoDt 값을 가져와서 db에 전달
		//System.out.println(newVo.getMoCd() + ", " + newVo.getMoTitle() + ", " + newVo.getMoReoDt());
		Boolean response = true;
		int result = service.orderInsert(newVo, vo); 		//발주관리헤더, 발주관리디테일
		if(result < 1) {
			response = false;
		};
		
		return response;
	};

	//발주번호 기반으로 헤더와 디테일의 데이터를 동시에 지운다
	@PostMapping("delOrder")
	@ResponseBody
	public int delOrder(@RequestParam String delMocd) {
		return service.orderDelete(delMocd);
	}
	
	//발주상세코드를 기반으로 디테일 데이터를 지운다
	@PostMapping("delOrderDetail")
	@ResponseBody
	public int delOrderDetail(MaterialOrderVO vo) {
		String moCd = vo.getMoCd();					//발주번호
		String[] modCd = vo.getModCd().split(",");	//발주상세번호
		
		//결과를 담고 리털할 값
		int result = 0;
		
		//VO인스턴스 선언
		MaterialOrderVO mtrl = new MaterialOrderVO(); 
		
		for(int i = 0 ; i < modCd.length ; i++) {
			mtrl.setMoCd(moCd);
			mtrl.setModCd(modCd[i]);
			
			result = service.orderDetailDelete(mtrl);
		}
		
		return result;
	}
	
	//------------------------------------------------------------------------
	
	//자재발주조회 페이지
	@GetMapping("mtrlOrderList")
	public String mtrlOrderList(Model model) {
		model.addAttribute("accountList", service.accountCheck());
		return "material/materialOrderList";
	};
	
	//자재발주조회 / 업체명 또는 발주신청일 시작일자~종료일자 검색
	@PostMapping("mtrlOrderDateSearch")
	@ResponseBody
	public List<MaterialOrderVO> mtrlOrderDateSearch(@RequestParam(required = false) String caNm, @RequestParam(required = false) String start, @RequestParam(required = false) String end) {
		return service.mtrlOrderDateSearch(caNm, start, end);
	};
	
	//자재발주조회 / 발주코드 더블클릭하면 해당되는 발주코드에 대한 상세정보를 Modal로 띄어준다 
	@PostMapping("mtrlOrderDetailList")
	@ResponseBody
	public List<MaterialOrderVO> mtrlOrderDetailList(@Param("moCd") String moCd){
		return service.mtrlOrderDetailList(moCd);
	};
	
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
	};
	
	//------------------------------------------------------------------------
	@PostMapping("test")
	@ResponseBody
	public List<MaterialInputVO> test() {
		
		return service.mtrlInputList7Days();
	}
	
	//자재입고관리 페이지, 자재입고목록(7일이내)
	@GetMapping("mtrlInputManagement")
	public String mtrlInputManagement(Model model) {
		model.addAttribute("accountList", service.accountCheck());
		model.addAttribute("inpuerList7Days", service.mtrlInputList7Days());
		return "material/mtrlInputManagement";
	};
	
	//자재입고관리/자재입고검사 정보가져오기
	@PostMapping("mtrlInputGetList")
	@ResponseBody
	public List<MaterialInputVO> mtrlInputGetList(@RequestParam(required = false) String caNm, @RequestParam(required = false) String start, @RequestParam(required = false) String end){
		return service.mtrlInputGetList(caNm, start, end);
	};
	
	//자재입고관리/입고코드를 기반으로 단건조회
	@PostMapping("mtrlInputDeateilList")
	@ResponseBody
	public List<MaterialInputVO> mtrlInputDeateilList(@Param("minCd") String minCd){
		return service.mtrlInputDetailList(minCd);
	};
	
	//자재입고관리/등록
	@PostMapping("mtrlInputInsert")
	@ResponseBody
	public Boolean mtrlInputInsert(@RequestBody List<MaterialInputVO> vo){
		//MaterialInputVO newVO = new MaterialInputVO();
		MaterialInputVO newVO = new MaterialInputVO();
		Boolean response = true;
		int result = service.mtrlInputALLInsert(vo);
		
		newVO.setMoCd(vo.get(0).getMoCd());
		int result2 = service.mtrlMoSttUpdate(newVO);		//상태업데이트
		
		System.out.println("result = " + result);
		if(result < 1 && result2 < 1) {
			response = false;
		};
		
		return response;
	};
	
	//------------------------------------------------------------------------
	
	//자재입고검사조회 페이지
	@GetMapping("mtrlInspCheck")
	public String mtrlInsp(Model model) {
		return "material/mtrlInspCheck";
	};
	
	//------------------------------------------------------------------------
	
	//자재재고조회페이지
	@GetMapping("mtrlCnt")
	public String mtrlCnt(Model model) {
		model.addAttribute("accountList", service.accountCheck());
		return "material/mtrlCnt";
	};
	
	//자재재고조회 / 검색기능 및 조회
	@PostMapping("mtrlChk")
	@ResponseBody
	public List<MaterialVO> mtrlChk(@RequestParam(required = false)  String cmmNm, @RequestParam(required = false) String caNm) {
		return service.mtrlSearch(caNm, cmmNm);
	};
	
	//------------------------------------------------------------------------
	
	//자재입고검사관리(품질로빼버리기) 페이지
	@GetMapping("mtrlInspManagement")
	public String mtrlInspManagement(Model model) {
		return "material/mtrlInspManagement";
	};
	
	//--------------------------------------------------------------------------
	
	//자재출고관리 페이지
	@GetMapping("mtrlOutputManagement")
	public String mtrlOutputManagement(Model model) {
		return "material/mtrlOutputManagement";
	};
	
	@PostMapping("mtrlOutList")
	@ResponseBody
	public List<MaterialVO> mtrlOutList(){
		return service.mtrlOutList();
	};
	
	@PostMapping("mtrlOut7DayList")
	@ResponseBody
	public List<MaterialVO> mtrlOut7DayList(){
		return service.mtrlOut7DayList();
	};
	
	@PostMapping("mtrlOutDetail")
	@ResponseBody
	public List<MaterialVO> mtrlOutDetail(@RequestParam("motDt") String motDt, @RequestParam("motTyp") String motTyp, @RequestParam("motNote") String motNote){
		return service.mtrlOutDetailList(motDt, motTyp, motNote);
	};
	
	//자재출고 등록
	@PostMapping("mtrlOutInsert")
	@ResponseBody
	public Boolean mtrlOutInsert(@RequestBody List<MaterialVO> vo) {
		Boolean response = true;
		
		int result = service.mtrlOutInsert(vo);
		System.out.println("result : " + result);
		
		if(result < 1) {
			response = false;
		}
		
		return response;
	};
	
}
