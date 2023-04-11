package com.yedam.mes.material.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.material.mapper.MaterialInputVO;
import com.yedam.mes.material.mapper.MaterialMapper;
import com.yedam.mes.material.service.MaterialOrderVO;
import com.yedam.mes.material.service.MaterialService;
import com.yedam.mes.material.service.MaterialVO;
import com.yedam.mes.material.service.MtrlAccountVO;

//구현클래스 : 빈을 등록되는 대상
@Service
public class MaterialServiceImpl implements MaterialService {
	@Autowired
	MaterialMapper mapper;
	//업체명 또는 자재명을 통한 자재검색
	@Override
	public List<MaterialVO> mtrlSearch(@Param("caNm") String caNm, @Param("cmmNm") String cmmNm) {
		return mapper.mtrlSearch(caNm, cmmNm);
	}
	//업체명 또는 자재명을 통한 자재검색
	@Override
	public List<MaterialOrderVO> mtrlOrderDateSearch(String caNm, String start, String end) {
		return mapper.mtrlOrderDateSearch(caNm, start, end);
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
	//자재발주목록에서 발주코드 클릭하면 발주상세목록을 모달로 띄운다 / 20230409
	@Override
	public List<MaterialOrderVO> mtrlOrderDetailList(String moCd) {
		return mapper.mtrlOrderDetailList(moCd);
	}
	//자재발주코드 자동생성
	@Override
	public MaterialOrderVO getMtrlOrderCode() {
		return mapper.getMtrlOrderCode();
	}
		
	//자재발주헤더 + 자재발주디테일 INSERT
	@Override
	public int orderInsert(MaterialOrderVO vo, List<MaterialOrderVO> listVO) {
		int cnt = 0;
		
		cnt = mapper.orderHeaderInsert(vo);
		
		for(MaterialOrderVO matlVO: listVO) {
			cnt += mapper.orderDetailInsert(matlVO);
		}
		
		return cnt;
	}
	
	//발주 디테일 데이터 UPDATE
	@Override
	public int orderDetailUpdate(@Param("moCnt") int moCnt, @Param("moReqDt") Date moReqDt, @Param("moCd") String moCd, @Param("cmmCd") String cmmCd) {
		return mapper.orderDetailUpdate(moCnt, moReqDt, moCd, cmmCd);
	}
	
	//--발주입고관리
	//검사일자 : 시작일자 ~ 종료일자 & 업체명을 통한 데이터 조회
	@Override
	public List<MaterialInputVO> mtrlInputGetList(String caNm, String start, String end) {
		return mapper.mtrlInputGetList(caNm, start, end);
	}
}
