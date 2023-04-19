package com.yedam.mes.material.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mvel2.optimizers.impl.refl.nodes.ArrayLength;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.mes.material.mapper.MaterialMapper;
import com.yedam.mes.material.service.MaterialInputVO;
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
	};
	
	//업체명 또는 자재명을 통한 자재검색
	@Override
	public List<MaterialOrderVO> mtrlOrderDateSearch(String caNm, String start, String end) {
		return mapper.mtrlOrderDateSearch(caNm, start, end);
	};
	
	//업체조회
	@Override
	public List<MtrlAccountVO> accountCheck() {
		return mapper.accountCheck();
	};
	
	//모달 업체검색
	@Override
	public List<MtrlAccountVO> accountCheckModal(@Param("caNm") String caNm, @Param("caNo") String caNo) {
		return mapper.accountCheckModal(caNm, caNo);
	};
	
	//자재목록에서 자재코드 클릭하면 자재발주로 리스트를 뿌린다
	@Override
	public List<MaterialOrderVO> mtrlOrderOneCheck(@Param("cmmCd") String cmmCd) {
		return mapper.mtrlOrderOneCheck(cmmCd);
	};
	
	//자재발주목록에서 발주코드 클릭하면 발주상세목록을 모달로 띄운다 / 20230409
	@Override
	public List<MaterialOrderVO> mtrlOrderDetailList(String moCd) {
		return mapper.mtrlOrderDetailList(moCd);
	};
	
	//자재발주코드 자동생성
	/*@Override
	public MaterialOrderVO getMtrlOrderCode() {
		return mapper.getMtrlOrderCode();
	};*/
		
	//자재발주헤더 + 자재발주디테일 INSERT, 수정해야함
	@Override
	public int orderInsert(MaterialOrderVO vo, List<MaterialOrderVO> listVO) {
		int cnt = 0;
		
		cnt = mapper.orderHeaderInsert(vo);
		
		for(MaterialOrderVO matlVO: listVO) {
			matlVO.setMoCd(vo.getMoCd());
			cnt += mapper.orderDetailInsert(matlVO);
			System.out.println(matlVO);
		}
		
		return cnt;
	};
	
	//발주번호 기반으로 헤더와 디테일의 데이터를 동시에 지운다
	@Override
	public int orderDelete(String delMocd) {
		String[] array = delMocd.split(",");
		
		int result = 0;
		
		for(int i = 0; i < array.length ; i++) {
			result += mapper.orderDelete(array[i]);
		};
		
		if(result > 0) {
			return result;			
		} else {
			return -1;
		}
	};
	
	//발주상세코드를 기반으로 디테일 데이터를 지운다
	@Override
	public int orderDetailDelete(MaterialOrderVO vo) {
		/*String[] array = moCd.split(",");
		
		int result = 0;
		
		for(int i = 0; i < array.length ; i++) {
			result += mapper.orderDetailDelete(array[i]);
		};
		
		if(result > 0) {
			return result;			
		} else {
			return -1;
		}*/
		
		return mapper.orderDetailDelete(vo);
	};
	
	//발주 디테일 데이터 UPDATE
	@Override
	public int orderDetailUpdate(@Param("moCnt") int moCnt, @Param("moReqDt") Date moReqDt, @Param("moCd") String moCd, @Param("cmmCd") String cmmCd) {
		return mapper.orderDetailUpdate(moCnt, moReqDt, moCd, cmmCd);
	};
	
	//--발주입고관리
	//검사일자 : 시작일자 ~ 종료일자 & 업체명을 통한 데이터 조회
	@Override
	public List<MaterialInputVO> mtrlInputGetList(String caNm, String start, String end) {
		return mapper.mtrlInputGetList(caNm, start, end);
	}

	//입고목록 -> 7일 이내
	@Override
	public List<MaterialInputVO> mtrlInputList7Days() {
		return mapper.mtrlInputList7Days();
	}

	//입고목록 -> 입고상세
	@Override
	public List<MaterialInputVO> mtrlInputDetailList(@Param("minCd") String minCd) {
		return mapper.mtrlInputDetailList(minCd);
	}
	
	@Transactional
	@Override
	public int mtrlInputALLInsert(List<MaterialInputVO> vo) {
		int implResponse = 0;
		int inputInsertResult = mapper.mtrlInputInsert(vo);				//입고관리/입고코드
		int lotInsertResult = mapper.mtrlLotInsert(vo);
		if(inputInsertResult != 0 && lotInsertResult != 0) {
			implResponse++;
		}
		return implResponse;
	}

	//진행여부 업데이트
	@Override
	public int mtrlMoSttUpdate(MaterialInputVO vo) {
		return mapper.mtrlMoSttUpdate(vo);
	}

	//--자재출고관리
	//출고목록
	@Override
	public List<MaterialVO> mtrlOutList() {
		return mapper.mtrlOutList();
	}
	//출고 7일이내 목록 
	@Override
	public List<MaterialVO> mtrlOut7DayList() {
		return mapper.mtrlOut7DayList();
	}
	//출고 상세목록
	@Override
	public List<MaterialVO> mtrlOutDetailList(@Param("motCd") String motCd) {
		return mapper.mtrlOutDetailList(motCd);
	}

	@Override
	public int mtrlOutInsert(List<MaterialVO> vo) {
		int cnt = 0;
		
		int result = mapper.mtrlOutInsert(vo);
		System.out.println(result);
		
		if(result != 0) {
			cnt++;
		}
		
		return cnt;
	}
}
