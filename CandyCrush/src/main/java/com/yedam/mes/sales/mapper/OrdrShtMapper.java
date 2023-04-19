package com.yedam.mes.sales.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.sales.service.vo.OrdrShtVO;
import com.yedam.mes.sales.service.vo.ProdInOutPutVO;

public interface OrdrShtMapper {

	// 전체조회
	public List<OrdrShtVO> ordrShtAllList();

	// 검색조회(업체명, 날짜검색)
	public List<OrdrShtVO> ordrShtSrchList(@Param("caNm") String caNm, @Param("orshStrDt") String orshStrDt,
			@Param("orshEndDt") String orshEndDt);

	// 모달창 업체 전체조회
	public List<OrdrShtVO> accoutnAllList();

	// 모달창 업체 검색조회
	public List<OrdrShtVO> accoutnSrchList(@Param("caNm") String caNm, @Param("caNo") String caNo);

	// 주문서관리페이지 거래처 검색하면 검색한 거래처에 해당하는 주문서 보여줌
	public List<OrdrShtVO> ordrShtMngnSrch(@Param("caNm") String caNm);

	// 주문서코드 자동생성
	public String getOrdrShtCode();

	// 주문서디테일코드 자동생성
	public String getOrdrShtDtlCode();

	// 주문서 등록 모달창 상품 리스트
	public List<OrdrShtVO> getProdList();

	// 모달창 주문서헤더 등록
	public int insertOrdrShtHdr(Map<String, Object> map);

	// 모달창 주문서디테일 등록
	public int insertOrdrShtDtl(Map<String, Object> map);

	// 주문서관리페이지 주문서 상세조회리스트 모달창
	public List<OrdrShtVO> getOrdrShtDtlList(String orshNo);

	// 주문서관리 페이지 주문서 수정
	public int updateOrdrShtDtl(Map<String, Object> map);

	// 주문서관리 페이지 주문서 삭제
	public int deleteOrdrShtDtl(Map<String, Object> map);
	
	// 주문서목록 삭제하기(Header와 detail)
	public int deleteOrdrShtHd();
	public int deleteOrdrShtDtl();
		
	// ----------------------------------------------------------------------------------------------------
	// 제품입고관리 페이지 입고대기 리스트
	public List<ProdInOutPutVO> prodInputListPage();

	// 주문서관리페이지 거래처 검색조회
	public List<ProdInOutPutVO> prodInputSrchList(String cprNm);

	// 제품입고관리 제품 등록
	public int prodWaitingListInsert(ProdInOutPutVO vo);

	// 제품입고관리 멤버리스트
	public List<OrdrShtVO> getMemberList();
	
	// 제품입고관리 입고된 제품 리스트
	public List<ProdInOutPutVO> prodInputList();

	// 제품입고관리 입고처리된 제품 리스트 날짜별 검색조회
	public List<ProdInOutPutVO> prodInputListSrchDt(String pinDt);

	// 제품출고페이지 주문서조회
	public List<ProdInOutPutVO> OutputOrdrShtList();
	
	// 제품출고페이지 거래처 검색조회
	public List<ProdInOutPutVO> OutputOrdrShtSrchList(String caNm);

	// 제품출고 주문서 디테일 조회
	public List<ProdInOutPutVO> OutputOrdrShtDtlList(String orshNo);
	
	//주문서에 제품명 재고 찾을때
	public List<ProdInOutPutVO> cprCdSetFind(@Param("cprCd")String[] cprCd);

	
	
}
