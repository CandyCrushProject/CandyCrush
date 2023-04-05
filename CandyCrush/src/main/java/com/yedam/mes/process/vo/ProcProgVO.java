package com.yedam.mes.process.vo;

import lombok.Data;

@Data
public class ProcProgVO {
	// 공정진행
	private String prprPrcd;
	private int prprTurn;
	private int prprInQnt;
	private int prprQnt;
	private int prprBadQnt;
	private String prprCmpltStt;
	private String prcmCd;
	private String cmCd;
}
