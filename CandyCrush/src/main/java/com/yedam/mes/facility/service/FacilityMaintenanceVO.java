package com.yedam.mes.facility.service;

import java.util.Date;

import lombok.Data;
@Data
public class FacilityMaintenanceVO {
	private String facMtn;
	private String facCd;
	private String facRtn;
	private Date facMtnDt;
	private String facRslt;
	private String facAct;
	private String facActDtl;
	private String facMgr;
}
