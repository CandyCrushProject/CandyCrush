const Grid = tui.Grid;
//---------------------------------------------------------------------------------------------
// 출고관리 주문서 목록 데이터
const outputOrdrShtListData = () => {
  $.ajax({
    url: "OutputOrdrShtList",
    method: "GET",
    success: function (data) {
      console.log(data);
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
outputOrdrShtListData();

//---------------------------------------------------------------------------------------------
// 거래처명 검색
let accountName = "";
const prodInputSrchList = () => {
  accountName = document.getElementById('accountName').value;
  $.ajax({
    url: "ordrMngntAccntSrch",
    method: "POST",
    data: { caNm: accountName },
    dataType: "JSON",

    success: function (data) {
      console.log(data);
      outputOrdrShtList.resetData(data);
      setTimeout(() => outputOrdrShtList.refreshLayout(), 0);
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

// 출고관리 주문서 목록 그리드
const outputOrdrShtList = new Grid({
  el: document.getElementById('outputOrdrShtList'),
  columns: [
    {
      header: '주문서번호',
      name: 'orshNo',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '제품건수?',
      name: 'ordrDtlCnt',
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
      sortable: true
    },
    {
      header: '납기일자',
      name: 'dlvryDt',
      formatter: function (data) {
        return dateChange(data.value);
      },
      sortingType: 'asc',
      sortable: true
    },
    
  ],
  bodyHeight: 300,
  pageOptions: {
    useClient: true,
    type: 'scroll',
    perPage: 30
  }
});

// 주문서 더블 클릭시 주문서 상세조회 데이터
outputOrdrShtList.on("dblclick", (e) => {
  const rowData = outputOrdrShtList.getRow(e.rowKey);
  let orshNo = rowData.orshNo
  console.log("rowData : ", rowData);
  console.log("orshNo : ", orshNo);

  $.ajax({
    url: "OutputOrdrShtList",
    method: "POST",
    data: { orshNo: accountName },
    dataType: "JSON",
    success: function (data) {
      console.log(data);
      outputOrdrShtDtlList.resetData(data);
    },
    error: function (rej) {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: rej
      });
    }
  });
});

// 주문서 더블 클릭시 주문서 상세조회 그리드
const outputOrdrShtDtlList = new Grid({
  el: document.getElementById('outputOrdrShtDtlList'),
  columns: [
    {
      header: '주문서헤더번호  ',
      name: 'orshNo',
      //hidden: true,
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '주문코드',
      name: 'ordrDtlCd',
      //hidden: true,
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '주문수량',
      name: 'ordrDtlCnt',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '제품명',
      name: 'cprNm',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '현재상태 ',
      name: 'orshPr',
      formatter: function (data) {
        return dateChange(data.value);
      },
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '상태변경일자 ',
      name: 'sttCngDt',
      formatter: function (data) {
        return dateChange(data.value);
      },
      sortingType: 'asc',
      sortable: true
    },

  ],
  bodyHeight: 500,
  pageOptions: {
    useClient: true,
    type: 'scroll',
    perPage: 30
  }
});