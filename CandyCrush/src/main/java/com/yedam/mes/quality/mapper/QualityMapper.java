package com.yedam.mes.quality.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.quality.service.vo.MtBadCodeVO;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.MtInspInsertVO;
import com.yedam.mes.quality.service.vo.MtOrderInspStatVO;
import com.yedam.mes.quality.service.vo.ProdInspVO;
import com.yedam.mes.quality.service.vo.QualityMtTestVO;

public interface QualityMapper {
	public List<MtOrderInspStatVO> selectMtOrderInspStat();
	public List<QualityMtTestVO> selectMtQualityTestList(@Param("modCd") String modCd);
	public List<MtBadCodeVO> selectMtBadCode();
	public int InsertMtInsp(MtInspInsertVO vo);
	public int InsertMtBadInsp(MtInspBadInsertVO badvo); 
	public String getNewMiCd();
	
	//제품검수
	//생산지시 전체목록 모달
	public List<ProdInspVO> procProdList();
	//생산지시 전체목록
	public List<ProdInspVO> procPrprEndIsNAllList(@Param("cprNm") String cprNm, @Param("start") String start, @Param("end") String end);
	//생산지시 디테일(공정)
	public List<ProdInspVO> procDetailList(@Param("prcmCd") String prcmCd);
}
