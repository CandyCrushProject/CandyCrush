package com.yedam.mes.quality.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.quality.service.vo.MtBadCodeVO;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.MtInspInsertVO;
import com.yedam.mes.quality.service.vo.MtOrderInspStatVO;
import com.yedam.mes.quality.service.vo.QualityMtTestVO;

public interface QualityServcie {
	public List<MtOrderInspStatVO> selectMtOrderInspStat();
	public List<QualityMtTestVO> selectMtQualityTestList(@Param("modCd") String modCd);
	public List<MtBadCodeVO> selectMtBadCode();
	public int InsertMtInsps(HashMap<String, Object> map);
	public int getNewMiCd();
	public int InsertMtBadInsp(List<MtInspBadInsertVO> badvo); 
}
