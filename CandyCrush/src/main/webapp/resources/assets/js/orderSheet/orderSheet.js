//---------------------------------------------------------------------------------------------


//---------------------------------------------------------------------------------------------
// 검색 조회
let caNm = ""; // 거래처명
let orshStrDt = ""; // 시작날짜
let orshEndDt = ""; // 끝 날짜

// 검색조건 서버로 던져줌
function ordrShtSearch() {
  caNm = $("#ordrCmpnyNm").val(); // 거래처명 value
  orshStrDt = $("#selStrtDt").val(); // 시작 날짜 value
  orshEndDt = $("#selendDt").val();  // 끝나는 날짜 value
  console.log(caNm);
  console.log(orshStrDt);
  console.log(orshEndDt);
  $.ajax({
    url : "ordrShtSrch",
    method :"post",
    dataType : "JSON",
    data : {caNm : caNm, orshStrDt : orshStrDt, orshEndDt : orshEndDt},
    success : function(data) {
      // console.log(data[0]);
      if (data[0] == undefined || data[0] == null) {
        Swal.fire({
          title: '조회된 데이터가 없습니다.',
          icon: 'error'
        });
      } else {
        orderList.resetData(data);
      }
    },
  });
};

//날짜 변환
function dateChange(date) {
  let date1 = new Date(date);
  let date2 = date1.getFullYear() + '-'
    + ((date1.getMonth() < 10) ? '0' + (date1.getMonth() + 1) : (date1.getMonth() + 1)) + '-'
    + ((date1.getDate() < 10) ? '0' + date1.getDate() : date1.getDate());
  return date2;
}

