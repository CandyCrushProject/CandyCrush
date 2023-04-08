package com.yedam.mes.material.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.material.service.MtrlAccountVO;
import com.yedam.mes.material.service.MaterialOrderVO;
import com.yedam.mes.material.service.MaterialVO;

public interface MaterialMapper {
	//자재 전체조회
	public List<MaterialVO> mtrlAllList();
	//자재발주 전체조회
	public List<MaterialOrderVO> mtrlOrderAllList();
	//업체조회
	public List<MtrlAccountVO> accountCheck();
	//모달 업체검색
	public List<MtrlAccountVO> accountCheckModal(@Param("caNm") String caNm, @Param("caNo") String caNo);
	//업체명 또는 자재명을 통한 자재검색
	public List<MaterialVO> mtrlSearch(@Param("caNm") String caNm, @Param("cmmNm") String cmmNm);
	//자재목록에서 자재코드 클릭하면 자재발주로 리스트를 뿌린다
	public List<MaterialOrderVO> mtrlOrderOneCheck(@Param("cmmCd") String cmmCd);
	//자재발주코드 자동생성
	public MaterialOrderVO getMtrlOrderCode();
	
	//--발주등록
	//발주관리 헤더
	public int orderHeaderInsert(MaterialOrderVO vo);
	//발주관리 디테일
	public int orderDetailInsert(List<MaterialOrderVO> vo);
	
	
}
