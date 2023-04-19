package com.yedam.mes.sales.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.sales.mapper.OrdrShtMapper;
import com.yedam.mes.sales.service.OrdrShtService;
import com.yedam.mes.sales.service.vo.OrdrShtVO;
import com.yedam.mes.sales.service.vo.ProdInOutPutVO;

@Service
public class OrdrShtServiceImpl implements OrdrShtService{

	@Autowired
	OrdrShtMapper mapper;

	// 주문서 전체조회
	@Override
	public List<OrdrShtVO> ordrShtAllList() {
		
		return mapper.ordrShtAllList();
	}

	// 주문서 검색조회
	@Override
	public List<OrdrShtVO> ordrShtSrchList(String caNm, String orshStrDt, String orshEndDt) {
		
		return mapper.ordrShtSrchList(caNm, orshStrDt, orshEndDt);
	}
	
	// 모달창 거래처 전체조회
	@Override
	public List<OrdrShtVO> accoutnAllList() {
		
		return mapper.accoutnAllList();
	}

	// 모달창 거래처 검색조회
	@Override
	public List<OrdrShtVO> accoutnSrchList(@Param("caNm") String caNm, @Param("caNo") String caNo) {
		
		return mapper.accoutnSrchList(caNm, caNo);
	}
	
	// 주문서관리페이지 거래처 검색하면 검색한 거래처에 해당하는 주문서 보여줌
	@Override
	public List<OrdrShtVO> ordrShtMngnSrch(String caNm) {
		
		return mapper.ordrShtMngnSrch(caNm);
	}

	// 주문서코드 자동생성
//	@Override
//	public List<OrdrShtVO> getOrdrShtCode() {
//		
//		return mapper.getOrdrShtCode();
//	}

	// 주문서디테일코드 자동생성
	@Override
	public String getOrdrShtDtlCode() {
		
		return mapper.getOrdrShtDtlCode();
	}

	// 주문서 등록 모달창 상품 리스트
	@Override
	public List<OrdrShtVO> getProdList() {
		
		return mapper.getProdList();
	}
	
	// 모달창 주문서헤더 + 주문서디테일 등록 + 수정 + 삭제
	@Override
	public int insertOrdrSht(Map<String,Object> map, List<Map<String,Object>> list, List<Map<String,Object>> list2, List<Map<String,Object>> list3) {
		int cnt = 0;
		String ordrShtCode = null;
		// 주문번호 때문
		if(!list.isEmpty()) {
			ordrShtCode = mapper.getOrdrShtCode();
			map.put("orshNo", ordrShtCode);
			
			// 주문서 헤더 등록 (한건)	
			cnt = mapper.insertOrdrShtHdr(map); //delete
		}

		
		// 주문서 디테일 등록(여러건)
		for(Map<String,Object> ordrShtMap : list) {
			ordrShtMap.put("orshNo", ordrShtCode);
			cnt += mapper.insertOrdrShtDtl(ordrShtMap);
		}
		
		// 주문서 디테일 수정(여러건)
		for(Map<String,Object> ordrShtMap : list2) {
			//ordrShtMap.put("orshNo", ordrShtCode);
			cnt += mapper.updateOrdrShtDtl(ordrShtMap);
		}
		
		// 주문서 디테일 삭제(여러건)
		for(Map<String,Object> ordrShtMap : list3) {
			//ordrShtMap.put("orshNo", ordrShtCode);
			cnt += mapper.deleteOrdrShtDtl(ordrShtMap);
		}
		
		return cnt;
	}
	
	// 주문서관리페이지 주문서 목록 상세조회 모달창
	public List<OrdrShtVO> getOrdrShtDtlList(String orshNo) {
		
		return mapper.getOrdrShtDtlList(orshNo);
		
	}
	
	// 주문서 삭제
	// 주문서에 해당하는 모든 디테일 날려
	// cnt = mapper.deletehdOrdrShtHdr(map); // 헤더랑 디테일 딜리트 두개 조건이 주문서 번호
	
	// 주문서목록 조회 그리드에서 삭제하기
	@Override
	public int deleteOrdrShtDtl(List<OrdrShtVO> vo) {
//i		int cnt = 0;
//		
//		// 주문번호 때문
//		String ordrShtCode = vo.addAll("orstNo", vo.);
//		map.put("orshNo", ordrShtCode);
//		
//		// 주문서 헤더 등록 (한건)	
//		cnt = mapper.insertOrdrShtHdr(map); //delete
//		
//		// 주문서 디테일 등록(여러건)
//		for(List<OrdrShtVO> ordrShtList : vo) {
//			ordrShtMap.put("orshNo", ordrShtCode);
//			cnt += mapper.insertOrdrShtDtl(ordrShtMap);
//		}
		return 0;
	}
	
	@Override
	public int deleteOrdrShtHd() {
		
		return 0;
	}
	
	//----------------------------------------------------------------------------------------------------
	// 제품입고관리 페이지 입고대기 리스트
	@Override
	public List<ProdInOutPutVO> prodInputListPage() {
		
		return mapper.prodInputListPage();
	}

	// 주문서관리페이지 거래처 검색조회
	@Override
	public List<ProdInOutPutVO> prodInputSrchList(String cprNm) {
		
		return mapper.prodInputSrchList(cprNm);
	}

	// 제품입고관리 제품 등록
	@Override
	public int prodWaitingListInsert(List<ProdInOutPutVO> list) {
		// 주문서 디테일 등록(여러건)
		int cnt = 0;
		
		for(ProdInOutPutVO vo : list) {
			
			cnt += mapper.prodWaitingListInsert(vo);
		}
		
		return cnt;
	}

	// 제품입고관리 멤버리스트
	@Override
	public List<OrdrShtVO> getMemberList() {
		
		return mapper.getMemberList();
	}

	// 제품입고관리 입고된 제품 리스트
	@Override
	public List<ProdInOutPutVO> prodInputList() {
		
		return mapper.prodInputList();
	}
	
	// 제품입고관리 입고처리된 제품 리스트 날짜별 검색조회
	@Override
	public List<ProdInOutPutVO> prodInputListSrchDt(String pinDt) {
		
		return mapper.prodInputListSrchDt(pinDt);
	}

	// 제품출고페이지 주문서조회
	@Override
	public List<ProdInOutPutVO> OutputOrdrShtList() {
		
		return mapper.OutputOrdrShtList();
	}

	// 제품출고 주문서 디테일 조회
	@Override
	public List<ProdInOutPutVO> OutputOrdrShtDtlList(String orshNo) {
		
		return mapper.OutputOrdrShtDtlList(orshNo);
	}

	@Override
	public List<ProdInOutPutVO> cprCdSetFind(String[] cprCd) {
		return mapper.cprCdSetFind(cprCd);
	}
	
	

	

}
