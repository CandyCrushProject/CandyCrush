$(document).ready(function () {
  // 거래처 검색
  $('#accountName').on('input', function () {
    prodInputSrchList();
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

// 거래처명 검색
let accountName = "";
const prodInputSrchList = () => {
  accountName = document.getElementById('accountName').value;
  $.ajax({
    url: "OutputOrdrShtSrchList",
    method: "POST",
    data: { caNm : accountName },
    dataType: "JSON",
    success: function (data) {
      outputOrdrShtList.resetData(data);
    },
    error: function (rej) {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: rej
      });
    }
  });
};

//---------------------------------------------------------------------------------------------