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
//발주목록 행 더블클릭 이벤트
accntList.on('dblclick', (e) => {
  if (e.targetType != 'cell') return; // cell이 아닌타입을 클릭했을 때 종료
  const rowData = accntList.getRow(e.rowKey);
  console.log(e, rowData);

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

  // 모달창 띄웠을때 미리 입력되는 주문서 번호
  $.ajax({
    url: "getOrdrShtCode",
    method: "GET",
    success: function (data) {
      $("#orshDt").val(formatDate());
      prodListItems();
    },
    error: function(reject) {
      console.log(reject)
    }
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
    //data: { ordrDtlCnt: ordrDtlCnt },
    success: function (data) {
      //console.log('data:', data[0].cprNm);
      //console.log(data.length);
      for (let i = 0; i < data.length; i++) {
        listItems[i] = { text: data[i].cprNm, value: data[i].cprNm };
      }
      //ordrProdList.resetData(data);
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
    // {
    //   header: '주문상세코드',
    //   name: 'ordrDtlCd',
    //   sortingType: 'asc',
    //   sortable: true,
    //   hidden: true
    // },
    {
      header: '제품명',
      name: 'cprNm',
      editor: {
        type: 'select',
        options: {
          listItems
        }
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



