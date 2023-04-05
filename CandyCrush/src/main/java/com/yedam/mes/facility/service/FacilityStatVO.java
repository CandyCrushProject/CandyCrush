package com.yedam.mes.facility.service;

import java.util.Date;

import lombok.Data;
@Data
public class FacilityStatVO {
	private String facCd;
	private String facNm;
	private Date facDt;
	private String facCy;
	private Date facRctMtn;
	private String facInfo;
	private String facRun;
	private Date mtnPlanned;
}
