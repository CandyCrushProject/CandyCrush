package com.yedam.mes.sales.service.vo;

import lombok.Data;

@Data
public class OrdrAccntVO {
	private String caNo; // 거래처코드
	private String caNm; // 거래처명
	private String caBsnsNum; // 사업자등록번호
	private String caCeoNm; // 대표자
	private String caAddr; //주소
	private String caPh; // 전화번호
	private String caMng; // 담당자
	private String caMngPh; // 담당자번호
	private String caTyp; // 거래처유형
}
