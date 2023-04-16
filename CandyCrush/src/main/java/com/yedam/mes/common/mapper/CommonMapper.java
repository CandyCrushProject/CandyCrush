package com.yedam.mes.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.common.service.vo.BomVO;

public interface CommonMapper {
	//제품전체리스트
	public List<BomVO> prodAllList(@Param("cprCd") String cprCd, @Param("cprNm") String cprNm);
	
	//BOM전체리스트
	public List<BomVO> prodBomList(@Param("cprNm") String cprNm);
	
	//BOM디테일리스트
	public List<BomVO> prodBomDetailList(@Param("cprNm") String cprNm);
}
