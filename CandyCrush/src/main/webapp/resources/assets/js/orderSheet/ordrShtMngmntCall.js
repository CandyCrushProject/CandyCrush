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
  $("#dlvryDt").change(function () {
    dlvryDtCheck();
  });

  // 주문서 등록
  $('#ordrShtInsert').on('click', () => {
    if (dlvryDt == "" || dlvryDt == null || dlvryDt == undefined) {
      Swal.fire({
        icon: 'error',
        title: '경고',
        text: "납기날짜를 선택 하세요.",
      });
    }
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
}

// ajax로 불러온 날짜데이터(시간으로 불러와짐) 변환
function dateChange(date) {
  let date1 = new Date(date);
  let date2 = date1.getFullYear() + '-'
    + ((date1.getMonth() < 10) ? '0' + (date1.getMonth() + 1) : (date1.getMonth() + 1)) + '-'
    + ((date1.getDate() < 10) ? '0' + date1.getDate() : date1.getDate());
  return date2;
}

// 현재날짜
let formattedDate = "";
function formatDate() {
  let date = new Date();
  let year = date.getFullYear();
  let month = ("0" + (date.getMonth() + 1)).slice(-2);
  let day = ("0" + date.getDate()).slice(-2);
  formattedDate = year + "-" + month + "-" + day;
  return formattedDate;
}

let dlvryDt = $('#dlvryDt').val();
function dlvryDtCheck() {
  //console.log("dlvryDt : ", dlvryDt);
  //console.log("formattedDate : ", formattedDate);
  if (dlvryDt < formattedDate) {
    Swal.fire({
      icon: 'error',
      title: '경고',
      text: "이전날짜는 선택할 수 없습니다.",
    });
  }
}