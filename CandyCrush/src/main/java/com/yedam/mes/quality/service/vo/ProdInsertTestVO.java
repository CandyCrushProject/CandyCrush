package com.yedam.mes.quality.service.vo;

import lombok.Data;

@Data
public class ProdInsertTestVO {
	private String piCd; // 검사코드
	private String prcmCd; // 생산지시코드
	private String piDt; // 검사일자
	private String piStrDt; // 검사시작일
	private String piEndDt; // 검사종료일
	private String piMng; // 검사담당자
	private int piCnt; // 검사량
	private int piBadCnt; // 불량량
	private int piPassCnt; // 합격량
	private String cprCd; // 제품코드
	private String piNote; // 비고
}
