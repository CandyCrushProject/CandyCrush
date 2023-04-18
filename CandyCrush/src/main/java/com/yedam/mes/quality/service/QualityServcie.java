package com.yedam.mes.quality.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.quality.service.vo.MtBadCodeVO;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.MtOrderInspStatVO;
import com.yedam.mes.quality.service.vo.ProdInsertTestVO;
import com.yedam.mes.quality.service.vo.ProdInspVO;
import com.yedam.mes.quality.service.vo.QualityMtTestVO;

public interface QualityServcie {
	public List<MtOrderInspStatVO> selectMtOrderInspStat();
	public List<QualityMtTestVO> selectMtQualityTestList(@Param("modCd") String modCd);
	public List<MtBadCodeVO> selectMtBadCode();
	public int InsertMtInsps(HashMap<String, Object> map);
	public String getNewMiCd();
	public int InsertMtBadInsp(List<MtInspBadInsertVO> badvo); 
	
	//제품검사
	//SELECT
	public List<ProdInspVO> procProdList();
	public List<ProdInspVO> procPrprEndIsNAllList(@Param("cprNm") String cprNm, @Param("start") String start, @Param("end") String end);
	public List<ProdInspVO> procDetailList(@Param("prcmCd") String prcmCd);
	//검수DB INSERT
	public int prodInspInsert(List<ProdInsertTestVO> vo);
	//상태 업데이트
	public int procProgUpdate(ProdInsertTestVO vo);
}
