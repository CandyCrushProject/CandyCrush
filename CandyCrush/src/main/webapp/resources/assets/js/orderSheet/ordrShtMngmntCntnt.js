const Grid = tui.Grid;
//---------------------------------------------------------------------------------------------

//업체명, 발주신청일 시작일자, 발주신청일 종료일자
const accntGetData = (caNm = undefined, start = undefined, end = undefined) => {
  $.ajax({
    url: "ordrMngntAccntList",
    method: "POST",
    success: function (data) {
      // console.log(data);
      accntList.resetData(data);
    },
    error: function(reject) {
      // console.log(reject)
      Swal.fire({
        title: 'Error',
        icon: 'error'
      });
    }
  });
};

//업체명 modal Grid
const accntList = new Grid({
  el: document.getElementById('accntList'),
  columns: [
    {
      header: '거래처코드',
      name: 'caNo',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '거래처명',
      name: 'caNm',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '대표자',
      name: 'caCeoNm',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '담당자',
      name: 'caMng',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '담당자번호',
      name: 'caMngPh',
      sortingType: 'asc',
      sortable: true
    }
  ],
  bodyHeight: 300,
  pageOptions: {
    useClient: true,
    type: 'scroll',
    perPage: 30
  }
});
accntGetData();
//---------------------------------------------------------------------------------------------
//발주목록 행 더블클릭 이벤트
accntList.on('dblclick', (e) => {
  const rowDate = accntList.getRow(e.rowKey);

  //Modal 안에 발주코드 readonly
  let rowDateMoCd = rowDate.moCd;		//발주코드
  $("#modalMocd").val(rowDateMoCd);

  //모달창
  document.getElementById('orderDetailModal').style.display = 'block';
  //Modal Grid 빠르게 띄우는 방법
  setTimeout(() => moModal.refreshLayout(), 0);
  // $("#orderDetailModal").css("width", "99%");
  // $("#orderDetailModal").css("width", "100%");
  $.ajax({
    url: "mtrlOrderDetailList",
    method: "POST",
    dataType: "JSON",
    data: { moCd: rowDateMoCd },
    success: function (data) {
      moModal.resetData(data);
    }
  });
});
//---------------------------------------------------------------------------------------------
