package com.yedam.mes.process.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProcPlanVO {
	// 생산계획
	private String prplCd; // 생산계획코드
	private String orshNo; // 주문서번호
	private int prplReqCnt; // 생산요청수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prplDt; // 생산계획일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prplDlvryDt; // 납기일자
	private String prplStatus; // 완료여부

	//생산계획디테일
	private String prpldCd; // 생산계획상세코드
	private String prpldWorkTskPri; // 작업우선순위
	private String cprCd; // 제품코드
	private int prpldCnt; // 생산계획수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prstDt; // 생산작업일자
	private String prpldMng; // 담당자
	private String prpldStatus; // 현재상환
}