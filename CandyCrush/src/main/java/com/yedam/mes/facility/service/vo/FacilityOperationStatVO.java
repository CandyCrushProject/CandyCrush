package com.yedam.mes.facility.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class FacilityOperationStatVO {
	private String facCd;
	private String facNm;
	private String fdmCd;
	private String fdmMgr;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm:ss")
	private Date rctStp;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm:ss")
	private Date fdmRun;
	private String cfdCd;
	private String cfdTitle;
	private String cfdContent;
	private String facRun;
}
