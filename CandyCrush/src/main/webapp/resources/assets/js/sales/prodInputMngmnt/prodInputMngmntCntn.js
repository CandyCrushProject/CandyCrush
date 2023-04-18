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
    error: function (reject) {
      console.log(reject)
    }
  });
}
prodmemberList();

// 제품입고 대기목록 데이터
const prodInputList = () => {
  $.ajax({
    url: "prodInputList",
    type: "GET",
    success: function (data) {
      // console.log(data);
      inputWaitingList.resetData(data);
    },
    error: function (error) {
      console.log(error);
    }
  });
};

let productName = "";
// 제품명 검색
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
      console.log("errorerrorerrorerrorerrorerrorerrorerror")
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
prodInputList();

//---------------------------------------------------------------------------------------------
// 제품입고 등록
function prdWtngInptProcess() {
  let rows = inputWaitingList.getCheckedRows();
  console.log(rows)
  if (rows.length != 0) {
    $.ajax({
      url: "prodWaitingListInsert",
      method: "POST",
      data: JSON.stringify(rows),
      dataType: "JSON",
      contentType: "application/json",
      success: function (data) {
        console.log("prdWtngInptProcess : ", data);
        Swal.fire({
          icon: 'success',
          title: "입고등록완료",
        });
        inputWaitingList.removeCheckedRows();
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

//---------------------------------------------------------------------------------------------
// 제품입고 등록