package com.yedam.mes.sales.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.material.service.MaterialInputVO;
import com.yedam.mes.sales.service.OrdrShtService;
import com.yedam.mes.sales.service.vo.OrdrShtVO;
import com.yedam.mes.sales.service.vo.ProdInOutPutVO;

import oracle.jdbc.proxy.annotation.Post;

@Controller
public class OrdrShtController {

	@Autowired
	OrdrShtService service;

	// 주문서관리 페이지 리턴
	@GetMapping("ordrMngntPage")
	public String ordrMngntPage(Model model) {

		return "sales/ordrShtMngmnt";
	}

	// 거래처 검색조회
	@PostMapping("ordrAccntSrch")
	@ResponseBody
	public List<OrdrShtVO> accoutnSrchList(@RequestParam(required = false) String caNm,
			@RequestParam(required = false) String caNo) {

		System.out.println("caNm" + caNm + ", caNo" + caNo);
		return service.accoutnSrchList(caNm, caNo);
	}

	// 주문서관리페이지 주문서 리스트 조회
	@PostMapping("ordrMngntOrdrShtList")
	@ResponseBody
	public List<OrdrShtVO> ordrShtAllList() {

		return service.ordrShtAllList();
	}

	// 주문서관리페이지 거래처 리스트 조회
	@PostMapping("ordrMngntAccntList")
	@ResponseBody
	public List<OrdrShtVO> ordrMngntAccntList() {

		return service.accoutnAllList();
	}

	// 주문서관리페이지 거래처 검색조회
	@PostMapping("ordrMngntAccntSrch")
	@ResponseBody
	public List<OrdrShtVO> ordrMngntAccntSrch(@RequestParam(required = false) String caNm,
			@RequestParam(required = false) String caNo) {

		System.out.println("caNm" + caNm + ", caNo" + caNo);
		return service.accoutnSrchList(caNm, caNo);
	}

	// 주문서관리페이지 거래처 검색하면 검색한 거래처에 해당하는 주문서 보여줌
	@PostMapping("ordrShtMngnSrch")
	@ResponseBody
	public List<OrdrShtVO> ordrShtMngnSrch(@RequestParam(required = false) String caNm) {

		return service.ordrShtMngnSrch(caNm);
	}

	// 제품을 추가할 때 모달창에 미리 보여줄 주문서디테일 번호
	@GetMapping("getOrdrShtDtlCode")
	@ResponseBody
	public OrdrShtVO getOrdrShtDtlCode() {
		OrdrShtVO vo = new OrdrShtVO();
		vo.setOrdrDtlCd(service.getOrdrShtDtlCode());
		return vo;
	}

	// 주문서관리 페이지 주문서 제품등록 상품 리스트
	@GetMapping("getProdList")
	@ResponseBody
	public List<OrdrShtVO> getProdList() {
		// System.out.println("상품리스트 : " + service.getProdList());
		return service.getProdList();
	}

	// 주문서관리 페이지 주문서 등록
	@SuppressWarnings("unchecked")
	@PostMapping("ordrShtForm")
	@ResponseBody
	public Map<String, Object> ordrShtInsertProcess(@RequestBody Map<String, Object> map) {

		Map<String, Object> headerMap = new HashMap<>();

		// 주문서 등록
		List<Map<String, Object>> detailList = new ArrayList<Map<String, Object>>();
		detailList = (List<Map<String, Object>>) map.get("data");
		headerMap = (Map<String, Object>) map.get("dataHd");

		// 주문서 수정
		List<Map<String, Object>> updateList = new ArrayList<Map<String, Object>>();
		updateList = (List<Map<String, Object>>) map.get("updateRows");

		// 주문서 삭제
		List<Map<String, Object>> deleteList = new ArrayList<Map<String, Object>>();
		deleteList = (List<Map<String, Object>>) map.get("deleteRows");

		service.insertOrdrSht(headerMap, detailList, updateList, deleteList);

		return map;
	}

	// 주문서관리페이지 주문서 상세조회리스트 모달창
	@GetMapping("getOrdrShtDtlList")
	@ResponseBody
	public List<OrdrShtVO> getOrdrShtDtlList(@RequestParam(required = false) String orshNo) {

		return service.getOrdrShtDtlList(orshNo);
	}
	
//==================================================================================================================================
	// 제품입고 관리페이지(페이지 리턴)
	@GetMapping("prodInputMngmnt")
	public String prodInputMngmnt() {

		return "sales/prodInputMngmnt";
	}
	
	// 제품입고관리 페이지 입고대기 리스트
	@GetMapping("prodInputListPage")
	@ResponseBody
	public List<ProdInOutPutVO> prodInputListPage() {
		
		return service.prodInputListPage();
	}
	
	// 제품입고관리 거래처 검색조회
	@PostMapping("prodInputSrchList")
	@ResponseBody
	public List<ProdInOutPutVO> prodInputSrchList(@RequestParam(required = false) String cprNm) {

		System.out.println("caNm" + cprNm);
		return service.prodInputSrchList(cprNm);
	}
	
	// 제품입고관리 멤버리스트
	@GetMapping("getMemberList")
	@ResponseBody
	public List<OrdrShtVO> getMemberList() {
		return service.getMemberList();
	}
	
	// 제품입고관리 입고등록
	@PostMapping("prodWaitingListInsert")
	@ResponseBody
	public Boolean prodWaitingListInsert(@RequestBody List<ProdInOutPutVO> list){
		//MaterialInputVO newVO = new MaterialInputVO();
		Boolean response = true;
		int result = service.prodWaitingListInsert(list);
		
		System.out.println("result = " + result);
		
		if(result > 0) {
			response = false;
		};
		
		return response;
	};
	
	// 제품입고관리 입고된 제품 리스트
	@GetMapping("prodInputList")
	@ResponseBody
	public List<ProdInOutPutVO> prodInputList() {
		return service.prodInputList();
	}
	
	// 제품입고관리 입고처리된 제품 리스트 날짜별 검색조회
	@PostMapping("prodInputListSrchDt")
	@ResponseBody
	public List<ProdInOutPutVO> prodInputListSrchDt(@RequestParam(required = false) String pinDt) {
		return service.prodInputListSrchDt(pinDt);
	}
	
//==================================================================================================================================
	// 출고관리 페이지 리턴
	@GetMapping("outputMngntPage")
	public String outputMngntPage() {

		return "sales/prodOutputMngmnt";
	}
	
	// 제품출고페이지 주문서조회
	@GetMapping("OutputOrdrShtList")
	@ResponseBody
	public List<ProdInOutPutVO> OutputOrdrShtList() {
		
		return service.OutputOrdrShtList();
	}
	
	// 제품출고 주문서 거래처 검색 조회
	@PostMapping("OutputOrdrShtSrchList")
	@ResponseBody
	public List<ProdInOutPutVO> OutputOrdrShtSrchList(@RequestParam(required = false) String caNm) {
		
		return service.OutputOrdrShtSrchList(caNm);
	}
	
	// 제품출고 주문서 디테일 조회
	@PostMapping("OutputOrdrShtDtlList")
	@ResponseBody
	public List<ProdInOutPutVO> OutputOrdrShtDtlList(@RequestParam(required = false) String orshNo) {
		
		return service.OutputOrdrShtDtlList(orshNo);
	}
	
	// 주문서에 제품명 재고 찾을때
	@PostMapping("cprCdSetFind")
	@ResponseBody
	public List<ProdInOutPutVO> cprCdSetFindProcess(@RequestBody ProdInOutPutVO pipVO){
		String[] cprCdSet = pipVO.getCprCd().split(",");
		
		return service.cprCdSetFind(cprCdSet);
	}
	
}