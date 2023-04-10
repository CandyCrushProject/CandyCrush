package com.yedam.mes.sales.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.sales.service.vo.OrdrAccntVO;
import com.yedam.mes.sales.service.vo.OrdrShtVO;

public interface OrdrShtMapper {
	
	// 전체조회
	public List<OrdrShtVO> ordrShtAllList();

	// 검색조회(업체명, 날짜검색)
	public List<OrdrShtVO> ordrShtSrchList(@Param("caNm") String caNm,
										   @Param("orshStrDt") String orshStrDt,
										   @Param("orshEndDt") String orshEndDt);
	
	// 모달창 업체 전체조회
	public List<OrdrAccntVO> accoutnAllList();
	
	// 모달창 업체 검색조회
	public List<OrdrAccntVO> accoutnSrchList(@Param("caNm") String caNm, @Param("caNo") String caNo);

}
