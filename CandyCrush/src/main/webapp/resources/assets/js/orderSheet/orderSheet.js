//let ordrBtn = document.getElementById("ordrBtn"); //조회버튼
//let delBtn = document.getElementById("delBtn"); //삭제버튼
// let mdlCaNmSrch = document.getElementById("mdlCaNmSrch"); //모달 거래처 검색 버튼
//let confirmBtn = document.getElementById("confirmBtn"); //거래처 모달창 확인버튼
//let acctnNmInput = document.getElementById("acctnNm"); //거래처명 검색 인풋박스
//let checkLen = 0; //체크박스 선택 개수
//let vendSearch = ""; //모달창 거래처명 저장변수

//Modal Grid 빠르게 띄우는 방법
$(document).ready(function(){

  // 거래처 모달
  $('#mdlCaNmSrchBtn').on('click',function () {
    document.getElementById('accntNmMdl').style.display = 'block';
    //setTimeout(() => caModal.refreshLayout(), 0);
  });

  // 제품명 모달
  $('#prdNmSrchBtn').on('click', function () {
    document.getElementById('prdNmMdl').style.display = 'block';
  });

  // 조회버튼 눌렀을 때 검색
  $('#ordrSchBtn').on('click', (e) => {
    ordrShtSearch();
  });
});

//---------------------------------------------------------------------------------------------
// 검색 조회
let caNm = null; // 거래처명
let orshStrDt = null; // 시작날짜
let orshEndDt = null; // 끝 날짜

// 거래처명, 제품명, 발주신청일 시작일자, 발주신청일 종료일자
/*const ordrShtGetData = (caNm = undefined, orshStrDt = undefined, orshEndDt = undefined) => {
  $.ajax({
    url : "ordrShtSrch",
    method :"POST",
    dataType : "JSON",
    data : {caNm : caNm, orshStrDt : orshStrDt, orshEndDt : orshEndDt},
    success : function(data) {
      console.log(data);
      orderList.resetData(data);
    } 
  });
};
ordrShtGetData();*/

function ordrShtSearch() {
  caNm = $("#ordrCmpnyNm").val(); // 거래처명 value
  orshStrDt = $("#selStrtDt").val(); // 시작 날짜 value
  orshEndDt = $("#selendDt").val();  // 끝나는 날짜 value

  $.ajax({
    url : "ordrShtSrch",
    method :"POST",
    dataType : "JSON",
    data : {caNm : caNm, orshStrDt : orshStrDt, orshEndDt : orshEndDt},
    success : function(data) {
      console.log(data);
      orderList.resetData(data);
    } 
  });
};