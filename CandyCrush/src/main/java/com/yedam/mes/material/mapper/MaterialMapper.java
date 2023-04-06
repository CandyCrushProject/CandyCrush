package com.yedam.mes.material.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.material.service.AccountVO;
import com.yedam.mes.material.service.MaterialOrderVO;
import com.yedam.mes.material.service.MaterialVO;

public interface MaterialMapper {
	//자재 전체조회
	public List<MaterialVO> mtrlAllList();
	//자재발주 전체조회
	public List<MaterialOrderVO> mtrlOrderAllList();
	//업체조회
	public List<AccountVO> accountCheck();
	//모달 업체검색
	public List<AccountVO> accountCheckModal(@Param("caNm") String caNm, @Param("cmmNm") String cmmNm);
	//업체명 또는 자재명을 통한 자재검색
	public List<MaterialVO> mtrlSearch(@Param("caNm") String caNm, @Param("cmmNm") String cmmNm);
	
	
}
