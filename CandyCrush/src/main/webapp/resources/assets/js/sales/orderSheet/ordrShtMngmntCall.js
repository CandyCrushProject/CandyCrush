let dlvryDtChk = $('#dlvryDt').val(); // 납기일자 인풋값

$(document).ready(function () {
  
  // 주문서관리 페이지 거래처 검색
  $('#accountName').on('input', function () {
    accntSrch();
  });

  // ESC 누르면 모달창 없어짐
  $(window).on("keydown", (e) => {
    let ordrDtilMdl = $("#ordrDtilMdl");

    //e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
    if (e.keyCode === 27 && ordrDtilMdl.css("display") === "block") {
      ordrDtilMdl.hide();
    };
  });

  // 주문서 등록
  $('#ordrShtInsert').on('click', () => {
    ordrProdList.blur();
    ordrShtInsert();
  });

  // 주문서 수정
  $('#ordrShtSave').on('click', () => {
    ordrProdList.blur();
    ordrShtInsert();
  });

  // 주문서관리페이지 주문서 모달창에서 제품주문 쪽 +버튼 눌렀을때 행 추가
  $('#getRowBtn').on('click', () => {
    ordrProdList.appendRow();
  });

  // 주문서관리페이지 주문서 모달창에서 제품주문 쪽 -버튼 눌렀을때 체크된 행 삭제
  $('#delRowBtn').on('click', () => {
    ordrProdList.removeCheckedRows();
  })

  // 주문서관리페이지 주문서 목록에서 주문서 삭제
  $('#orderDelete').on('click', () => {
    
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
        icon: 'error',
        title: 'Error',
        text: rej
      });
    }
  });
  $.ajax({
    url: "ordrAccntSrch",
    method: "POST",
    dataType: "JSON",
    data: { caNm: accountName },
    success: function (data) {
      // console.log(data);
      orderList.resetData(data);
    },
    error: function (rej) {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: rej
      });
    }
  });
}
//---------------------------------------------------------------------------------------------
function ordrShtDelete() {
  
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
  //console.log(formattedDate, " : formattedDate");
  return formattedDate;
}

//---------------------------------------------------------------------------------------------
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