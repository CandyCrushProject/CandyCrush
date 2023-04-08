package com.yedam.mes.facility.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class FacilityMaintenanceVO {
	private String facMtn;
	private String facCd;
	private String facRtn;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date facMtnDt;
	private String facRslt;
	private String facAct;
	private String facActDtl;
	private String facMgr;
}
