let ordrBtn = document.getElementById("ordrBtn"); //조회버튼
let delBtn = document.getElementById("delBtn"); //삭제버튼
// let mdlCaNmSrch = document.getElementById("mdlCaNmSrch"); //모달 거래처 검색 버튼
let confirmBtn = document.getElementById("confirmBtn"); //거래처 모달창 확인버튼
let acctnNmInput = document.getElementById("acctnNm"); //거래처명 검색 인풋박스
let selStrtDt = ""; //주문일자 검색
let selendDt = ""; //주문일자 검색
let acctnNm = ""; //거래처명 검색
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
    //setTimeout(() => caModal.refreshLayout(), 0);
  });
});

// 거래처 모달
// function modalAccountSearch() {
//   mdlCaNmSrch = document.getElementById('mdlCaNmSrch').value;
//   modalCaCd = document.getElementById('modalCaCd').value;

//   $.ajax({
//     url: "accountCheck",
//     method: "POST",
//     dataType: "JSON",
//     data: { caNm: mdlCaNm, caNo: modalCaCd },
//     success: function (data) {
//       //console.log(data);
//       caModal.resetData(data);
//     }
//   });
// }

// document.getElementById("mdlCaNmSrch").addEventListener("click", () => {
//   modalAccountSearch();
// });


//조회버튼 눌렀을때 
// function search() {
//   selStrtDt = document.getElementById("selStrtDt").value; // 시작 날짜 저장
//   selendDt = document.getElementById("selendDt").value; // 끝나는 날짜 저장
//   acctnNm = document.getElementById("vendNm").value.toUpperCase(); // 거래처명 저장
//   $.ajax({
//     url: "orderSearch",
//     method: "post",
//     dataType: "JSON",
//     data: {start: start, end: end, vendNm: vendNm },
//     success: function (data) {
//       grid.resetData(data); //그리드 적용
//     },
//     error: function (reject) {
//       console.log(reject);
//     },
//   });
// }

