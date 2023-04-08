package com.yedam.mes.material.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.material.mapper.MaterialMapper;
import com.yedam.mes.material.service.MaterialService;
import com.yedam.mes.material.service.MaterialVO;
import com.yedam.mes.material.service.MtrlAccountVO;
import com.yedam.mes.material.service.MaterialOrderVO;

//구현클래스 : 빈을 등록되는 대상
@Service
public class MaterialServiceImpl implements MaterialService {
	@Autowired
	MaterialMapper mapper;

	@Override
	public List<MaterialVO> mtrlAllList() {
		return mapper.mtrlAllList();
	}
	
	@Override
	public List<MaterialOrderVO> mtrlOrderAllList() {
		return mapper.mtrlOrderAllList();
	}
	//업체명 또는 자재명을 통한 자재검색
	@Override
	public List<MaterialVO> mtrlSearch(@Param("caNm") String caNm, @Param("cmmNm") String cmmNm) {
		return mapper.mtrlSearch(caNm, cmmNm);
	}
	//업체조회
	@Override
	public List<MtrlAccountVO> accountCheck() {
		return mapper.accountCheck();
	}
	//모달 업체검색
	@Override
	public List<MtrlAccountVO> accountCheckModal(@Param("caNm") String caNm, @Param("caNo") String caNo) {
		return mapper.accountCheckModal(caNm, caNo);
	}
	//자재목록에서 자재코드 클릭하면 자재발주로 리스트를 뿌린다
	@Override
	public List<MaterialOrderVO> mtrlOrderOneCheck(@Param("cmmCd") String cmmCd) {
		return mapper.mtrlOrderOneCheck(cmmCd);
	}
	//자재발주코드 자동생성
	@Override
	public MaterialOrderVO getMtrlOrderCode() {
		return mapper.getMtrlOrderCode();
	}

	//--발주등록
	//발주관리 헤더
	@Override
	public int orderHeaderInsert(MaterialOrderVO vo) {
		return mapper.orderHeaderInsert(vo);
	}
	//발주관리 디테일
	@Override
	public int orderDetailInsert(List<MaterialOrderVO> vo) {
		return mapper.orderDetailInsert(vo);
	}
}
