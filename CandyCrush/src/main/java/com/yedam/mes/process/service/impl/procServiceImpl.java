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

@Service
public class procServiceImpl implements ProcService {

	@Autowired
	ProcMapper procMapper;

	// 생산계획 - 제품코드 불러오기
	@Override
	public List<OrderPlanVO> getCprCdList() {
		return procMapper.selectCprCdList();
	}
	// 생산계획 - 첫 화면 미계획 주문서목록 읽어오기
	@Override
	public List<OrderPlanVO> getOrder() {
		return procMapper.selectOrder();
	}

	// 미계획 주문서 체크 후 추가 버튼 누르면 계획 등록 폼으로 이동
	@Override
	public List<OrderPlanVO> addPlanbefore(String[] cprCd) {
		return procMapper.addPlanbefore(cprCd);
	}

	// 생산계획 - 주문서 접수완료 -> 계획완료 변경
	@Override
	public int updateOrderStatus(OrderPlanVO opVO) {
		return procMapper.updateOrderStatus(opVO);
	}
	
	// 미계획 주문서에 대한 상세 정보 목록
	@Override
	public List<OrderPlanVO> getOrderDetail(OrderPlanVO opVO) {
		return procMapper.selectOrderDetail(opVO);
	}

	@Override
	public List<BomInfoVO> getBomMtrl(OrderPlanVO opVO) {
		return procMapper.selectBomMtrl(opVO);
	}
	@Override
	public int addPlan(ProcPlanVO planVO) {
		return procMapper.insertPlan(planVO);
	}

	@Override
	public int addPlanDetail(ProcPlanVO planVO) {
		return procMapper.insertPlanDetail(planVO);
	}
	@Override
	public List<ProcPlanVO> getPlan(ProcPlanVO ppVO) {
		return procMapper.seletPlanList(ppVO);
	}

	@Override
	public int addOrder(ProcOrderVO orderVO) {
		return 0;
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

	@Override
	public List<ProcPlanVO> searchPlanList(ProcPlanVO ppVO) {
		return procMapper.searchPlanList(ppVO);
	}

	@Override
	public String getPlanCode() {
		return procMapper.getPlanCode();
	}










}
