package com.yedam.mes.quality.service.vo;

import java.util.Date;

import lombok.Data;
@Data
public class QualityOrderVO {//주문서조회, 품질관리 등록용
	private String moCd;
	private int moCnt;
	private Date moReqDt;
	private String caNo;
	private String cmmCd;
	private String cmmNm;
	private String cmmTyp;
	private String cmmSpec;
	private String cmmUnit;
	
}
