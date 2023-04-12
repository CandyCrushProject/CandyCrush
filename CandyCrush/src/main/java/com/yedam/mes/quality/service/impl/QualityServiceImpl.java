package com.yedam.mes.quality.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.quality.mapper.QualityMapper;
import com.yedam.mes.quality.service.QualityServcie;
import com.yedam.mes.quality.service.vo.MtBadCodeVO;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.MtInspInsertVO;
import com.yedam.mes.quality.service.vo.MtOrderInspStatVO;
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
	public String InsertMtInsps(MtInspInsertVO inspvo, List<MtInspBadInsertVO> badvo) {
		// TODO Auto-generated method stub
			qualityMapper.InsertMtInsp(inspvo);
			for(MtInspBadInsertVO vo:badvo) {
				qualityMapper.InsertMtBadInsp(badvo);
			};
		return null;
	}
	

}
