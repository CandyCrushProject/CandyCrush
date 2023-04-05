package com.yedam.mes.process.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProcOrderVO {
	// 생산지시
	private String prcmCd;
	private String prplCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prcmDt;
	private String prcmMng;

	// 생산지시디테일
	private String prcmWorkCd;
	private int prcmCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prcmStartDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prcmEndDt;
	private String cmCd;
	private int prcTurn;
	private String cprCd;
}
