package com.yedam.mes.process.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.process.mapper.ProcMapper;
import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.BomInfoVO;
import com.yedam.mes.process.vo.OrderPlanVO;
import com.yedam.mes.process.vo.ProcOrderVO;
import com.yedam.mes.process.vo.ProcPerfVO;
import com.yedam.mes.process.vo.ProcPlanVO;
import com.yedam.mes.process.vo.ProcProgVO;
import com.yedam.mes.process.vo.ProcResultAllVO;

@Service
public class procServiceImpl implements ProcService {

	@Autowired
	ProcMapper procMapper;

	// 생산계획 - 제품코드 불러오기
	@Override
	public List<OrderPlanVO> getCprCdList() {
		return procMapper.selectCprCdList();
	}

	// 생산계획 - 주문상세코드 가져오기
	@Override
	public List<OrderPlanVO> getOrdrDtlCd(@Param("orshNo")String[] orshNo) {
		return procMapper.getOrdrDtlCd(orshNo);
	}
	// 생산계획 - 첫 화면 미계획 주문서목록 읽어오기
	@Override
	public List<OrderPlanVO> getOrder() {
		return procMapper.selectOrder();
	}

	// 미계획 주문서 체크 후 추가 버튼 누르면 계획 등록 폼으로 이동
	@Override
	public List<OrderPlanVO> addPlanbefore(@Param("orshNo")String[] orshNo) {
		return procMapper.addPlanbefore(orshNo);
	}

	// 생산계획 - 주문서 접수완료 -> 계획완료 변경
	@Override
	public int updateOrderStatus(@Param("orshNo")String[] orshNo) {
		int r = 0;
		for(String orNo:orshNo) {
			r += procMapper.updateOrderStatus(orNo);
		}
		return r;
	}
	
	// 미계획 주문서에 대한 상세 정보 목록
	@Override
	public List<OrderPlanVO> getOrderDetail(OrderPlanVO opVO) {
		return procMapper.selectOrderDetail(opVO);
	}

	@Override // bom 정보 
	public List<BomInfoVO> getBom(OrderPlanVO opVO) {
		return procMapper.selectBom(opVO);
	}
	@Override // 생산계획 등록
	public int addPlan(ProcPlanVO planVO) {
		int r = procMapper.insertPlan(planVO);
			
		return r;
	}

	@Override // 생산계획 디테일
	public int addPlanDetail(List<ProcPlanVO> planVO) { 
		int r = 0;
		for(ProcPlanVO pvo:planVO) {
			r += procMapper.insertPlanDetail(pvo);
		}
		return r;
	}
	@Override // 생산계획 목록
	public List<ProcPlanVO> getPlan() {
		return procMapper.seletPlanList();
	}

	@Override // 생산지시 등록
	public int addOrder(ProcOrderVO poVO) {
		return procMapper.insertProcOrder(poVO);
	}

	@Override
	public List<ProcOrderVO> getOrderList() {
		return null;
	}

	@Override
	public ProcOrderVO getOrder(ProcOrderVO orderVO) {
		return null;
	}

	@Override
	public List<ProcPerfVO> getPerfList(ProcPerfVO perfVO) {
		return null;
	}

	@Override 
	public List<ProcProgVO> getProgList(ProcProgVO progVO) {
		return null;
	}

	@Override // 계획 검색 정보
	public List<ProcPlanVO> searchPlanList(ProcPlanVO ppVO) {
		return procMapper.searchPlanList(ppVO);
	}

	@Override // 자재 총 재고
	public List<OrderPlanVO> findMtrlCntSum(OrderPlanVO opVO) {
		return procMapper.findMtrlCntSum(opVO);
	}

	@Override // 자재 로트별 재고
	public List<OrderPlanVO> findMtrlLot(OrderPlanVO opVO) {
		return procMapper.findMtrlLot(opVO);
	}
	@Override // 담당자 목록
	public List<ProcPlanVO> getManagerList() {
		return procMapper.getManagerList();
	}
	//V이거 왜 맨아래있음 누구꺼?
	
	@Override
	public List<BomInfoVO> selectMtrlInput(BomInfoVO biVO) {
		return procMapper.selectMtrlInput(biVO);
	}
	
	
	//여기부터 영주영역~~~~~~~~~~
	@Override //실적페이지 지시조회
	public List<ProcResultAllVO> getProcCommand(){
		return procMapper.getProcCommand();
	}

	@Override //실적페이지 공정조회
	public List<ProcResultAllVO> getProc(@Param("prcmCd")String prcmCd) {
		return 	procMapper.getProc(prcmCd);
	}
  
	@Override //실적페이지 가용설비조회
	public List<ProcResultAllVO> getProcFac(@Param("prcmPrcd") String prcmPrcd) {
		return procMapper.getProcFac(prcmPrcd);
	}
	
	@Override //실적페이지 현제 작업중목록조회
	public List<ProcResultAllVO> getProcProg() {
		// TODO Auto-generated method stub
		return procMapper.getProcProg();
	}
	
	@Override //실적페이지 작업시작 insert
	public int startProg(ProcResultAllVO startVO) {
		// TODO Auto-generated method stub
		return procMapper.startProg(startVO);
	}
	
	@Override //불량코드 불러오기
	public List<ProcResultAllVO> getBadCd() {
		// TODO Auto-generated method stub
		return procMapper.getBadCd();
	}
	
	
	@Override
	public List<ProcResultAllVO> selectProcMtrl(@Param("prcmPrcd") String prcmPrcd) {
		// TODO Auto-generated method stub
		return procMapper.selectProcMtrl(prcmPrcd);
	}
	
	@Override
	public int insertResult(List<ProcResultAllVO> finishVO) {
		// TODO Auto-generated method stub
		int result=0;
		ProcResultAllVO pvo = new ProcResultAllVO();
		for(int i =0;i<finishVO.size();i++) {
			if (i==0) { //불량이 여러건이든 한건이든 한번만 실행됨
				result+=procMapper.insertResult(finishVO.get(0));
				result+=procMapper.updateProcProg(finishVO.get(0));
				
				
				System.out.println(finishVO.get(0).getPrcmPrcd());
				pvo = procMapper.PselectNextProc(finishVO.get(0));//다음공정 가져오기
				pvo.setPrcmQnt(finishVO.get(0).getPrpeProd());//생산목표량에 이전작업한 생산량을넣어서
				procMapper.PupdateProcQnt(pvo);//업데이트해주기
				if(pvo.getCmCd().equals("cmprcd007")) //다음공정이 검수라면
				{
					procMapper.PupdateProcFin(pvo);//해당생산지시 생산종료넣어주기
				}
			}
			if(finishVO.get(i).getBadQnt()>0) {
				result+=procMapper.insertBad(finishVO.get(i));
			}
		}
		return result;
	}
	
	

	@Override
	public List<ProcResultAllVO> getProcResult() {
		// TODO Auto-generated method stub
		return procMapper.getProcResult();
	}
	
//================================================================

	// 공정지시 등록
	@Override
	public int insertProgressOne(ProcOrderVO poVO) {
		int r = 0;
			r += procMapper.insertProgressOne(poVO);
		return r;
	}
	// 공정지시 등록
	@Override
	public int insertProgressFull(List<ProcOrderVO> poVO) {
		int r = 0;
		for(int i=1; i<poVO.size();i++) {
			r += procMapper.insertProgressFull(poVO.get(i));
		}
		return r;
	}

	// 공정자재등록
	@Override
	public int insertProgMtrl(List<ProcOrderVO> poVO) {
		int r = 0;
		for(ProcOrderVO pvo:poVO) {
			r += procMapper.insertProgMtrl(pvo);
		}
		return r;
	}








	
	
	
	
}
