package com.yedam.mes.quality.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.quality.service.vo.QualityMtTestVO;
import com.yedam.mes.quality.service.vo.QualityOrderVO;

public interface QualityMapper {
	public List<QualityOrderVO> getQualityOrderList();
	
	public List<QualityMtTestVO> selectMtQualityTestList(@Param("moCd") String moCd);
}
