package com.yedam.mes.process.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.process.mapper.ProcMapper;
import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.OrderPlanVO;
import com.yedam.mes.process.vo.ProcOrderVO;
import com.yedam.mes.process.vo.ProcPerfVO;
import com.yedam.mes.process.vo.ProcPlanVO;
import com.yedam.mes.process.vo.ProcProgVO;

@Service
public class procServiceImpl implements ProcService {

	@Autowired
	ProcMapper procMapper;
	
	@Override
	public List<OrderPlanVO> getOrder() {
		return procMapper.selectOrder();
	}

	@Override
	public OrderPlanVO getOneOrder(OrderPlanVO opVO) {
		return procMapper.selectOneOrder(opVO);
	}

	@Override
	public int addPlan(ProcPlanVO planVO) {
		return 0;
	}

	@Override
	public ProcPlanVO getPlan(ProcPlanVO planVO) {
		return null;
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





}
