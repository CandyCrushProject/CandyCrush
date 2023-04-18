$(document).ready(function () {
  // 제품명 검색
  $('#productName').on('input', function () {
    prodInputSrchList();
  });

  // 제품입고
  $('#prdWtngBtn').on('click', function() {
    inputWaitingList.blur();
    prdWtngInptProcess();
  });

  // 제품날짜별 입고된 목록 조회
  $('#prodInputDt').on('change', function() {
    prodInputListSrchDt();
  });

  // 입고처리된 목록 행 더블클릭
  accntList.on('dblclick', (e) => {
    if (e.targetType != 'cell') return;
  });
});
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
// 제품입고 등록
function prdWtngInptProcess() {
  let rows = inputWaitingList.getCheckedRows();
  console.log(rows)
  if (rows.length != 0) {
    $.ajax({
      url: "prodWaitingListInsert",
      method: "POST",
      data: JSON.stringify(rows),
      dataType: "JSON",
      contentType: "application/json",
      success: function (data) {
        Swal.fire({
          icon: 'success',
          title: "입고등록완료",
        });
        inputWaitingList.removeCheckedRows();
      },
      error: function (rej) {
        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: rej
        });
      }
    });
  } else {
    Swal.fire({
      icon: 'warning',
      title: '경고',
      text: "선택된 제품이 없거나 데이터가 없습니다.",
    });
  };
}

//---------------------------------------------------------------------------------------------
// 입고처리된 제품목록 데이터 날짜별로 조회
function prodInputListSrchDt() {
  $.ajax({
    url: "prodInputListSrchDt",
    method: "POST",
    data: { pinDt: prodInputDt },
    contentType: "application/json",
    success: function (data) {
      console.log("prodInputListSrchDt : ", data);
      if (data.length != 0) {
        Swal.fire({
          icon: 'success',
          title: prodInputDt + "조회완료",
        });
        setTimeout(() => inputWaitingList.refreshLayout(), 0);
        prodInputList.resetData(data);
      } else {
        Swal.fire({
          icon: 'error',
          title: '경고',
          text: "해당 날짜에 데이터가 없습니다.",
        });
      }
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
// 입고처리된 목록 행 더블클릭
function prodInputLotList() {
  

} 