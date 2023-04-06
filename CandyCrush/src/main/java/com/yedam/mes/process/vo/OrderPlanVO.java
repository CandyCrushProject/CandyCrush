package com.yedam.mes.process.vo;

import lombok.Data;

@Data
public class OrderPlanVO {
	
	// 생산계획에서 정보 부를때 쓸거
	private String orshNo;
	private String caNo;
	private String caNm;
	private String orshDt;
	private String orshPr;
	private int ordrDtlCnt;
	private String dlvryDt;
	private String cprCd;
	private String cprNm;
}
