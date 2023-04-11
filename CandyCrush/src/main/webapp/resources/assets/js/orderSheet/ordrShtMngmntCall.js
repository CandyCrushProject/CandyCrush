$(document).ready(function () {
  $('#accountName').on('input', function () {
    accntSrch();
  });

  $('#accntMdlCaNm').on('input', function () {
    accntSrch();
  });

  $('#srchAccntBtn').on('click', function() {
    document.getElementById('accntNmMdl').style.display = 'block';
    //setTimeout(() => ordrDtilMdl.refreshLayout(), 0);
  })

  //ESC 누르면 모달창 없어지게 하는 방법
  //keydown --> 사용자가 키를 누르거나 키를 놓을 때 발생
  // $(window).on("keydown", (e) => {
  //   let ordrDtilMdl = $("#ordrDtilMdl");

  //   //e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
  //   if (e.keyCode === 27 && ordrDtilMdl.css("display") === "block") {
  //     ordrDtilMdl.hide();
  //   };
  // });
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