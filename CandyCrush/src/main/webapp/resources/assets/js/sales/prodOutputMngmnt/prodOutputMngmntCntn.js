let cprCdArr =[];
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
let cprCdSet = "";
// 주문서 더블 클릭시 주문서 상세조회 데이터
outputOrdrShtList.on("dblclick", (e) => {
  const rowData = outputOrdrShtList.getRow(e.rowKey);
  let orshNo = rowData.orshNo
  console.log("rowData : ", rowData);
  console.log("orshNo : ", orshNo);

  $.ajax({
    url: "OutputOrdrShtDtlList",
    method: "POST",
    data: { orshNo: orshNo },
    dataType: "JSON",
    success: function (data) {
      console.log("datadatadata", data);
      outputOrdrShtDtlList.resetData(data);
      cprCdSet = "";
      for(let i=0;i<data.length;i++){
        console.log(data[i].cprCd)
        cprCdSet += data[i].cprCd + ",";
      }
      console.log(cprCdSet);
      cprCdArr = { cprCd: cprCdSet };
      Swal.fire({
        icon: 'success',
        title: '조회완료',
        text: rowData.orshNo + ' 조회완료',
        timer: 800
      });
      cprCdSetFind();
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

function cprCdSetFind(){
  $.ajax({
    url:'cprCdSetFind',
    method:'post',
    data:JSON.stringify(cprCdArr),
    dataType: "JSON",
    contentType: "application/json",
    success: function (data) {

      prdctInstt.resetData(data);
    },
    error: function (rej) {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: rej
      });
    }
  });
}

// 주문서 더블 클릭시 주문서 상세조회 그리드
const outputOrdrShtDtlList = new Grid({
  el: document.getElementById('outputOrdrShtDtlList'),
  columns: [
    {
      header: '주문서헤더번호  ',
      name: 'orshNo',
      hidden: true,
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '주문코드',
      name: 'ordrDtlCd',
      hidden: true,
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '제품코드',
      name: 'cprCd',
      hidden: true,
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
      header: '주문수량',
      name: 'ordrDtlCnt',
      sortingType: 'asc',
      sortable: true
    },
    
    {
      header: '현재상태 ',
      name: 'orshPr',
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
  bodyHeight: 300,
  pageOptions: {
    useClient: true,
    type: 'scroll',
    perPage: 30
  }
});

const prdctInstt = new Grid({
  el: document.getElementById('prdctInstt'),
  columns: [
    {
      header: '제품코드',
      name: 'cprCd',
      hidden: true,
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
      header: '재고수량',
      name: 'sumPlsCnt',
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