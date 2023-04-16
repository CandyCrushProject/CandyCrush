package com.yedam.mes.common.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.common.mapper.CommonMapper;
import com.yedam.mes.common.service.CommonService;
import com.yedam.mes.common.service.vo.BomVO;
@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonMapper mapper;

	//제품전체리스트
	@Override
	public List<BomVO> prodAllList(@Param("cprCd") String cprCd, @Param("cprNm") String cprNm) {
		return mapper.prodAllList(cprCd, cprNm);
	}

	//BOM전체리스트
	@Override
	public List<BomVO> prodBomList(@Param("cprNm") String cprNm) {
		return mapper.prodBomList(cprNm);
	}
	
	//BOM디테일리스트
	@Override
	public List<BomVO> prodBomDetailList(@Param("cprNm") String cprNm) {
		return mapper.prodBomDetailList(cprNm);
	}
}
