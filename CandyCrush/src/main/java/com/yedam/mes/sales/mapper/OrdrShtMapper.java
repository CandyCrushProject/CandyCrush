package com.yedam.mes.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.sales.service.vo.OrdrShtVO;

public interface OrdrShtMapper {
	
	// 전체조회
	public List<OrdrShtVO> ordrShtAllList();

	// 검색조회(업체명, 날짜검색)
	public List<OrdrShtVO> ordrShtSrchList(@Param("caNm") String caNm,
										   @Param("orshStrDt") String orshStrDt,
										   @Param("orshEndDt") String orshEndDt);
	
	// 모달창 업체 전체조회
	public List<OrdrShtVO> accoutnAllList();
	
	// 모달창 업체 검색조회
	public List<OrdrShtVO> accoutnSrchList(@Param("caNm") String caNm, @Param("caNo") String caNo);

	// 주문서코드 자동생성
	public String getOrdrShtCode();

	// 주문서디테일코드 자동생성
	public String getOrdrShtDtlCode();

	// 주문서 등록 모달창 상품 리스트
	public List<OrdrShtVO> getProdList();
	
	// 모달창 주문서헤더 등록
	public int insertOrdrShtHdr(OrdrShtVO vo);
	// 모달창 주문서디테일 등록
	public int insertOrdrShtDtl(OrdrShtVO vo);

}
