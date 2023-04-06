package com.yedam.mes.sales.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class OrdrShtDtlVO {

	// 주문서상세
	private String ordrDtlCd; // 주문코드
	private String ordrDtlCnt; // 주문수량
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dlvryDt; // 납기일자
	private String cprCd; // 제품코드
	private String orderNo; // 주문서번호

}
