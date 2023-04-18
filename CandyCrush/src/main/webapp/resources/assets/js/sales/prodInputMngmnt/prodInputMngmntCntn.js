const Grid = tui.Grid;

let memberList = []; // 그리드안에 select 배열생성
//---------------------------------------------------------------------------------------------
// select박스안에 제품명 list 내용 
function prodmemberList() {
  $.ajax({
    url: "getMemberList",
    method: "GET",
    dataType: "JSON",
    success: function (data) {
      console.log(data);
      for (let i = 0; i < data.length; i++) {
        memberList[i] = { text: data[i].memNm, value: data[i].memNm };
      }
      setTimeout(() => inputWaitingList.refreshLayout(), 0);
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
prodmemberList();

// 제품입고 대기목록 데이터
const prodInputListPage = () => {
  $.ajax({
    url: "prodInputListPage",
    type: "GET",
    success: function (data) {
      // console.log(data);
      inputWaitingList.resetData(data);
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

// 제품명 검색
let productName = "";
const prodInputSrchList = () => {
  productName = document.getElementById('productName').value;
  $.ajax({
    url: "prodInputSrchList",
    method: "POST",
    dataType: "JSON",
    data: { cprNm: productName },
    success: function (data) {
      console.log(data);
      inputWaitingList.resetData(data);
      setTimeout(() => inputWaitingList.refreshLayout(), 0);
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

// 제품입고 대기목록 그리드
const inputWaitingList = new Grid({
  el: document.getElementById('inputWaitingList'),
  rowHeaders: ['checkbox'],
  columns: [
    {
      header: '공정지시코드',
      name: 'prcmPrcd',
      hidden: true,
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '상품코드',
      name: 'cprCd',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '상품명',
      name: 'cprNm',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '상품수량',
      name: 'prprQnt',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '담당자',
      name: 'inputMng',
      editor: {
        type: 'select',
        options: {
          listItems: memberList
        },
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
prodInputListPage();

//---------------------------------------------------------------------------------------------
// 입고처리된 제품목록 데이터
const prodInputListData = () => {
  prodInputDt = document.getElementById('prodInputDt').value;
  $.ajax({
    url: "prodInputList",
    method: "GET",
    dataType: "JSON",
    
    success: function (data) {
      prodInputList.resetData(data);
      setTimeout(() => prodInputList.refreshLayout(), 0);
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

// 입고처리된 제품목록 데이터 조회 그리드
const prodInputList = new Grid({
  el: document.getElementById('prodInputList'),
  columns: [
    {
      header: '제품LOT번호',
      name: 'plsNo',
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
      header: '제품입고일자',
      name: 'pinDt',
      formatter: function (data) {
        return dateChange(data.value);
      },
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '입고수량',
      name: 'pinCnt',
      sortingType: 'asc',
      sortable: true
    },
    {
      header: '담당자',
      name: 'inputMng',
      sortingType: 'asc',
      sortable: true
    },
  ],
  bodyHeight: 700,
  pageOptions: {
    useClient: true,
    type: 'scroll',
    perPage: 30
  }
});
prodInputListData();

//---------------------------------------------------------------------------------------------
// 