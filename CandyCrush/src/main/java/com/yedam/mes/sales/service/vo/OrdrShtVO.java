package com.yedam.mes.sales.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrdrShtVO {

	// 주문서상세
	private String orshNo; // 주문서번호
	private String cprCd; // 제품코드
	private String caNo; // 거래처코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orshDt; // 주문일자
	private String orshPr; // 현재상황

}
