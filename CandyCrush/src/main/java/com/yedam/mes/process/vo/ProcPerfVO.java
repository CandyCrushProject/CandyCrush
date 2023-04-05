package com.yedam.mes.process.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProcPerfVO {
	// 공정실적
	private String prpeCd;
	private String prpeMng;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prpeWkStartDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prpeWkEndDt;
	private int prpeBadQnt;
	private int prpeAmntWk;
	private String cprCd;
	private String prcmCd;
	private String cmCd;
}
