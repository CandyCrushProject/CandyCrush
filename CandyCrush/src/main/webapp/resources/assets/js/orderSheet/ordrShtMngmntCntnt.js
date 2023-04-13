const Grid = tui.Grid;
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
//발주목록 행 더블클릭 이벤트
accntList.on('dblclick', (e) => {
  if (e.targetType != 'cell') return; // cell이 아닌타입을 클릭했을 때 종료
  const rowData = accntList.getRow(e.rowKey);
  // console.log(e, rowData);

  // Modal input내용들
  let rowDataCaNo = rowData.caNo; // 거래처 코드
  let rowDataCaNm = rowData.caNm; // 거래처명
  let rowDataCaMng = rowData.caMng; // 거래처 담당자
  let rowDataCaMngPh = rowData.caMngPh; // 거래처 담당자 번호
  $("#caNo").val(rowDataCaNo);
  $("#caNm").val(rowDataCaNm);
  $("#caMng").val(rowDataCaMng);
  $("#caMngPh").val(rowDataCaMngPh);

  document.getElementById('ordrDtilMdl').style.display = 'block';
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
  ordrProdList.on('editingFinish', (e) => {
    if (e.columnName != 'cprNm') return;
    // console.log("e", e);
    // console.log("e.columnName", e.columnName);
    let mdlRowData = ordrProdList.getRow(e.rowKey);
    // console.log("mdlRowData", mdlRowData);
    // console.log("ordrDtlCprNmData", ordrDtlCprNmData);
  });
});
//---------------------------------------------------------------------------------------------
// 그리드안에 select 배열생성
let listItems = [];

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

//---------------------------------------------------------------------------------------------
//주문서등록 
function ordrShtInsert() {
  const rows = ordrProdList.getCheckedRows();
  let caNo = $('#caNo').val(); // 거래처 코드
  let orshDt = $('#orshDt').val(); // 주문일자
  let dlvryDt = $('#dlvryDt').val(); // 납기일자
  console.log(caNo, " : caNo");
  console.log(orshDt, " : orshDt");
  console.log(dlvryDt, " : dlvryDt");
  console.log("rows", rows);
  
  if (rows.length !== 0) {
    console.log("ordrProdList.getModifiedRows", ordrProdList.getModifiedRows());
    // $.ajax({
    //   url: 'ordrShtForm',
    //   data: JSON.stringify(ordrProdList.getModifiedRows({ ignoredColumns: ['_attributes', 'rowKey'] })),
    //   contentType: 'application/json',
    //   type: 'POST',
    //   async: false,
    //   success: function (data) {
        
    //     Swal.fire({
    //       icon: 'success',
    //       title: '등록이 완료되었습니다.'
    //     });
    //   },
    //   error: function (reject) {
    //     console.log(reject);
    //   }
    // });

    // $.ajax({
    //   url: "ordrShtForm",
    //   method: "POST",
    //   data: JSON.stringify(rows),
    //   contentType: "application/json",
    //   success: function (data) {
    //     //console.log("data", data);
    //     const rowsCprNm = []; 		 // 제품명 들고옴
    //     const rowsordrDtlCnt = []; // 수량 들고옴

    //     for (let i = 0; i < data.length; i++) {
    //       rowsCprNm = rows[i].cprNm;
    //       rowsordrDtlCnt = rows[i].ordrDtlCnt
    //     }

    //     for (let i = 0; i < data.length; i++) {
    //       rowsCprNm = rows[i].cprNm;
    //       rowsordrDtlCnt = rows[i].ordrDtlCnt
    //       for(let i = 0; i < data.letgth; i++) {
    //         listItems[i] = { cprNm: data[i].cprNm, ordrDtlCnt: data[i].ordrDtlCnt };
    //       }
    //     }

    //     Swal.fire({
    //       icon: 'success',
    //       title: "주문서등록완료",
    //     });
    //   }
    // });
  } else {
    Swal.fire({
      icon: 'error',
      title: '경고',
      text: "선택된 제품이 없거나 데이터가 없습니다.",
    });
  };
}

