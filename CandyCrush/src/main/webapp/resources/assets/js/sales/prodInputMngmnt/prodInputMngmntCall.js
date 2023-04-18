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
});

//---------------------------------------------------------------------------------------------
// 제품입고 등록

