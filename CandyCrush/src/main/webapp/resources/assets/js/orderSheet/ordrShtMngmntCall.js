$(document).ready(function () {
  // 거래처 검색
  $('#accountName').on('input', function () {
    accntSrch();
  });

  // 주문서관리 페이지 거래처 검색
  // $('#accntMdlCaNm').on('input', function () {
  //   accntSrch();
  // });

  // 납기날짜 체크하기
  // $("#dlvryDt").on('change', function () {
  //   dlvryDtCheck();
  // });

  // 주문서 등록
  $('#ordrShtInsert').on('click', () => {
    // if (dlvryDtChk == null || dlvryDtChk == undefined || dlvryDtChk == "") {
    //   Swal.fire({
    //     icon: 'error',
    //     title: '경고',
    //     text: "납기일을 선택 하세요.",
    //   });
    // }
    ordrShtInsert();
  });

  // ESC 누르면 모달창 없어짐
  $(window).on("keydown", (e) => {
    let ordrDtilMdl = $("#ordrDtilMdl");

    //e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
    if (e.keyCode === 27 && ordrDtilMdl.css("display") === "block") {
      ordrDtilMdl.hide();
    };
  });

  // 주문서관리페이지 주문서 모달창에서 제품주문 쪽 +버튼 눌렀을때 행 추가
  $('#getRowBtn').on('click', () => {
    ordrProdList.appendRow();
  });

  // 주문서관리페이지 주문서 모달창에서 제품주문 쪽 -버튼 눌렀을때 체크된 행 삭제
  $('#delRowBtn').on('click', () => {
    ordrProdList.removeCheckedRows();
  })
});

let accountName = "";
//주문서관리 업체명검색
function accntSrch() {
  accountName = document.getElementById('accountName').value;
  $.ajax({
    url: "ordrAccntSrch",
    method: "POST",
    dataType: "JSON",
    data: { caNm: accountName },
    success: function (data) {
      // console.log(data);
      accntList.resetData(data);
    },
    error: function (rej) {
      Swal.fire({
        title: 'Error',
        icon: 'error'
      });
    }
  });
  $.ajax({
    url: "ordrShtMngnSrch",
    method: "POST",
    dataType: "JSON",
    data: { caNm: accountName },
    success: function (data) {
      // console.log(data);
      orderList.resetData(data);
    },
    error: function (rej) {
      Swal.fire({
        title: 'Error',
        icon: 'error',
        text: rej
      });
    }
  });
}

//---------------------------------------------------------------------------------------------
// ajax로 불러온 날짜데이터(시간으로 불러와짐) 변환
function dateChange(date) {
  let date1 = new Date(date);
  let date2 = date1.getFullYear() + '-'
    + ((date1.getMonth() < 10) ? '0' + (date1.getMonth() + 1) : (date1.getMonth() + 1)) + '-'
    + ((date1.getDate() < 10) ? '0' + date1.getDate() : date1.getDate());
  return date2;
}

//---------------------------------------------------------------------------------------------
// 현재날짜
let formattedDate = "";
function formatDate() {
  let date = new Date();
  let year = date.getFullYear();
  let month = ("0" + (date.getMonth() + 1)).slice(-2);
  let day = ("0" + date.getDate()).slice(-2);
  formattedDate = year + "-" + month + "-" + day;
  console.log(formattedDate, " : formattedDate");
  return formattedDate;
}

//---------------------------------------------------------------------------------------------
// 납기일짜선택할 때 현재날짜 이전여부 체크
// let dlvryDtChk = $('#dlvryDt').val();
// function dlvryDtCheck() {
//   if (dlvryDtChk < formattedDate) {
//     Swal.fire({
//       icon: 'error',
//       title: '경고',
//       text: "납기일을 확인 하세요.",
//     });
//     console.log(dlvryDtChk, "dlvryDtChkdlvryDtChkdlvryDtChk");
//     console.log(formattedDate, "formattedDateformattedDate");
//   } else {
//     return;
//   }
// }

//------
// serialize 배열형태로 반들어줌
// serialize 기존형태 => { name : name, value : value }
// serialize 바꾼형태 => { name : value }
function serializeObject(serializeArrayData) {
  let returnData = {};
  $.each(serializeArrayData, function(idx,obj){
    returnData[obj.name] = obj.value;
  });
  return returnData;
}