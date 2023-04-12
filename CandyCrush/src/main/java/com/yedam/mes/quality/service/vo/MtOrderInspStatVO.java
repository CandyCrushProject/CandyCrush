package com.yedam.mes.quality.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class MtOrderInspStatVO {//주문서조회, 품질관리 등록용
	private String moCd;
	private String modCd;
	private String moTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moReoDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moReqDt;
	private String cmmCd;
	private String cmmNm;
	private String moCnt;
	private String caNo;
	private String caNm;
	private String inspProc;
}
