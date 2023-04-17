package com.yedam.mes.quality.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.mes.quality.mapper.QualityMapper;
import com.yedam.mes.quality.service.QualityServcie;
import com.yedam.mes.quality.service.vo.MtBadCodeVO;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.MtInspInsertVO;
import com.yedam.mes.quality.service.vo.MtOrderInspStatVO;
import com.yedam.mes.quality.service.vo.ProdInspVO;
import com.yedam.mes.quality.service.vo.QualityMtTestVO;
@Service
public class QualityServiceImpl implements QualityServcie {
	@Autowired
	QualityMapper qualityMapper;

	@Override
	public List<QualityMtTestVO> selectMtQualityTestList(@Param("modCd") String modCd) {
		// TODO Auto-generated method stub
		return qualityMapper.selectMtQualityTestList(modCd);
	}

	@Override
	public List<MtOrderInspStatVO> selectMtOrderInspStat() {
		// TODO Auto-generated method stub
		return qualityMapper.selectMtOrderInspStat();
	}

	@Override
	public List<MtBadCodeVO> selectMtBadCode() {
		// TODO Auto-generated method stub
		return qualityMapper.selectMtBadCode();
	}

	@Override
	public int InsertMtInsps(HashMap<String, Object> map) {
		ObjectMapper objectMapper = new ObjectMapper();
		MtInspInsertVO inspvo = objectMapper.convertValue(map.get("MtInspInsert"), MtInspInsertVO.class);
		qualityMapper.InsertMtInsp(inspvo);
		return 0;
	}

	@Override
	public String getNewMiCd() {
		// TODO Auto-generated method stub
		return qualityMapper.getNewMiCd();
	}


	@Override
	public int InsertMtBadInsp(List<MtInspBadInsertVO> badvo) {
		// TODO Auto-generated method stub
		System.out.println(badvo);
		for(MtInspBadInsertVO vo:badvo) {
			System.out.println(vo);
			qualityMapper.InsertMtBadInsp(vo);
		}
		return 0;
	}

	//제품검사
	//생산지시 전체목록 모달
	public List<ProdInspVO> procProdList(){
		return qualityMapper.procProdList();
	};
	//생산지시 전체목록
	@Override
	public List<ProdInspVO> procPrprEndIsNAllList(@Param("cprNm") String cprNm, @Param("start") String start, @Param("end") String end) {
		return qualityMapper.procPrprEndIsNAllList(cprNm, start, end);
	}
	//생산지시 디테일(공정)
	@Override
	public List<ProdInspVO> procDetailList(String prcmCd) {
		return qualityMapper.procDetailList(prcmCd);
	};
	

}
