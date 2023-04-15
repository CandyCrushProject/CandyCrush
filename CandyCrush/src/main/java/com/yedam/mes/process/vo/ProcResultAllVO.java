package com.yedam.mes.process.vo;

import java.util.Date;

import lombok.Data;
//VO올인원 다때려박기신공ㅋㅋㄹㅃㅃㅃㅋㅋㅋㅋㅋ
@Data
public class ProcResultAllVO {
	//생산지시테이블================================
	private String prcmCd;
	private int prceCnt;
	private String cprCd;
	private Date prcmDt;
	private Date prcmStartDt;
	private Date prcmEndDt;
	private String prcmMng;
	
	//공정지시테이블================================
	private String prcmPrcd;
	//private String prcmCd; 외래키
	private String cmCd;
	private int prcmTurn;
	private int prcmQnt;
	private int prprQnt;
	private int prprBad;
	private String prprEnd;
	
	//공정자재지시테이블================================
	private String prmpWrNo; 
	//private String prcmPrcd; 외래키
	private int prmpPutQnt;
	private String cmmCd;
	
	//공정실적 테이블================================
	private String prpeCd;
	private String prprPrcd;
	private String prpeMng;
	private Date prpeWkStartDt;
	private Date prpeWkEndDt;
	private int prpeAmntWk;
	//private String cmCd; 외래키
	private int prpeProd;
	private int prpeBadQnt;
	
	//공정불량실적==================================
	private String prpeBadCd;
	//private String prpeCd;외래키
	//private String prbdCd; 외래키
	//private String cmmCd; 외래키
	private int badQnt;
	
	
	//공정불량코드=============================
	private String prbdCd;
	private String prbdNm;
	private String prbdCtt;
	
	//기타 제품명 자재명 등등 불러오기용도
	private String cprNm; //제품명
	private String cmNm; //공정명
	private String cmmNm; //자재명
	private String facCd; //설비코드
	private String facNm; //설비명
	private int prQntSum;//합계출력용
	
	
}
