package com.yedam.mes.quality.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.mes.quality.mapper.QualityMapper;
import com.yedam.mes.quality.service.QualityServcie;
import com.yedam.mes.quality.service.vo.MtBadCodeVO;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.MtInspInsertVO;
import com.yedam.mes.quality.service.vo.MtOrderInspStatVO;
import com.yedam.mes.quality.service.vo.ProdInsertTestVO;
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
	};

	//제품검사
	public List<ProdInspVO> procProdList(){
		return qualityMapper.procProdList();
	};
	@Override
	public List<ProdInspVO> procPrprEndIsNAllList(@Param("cprNm") String cprNm, @Param("start") String start, @Param("end") String end) {
		return qualityMapper.procPrprEndIsNAllList(cprNm, start, end);
	};
	@Override
	public List<ProdInspVO> procDetailList(String prcmCd) {
		return qualityMapper.procDetailList(prcmCd);
	};
	
	//검수DB INSERT
	@Transactional
	@Override
	public int prodInspInsert(List<ProdInsertTestVO> vo) {
		int cnt = 0;
		
		for(ProdInsertTestVO newVO : vo) {
			//newVO.setPiCd(vo.get(0).getPiCd());
			newVO.setPrcmCd(vo.get(0).getPrcmCd());
			newVO.setPiDt(vo.get(0).getPiDt());
			newVO.setPiStrDt(vo.get(0).getPiStrDt());
			newVO.setPiEndDt(vo.get(0).getPiEndDt());
			newVO.setPiMng(vo.get(0).getPiMng());
			newVO.setPiCnt(vo.get(0).getPiCnt());
			newVO.setPiBadCnt(vo.get(0).getPiBadCnt());
			newVO.setPiPassCnt(vo.get(0).getPiPassCnt());
			newVO.setCprCd(vo.get(0).getCprCd());
			newVO.setPiNote(vo.get(0).getPiNote());
			
			int result = qualityMapper.prodInspInsert(newVO);
			int result2 = qualityMapper.prodInspUpdate(newVO);
			int result3 = qualityMapper.procPeRfInsert(newVO);
			
			if(result != 0 && result2 != 0 && result3 != 0) {
				cnt++;
			}
		}
		return cnt;
	};

	//상태업데이트
	@Override
	public int procProgUpdate(ProdInsertTestVO vo) {
		return qualityMapper.procProgUpdate(vo);
	};
	

}
