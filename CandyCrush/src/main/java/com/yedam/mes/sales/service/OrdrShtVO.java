package com.yedam.mes.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrdrShtVO {

	// 주문서상세
	private String orshNo; // 주문코드
	private String prodCd; // 주문수량
	private String caNo; // 납기일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orshDt; // 제품코드
	private String orshPr; // 주문서번호

}
