const Grid = tui.Grid;

let listItems = []; // 그리드안에 select 배열생성
//---------------------------------------------------------------------------------------------
// 거래처 관리 페이지 거래처 조회
const accntGetData = () => {
  $.ajax({
    url: "ordrMngntAccntList",
    method: "POST",
    success: function (data) {
      // console.log(data);
      accntList.resetData(data);
    },
    error: function(reject) {
      console.log(reject)
    }
  });
};

// 업체명 조회 Grid
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
// 주문서 목록
const ordrShtList = () => {
  $.ajax({
    url: "ordrMngntOrdrShtList",
    method: "POST",
    success: function (data) {
      // console.log(data);
      orderList.resetData(data);
    },
    error: function (reject) {
      console.log(reject)
    }
  });
};

const orderList = new Grid({
  el: document.getElementById('orderList'), // Container element
  rowHeaders: ['checkbox'],
  columns: [
    {
      header: '주문서번호',
      name: 'orshNo',
      sortingType: 'asc',
      sortable: true
    },
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
      header: '주문일자',
      name: 'orshDt',
      formatter: function (data) {
        return dateChange(data.value);
      },
      sortingType: 'asc',
      sortable: true,
    },
    {
      header: '납기일자',
      name: 'dlvryDt',
      formatter: function (data) {
        return dateChange(data.value);
      },
    }
  ],
  bodyHeight: 500,
  pageOptions: {
    useClient: true,
    type: 'scroll',
    perPage: 30
  }
});
ordrShtList();

//---------------------------------------------------------------------------------------------
//거래처 행 더블클릭 이벤트
accntList.on('dblclick', (e) => {
  if (e.targetType != 'cell') return; // cell이 아닌타입을 클릭했을 때 종료

  ordrProdList.clear();

  const rowData = accntList.getRow(e.rowKey); // 그리드 row값
  // console.log(e, rowData);

  // Modal input내용들
  let rowDataCaNo = rowData.caNo; // 거래처 코드
  let rowDataCaNm = rowData.caNm; // 거래처명
  let rowDataCaMng = rowData.caMng; // 거래처 담당자
  let rowDataCaMngPh = rowData.caMngPh; // 거래처 담당자 번호
  
  $("#caNo").val(rowDataCaNo); // 거래처코드
  $("#caNm").val(rowDataCaNm); // 거래처명
  $("#caMng").val(rowDataCaMng); // 거래처 담당자
  $("#caMngPh").val(rowDataCaMngPh); // 거래처 담당자 번호

  document.getElementById('ordrDtilMdl').style.display = 'block';
  document.getElementById('orshNoBox').style.display = 'none';
  document.getElementById('caNoBox').style.display = 'block';
  document.getElementById('ordrShtInsert').style.display = 'block';
  document.getElementById('ordrShtSave').style.display = 'none';
  $("#orshDt").val(formatDate());
  prodListItems();

  //---------------------------------------------------------------------------------------------
  // 주문서 모달창에 입력한 숫자값을 저장함
  let beforeOrdrDtlCnt = 0;
  ordrProdList.on("editingStart", (e) => {
    beforeOrdrDtlCnt = ordrProdList.getRow(e.rowKey).ordrDtlCnt;
  });

  //---------------------------------------------------------------------------------------------
  // 주문서 모달창에 숫자아닌 문자를 입력했을때 경고창 띄움
  ordrProdList.on('editingFinish', (e) => {
    if (e.columnName != 'ordrDtlCnt' ) return;

    let mdlRowData = ordrProdList.getRow(e.rowKey);
    let ordrDtlCntData = Number(mdlRowData.ordrDtlCnt);
    if (isNaN(ordrDtlCntData)) {
      setTimeout(() => {
        Swal.fire({
          icon: 'error',
          title: '경고',
          text: '숫자만 입력 가능합니다',
        });
        ordrProdList.setValue(e.rowKey, 'ordrDtlCnt', beforeOrdrDtlCnt);
        return;
      }, 9);
    } 
    if (ordrDtlCntData == 0) {
      setTimeout(() => {
        Swal.fire({
          icon: 'error',
          title: '경고',
          text: '수량을 확인하세요',
        });
        ordrProdList.setValue(e.rowKey, 'ordrDtlCnt', beforeOrdrDtlCnt);
        return;
      }, 10);
    }
  });
  //---------------------------------------------------------------------------------------------
  // 주문서 모달창에 제품선택을 안했을때 경고창 띄움
  // ordrProdList.on('editingFinish', (e) => {
  //   if (e.columnName != 'cprNm') return;
  //   let mdlRowData = ordrProdList.getRow(e.rowKey);
  //   console.log("mdlRowData", mdlRowData)
  //   let ordrCprNm = mdlRowData.cprNm;
  //   if (ordrCprNm == "" || ordrCprNm == null || ordrCprNm == undefined) {
  //     setTimeout(() => {
  //       Swal.fire({
  //         icon: 'error',
  //         title: '경고',
  //         text: '상품을 선택하세요',
  //       });   
  //       return;
  //     }, 9);
  //   }
  // });
});

// 주문서 조회 더블클릭시 열리는 상세조회 모달창
orderList.on('dblclick', (e) => {
  if (e.targetType != 'cell') return;
  const rowData = orderList.getRow(e.rowKey);

  const rowDataOrshNo = rowData.orshNo; // 주문서번호
  const rowDataCaNm = rowData.caNm; // 거래처명
  const rowDataOrshDt = rowData.orshDt; // 주문일자
  const rowDataDlvryDt = rowData.dlvryDt; // 납기일자

  $("#orshNo").val(rowDataOrshNo); // 주문서번호
  $("#caNm").val(rowDataCaNm); // 거래처명
  
  $("#orshDt").val(dateChange(rowDataOrshDt)); // 주문일자
  $("#dlvryDt").val(dateChange(rowDataDlvryDt)); // 납기일자
  

  document.getElementById('ordrDtilMdl').style.display = 'block'; // 모달창 띄움
  document.getElementById('orshNoBox').style.display = 'block'; // 주문서 헤더 코드 보여줌
  document.getElementById('caNoBox').style.display = 'none'; // 거래처코드 숨김
  document.getElementById('ordrShtInsert').style.display = 'none'; // 등록버튼 숨김
  document.getElementById('ordrShtSave').style.display = 'block'; // 저장버튼 보여줌
  // select박스안에 제품명 list 내용 

  // 주문서관리페이지 주문서 상세조회 모달창
  function getOrdrShtDtlList() {
    $.ajax({
      url: "getOrdrShtDtlList",
      method: "GET",
      data : { orshNo : rowDataOrshNo,  },
      dataType: "JSON",
      success: function (data) {
        console.log(data);
        console.log("caMng", data[0].caMng);
        console.log("caMngPh", data[0].caMngPh);

        $("#caMng").val(data[0].caMng); // 담당자
        $("#caMngPh").val(data[0].caMngPh); // 담당자번호

        ordrProdList.resetData(data);
        setTimeout(() => ordrProdList.refreshLayout(), 0);
      },
      error: function (reject) {
        console.log(reject)
      }
    });
  }

  getOrdrShtDtlList();
});

//---------------------------------------------------------------------------------------------

// select박스안에 제품명 list 내용 
function prodListItems() {
  $.ajax({
    url: "getProdList",
    method: "GET",
    dataType: "JSON",
    success: function (data) {
      // console.log(data);
      for (let i = 0; i < data.length; i++) {
        listItems[i] = { text: data[i].cprNm, value: data[i].cprNm };
      }
      setTimeout(() => ordrProdList.refreshLayout(), 0);
    },
    error: function (reject) {
      console.log(reject)
    }
  });
}

// 주문서 모달창 주문서detail Grid
const ordrProdList = new Grid({
  el: document.getElementById('ordrProdList'),
  rowHeaders: ['checkbox'],
  columns: [
    {
      header: '제품명',
      name: 'cprNm',
      editor: {
        type: 'select',
        options: {
          listItems
        },
      },
      sortingType: 'asc',
      sortable: true,
    },
    {
      header: '수량',
      name: 'ordrDtlCnt',
      editor: 'text' ,
      validation : {
        dataType : 'number'
      },
      sortingType: 'asc',
      sortable: true,
    },
  ],
  bodyHeight: 300,
  pageOptions: {
    useClient: true,
    type: 'scroll',
    perPage: 30
  }
});

// $('grid').mouseleave(ev => {
//   ordrProdList.finishEditing();
// });

//---------------------------------------------------------------------------------------------
//주문서등록 + 수정 + 삭제
function ordrShtInsert() {
  const rows = ordrProdList.getModifiedRows({ignoredColumns: ['_attributes', 'rowKey']}).createdRows;
  const updateRows = ordrProdList.getModifiedRows({ignoredColumns: ['_attributes', 'rowKey']}).updatedRows;
  const deleteRows = ordrProdList.getModifiedRows({ignoredColumns: ['_attributes', 'rowKey']}).deletedRows;

  if (rows.length !== 0) {
    $.ajax({
      url: "ordrShtForm",
      method: "POST",
      data: JSON.stringify({
        dataHd : serializeObject($('#frmOrdrShtInsert').serializeArray()),
        data : rows,
        updateRows : updateRows,
        deleteRows : deleteRows,
      }),
      contentType: "application/json",
      success: function (response) {
        console.log("ordrShtFormdata : ", response);
        Swal.fire({
          icon: 'success',
          title: "주문서등록완료",
        });
      }
    });
  } else {
    Swal.fire({
      icon: 'error',
      title: '경고',
      text: "선택된 제품이 없거나 데이터가 없습니다.",
    });
  };
}

