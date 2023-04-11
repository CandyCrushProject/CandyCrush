$(document).ready(function () {
  $('#accountName').on('input', function () {
    accntSrch();
  });

  
});

let accountName = ""; // 

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
      // console.log(rej)
    }
  });
}