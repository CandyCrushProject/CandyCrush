package com.yedam.mes.process.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProcPlanVO {
	// 생산계획
	private String prplCd;
	private String orshNo;
	private int prplReqCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prplDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prplDlvryDt;
	private String prplStatus;

	//생산계획디테일
	private String prpldCd;
	private String prpldWorkTskPri;
	private String cprCd;
	private int prpldCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prstDt;
	private String prpldMng;
	private String prpldStatus;
}
