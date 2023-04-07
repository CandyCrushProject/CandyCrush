package com.yedam.mes.facility.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class FacilityOperationVO {
	private String fdmCd;
	private String facCd;
	private String facNm;
	private String fdmMgr;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date fdmStop;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date fdmRun;
	private String cfdCd;
	private String facRun;
	private String facInfo;
	private String cfdTitle;
	private String cfdContent;
}
