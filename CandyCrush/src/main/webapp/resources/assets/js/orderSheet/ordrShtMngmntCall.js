$(document).ready(function () {
  $('#accountName').on('input', function () {
    accntSrch();
  });

  $('#accntMdlCaNm').on('input', function () {
    accntSrch();
  });

  $('#srchAccntBtn').on('click', function() {
    document.getElementById('accntNmMdl').style.display = 'block';
    setTimeout(() => ordrDtilMdl.refreshLayout(), 0);
  })

  // ESC 누르면 모달창 없어짐
  $(window).on("keydown", (e) => {
    let ordrDtilMdl = $("#ordrDtilMdl");

    //e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
    if (e.keyCode === 27 && ordrDtilMdl.css("display") === "block") {
      ordrDtilMdl.hide();
    };
  });

  $('#getRowBtn').on('click', () => {
    ordrProdList.appendRow();
  });
  $('#delRowBtn').on('click', () => {
    ordrProdListxw.removeCheckedRows();
  })

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
      Swal.fire({
        title: 'Error',
        icon: 'error'
      });
    }
  });
}

// 현재날짜
function formatDate() {
  let date = new Date();
  let year = date.getFullYear();
  let month = ("0" + (date.getMonth() + 1)).slice(-2);
  let day = ("0" + date.getDate()).slice(-2);
  let formattedDate = year + "-" + month + "-" + day;
  return formattedDate;
}

// function getOrdrShtInfo() {
//   $.ajax({
//     url: 'insertPrcs',
//     data: JSON.stringify(grid.getModifiedRows({ignoredColumns: ['_attributes', 'rowKey']})),
//     contentType : 'application/json',
//     type: 'POST',
//     async: false,
//     success: function(data) {
//       search();
//     },
//     error: function(reject) {
//         console.log(reject);
//     }
//   });
// }
