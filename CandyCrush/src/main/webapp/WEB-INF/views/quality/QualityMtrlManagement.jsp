<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
  #companyName {
    cursor: pointer;
  }
  #modalMocd {
    background-color: rgb(233, 233, 233);
    border: 0 !important;
    border-radius: 15px;
    width: 200px !important;
    height: 32px;
    padding-left: 20px;
  }
  #rigth {
    float: right;
    position: relative;
    bottom: 25px;
  }
</style>

<main>

  <!-- 등록 모달 -->
  <div id="inspInsertModal" class="w3-modal" style="z-index: 101">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span
          class="w3-button w3-display-topright"
          onclick="document.getElementById('inspInsertModal').style.display='none'"
          >&times;</span
        >
        <h2 id="modalCmm">검사등록</h2>
          <div class="row">
            <div class="col-md-6">
              <div class="card">
                <div class="card-action">검사항목</div>
                <div class="card-content">
                  <table class="candyTab">
                    <tr>
                      <th>담당자</th>
                      <th>정상자재</th>
                      <th>불량자재</th>
                      <th>검사량</th>
                    </tr>
                    <tr>
                      <td><input type="text" readonly name="inspMgr" id="inspMgr" value="" placeholder="담당자 이름"></td>
                      <td><input type="number" placeholder="정상자재수 입력" name="passMat" id="passMat" value="0"></td>
                      <td><input type="number" placeholder="불량자재" name="badMat" id="badMat" readonly></td>
                      <td><input type="text" name="inspMat" id="inspMat" value=""  readonly></td>
                    </tr>
                  </table>
                  <div class="table-responsive">
                    <div id="BadInputList"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card">
                <div class="card-action">불량항목</div>
                <div class="card-content">
                  <div class="table-responsive">
                    <div id="BadCodeList"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>
  <!-- End 자재발주조회 더블클릭하면 나오는 모달 -->

  <!-- /. NAV SIDE  -->
  <div id="page-wrapper">
    <div class="header">
      <h1 class="page-header">자재발주조회</h1>
      <ol class="breadcrumb">
        <li><a href="#">candy</a></li>
        <li><a href="#">자재관리</a></li>
        <li class="active">자재발주조회</li>
      </ol>
    </div>

    <div id="page-inner">
      <div class="row">
        <div class="col-md-12">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">자재발주조회</div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="OrderListGrid"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--END row-->

      <div class="row">
        <!-- <div class="col-md-6">
          <div class="card">
            <div class="card-action">재재검사현황</div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="testStat"></div>
              </div>
            </div>
          </div>
        </div> -->

        <div class="col-md-12">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">자재검사이력
              <br>
              <button onclick="openInsertModal()" style="display: inline;" class="cndInsBtn">점검내역입력</button>
              <div>
                <table class="candyTab">
                  <tr>
                    <th>자재명</th>
                    <td id="sumNm"></td>
                    <th>발주량</th>
                    <td id="sumMoCnt"></td>
                  </tr>
                  <tr>
                    <th>검사</th>
                    <td id="sumMoTest"></td>
                    <th>검사대기</th>
                    <td id="sumMoWait"></td>
                  </tr>
                </table>
              </div>
            </div>
            
            <div class="card-content">
              <div class="table-responsive">
                <div id="testList"></div>
              </div>
            </div>
          </div>
        </div>
        
      </div>
      </div>
    <!-- /. PAGE INNER  -->
  </div>

  <script>


    function openInsertModal(){
      document.getElementById('inspInsertModal').style.display='block';
      BadCodeList.refreshLayout();
      BadInputList.refreshLayout();

    }
    //-발주목록 검사현황================================================================
      const Grid = tui.Grid;
      let orderData = [
        <c:forEach items="${OrderList}" var="item">
          {
            moCd:'${item.moCd}',
            modCd:'${item.modCd}',
            moTitle:'${item.moTitle}',
            moReoDt:"<fmt:formatDate value="${item.moReoDt}" pattern="yyyy-MM-dd"/>",
            moReqDt:"<fmt:formatDate value="${item.moReqDt}" pattern="yyyy-MM-dd"/>",
            cmmCd:'${item.cmmCd}',
            cmmNm:'${item.cmmNm}',
            moCnt:'${item.moCnt}',
            caNo:'${item.caNo}',
            caNm:'${item.caNm}',
            inspProc:'${item.inspProc}',
            inspDone: (('${item.moCnt}' - '${item.inspProc}')<=0)?'완료':'진행중' ,
          },
        </c:forEach>
      ];

      const odList = new Grid({
      el: document.getElementById('OrderListGrid'), // Container element
      data: orderData,
      columns: [
      {
          header: '발주상세코드',
          name: 'modCd',
          sortingType: 'asc',
          sortable: true,
          hidden: true
        },
        {
          header: '발주명',
          name: 'moTitle',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '발주처',
          name: 'caNm',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '발주요청일',
          name: 'moReoDt',
          sortable: true
        },
        {
          header: '납기요청일',
          name: 'moReqDt',
          sortable: true
          
        },
        {
          header: '자재명',
          name: 'cmmNm',
          sortable: true
        },
        {
          header: '발주량',
          name: 'moCnt',
          sortable: true
        },
        {
          header: '검사완료량',
          name:'inspProc',
          sortable: true
        },
        {
          header: '검사진행도',
          name:'inspDone',
          sortable: true
        }
      ],
      bodyHeight: 500,
      pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
          }
    });
    console.log(orderData);
    //==========================불량코드그리드====================================
    let BadCodeData = [
        <c:forEach items="${BadList}" var="item">
          {
            cmbCd:'${item.cmbCd}',
            cmbNm:'${item.cmbNm}',
            cmbCtt:'${item.cmbCtt}', 
          },
        </c:forEach>
      ];
      console.log(BadCodeData);
      const BadCodeList = new Grid({
      el: document.getElementById('BadCodeList'), // Container element
      data: BadCodeData,
      columns: [
        {
          header: '불량코드',
          name: 'cmbCd',
          sortingType: 'asc',
          sortable: true,
        },
        {
          header: '불량명',
          name: 'cmbNm',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '불량상세',
          name: 'cmbCtt',
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
    BadCodeList.on("dblclick", (e) => {
			const rowData = BadCodeList.getRow(e.rowKey);
			//자재목록 Grid에 행이 없으면 해당 값을 집어넣고,	
			//자재목록 Grid에 행이 하나라도 있으면 경고창을 띄운다
			if (BadInputList.getRow(e.rowKey) === null) {
				rowData.miCnt = 0;							//불량수량
				BadInputList.appendRow(rowData);
        BadInputList.sort("cmbCd", true); 
			} else {
				Swal.fire({
					icon: 'warning',
					title: '경고',
					text: "(" + rowData.cmbCd + ")" + rowData.cmbNm + "은(는) 이미 있습니다.",
				});
			}
		});
    


    //불량 insert용 그리드================================================================
    const BadInputList =new Grid({
      el: document.getElementById('BadInputList'), // Container element
      data: null,
      bodyHeight: 500,
      editingEvent: 'click',
      pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
          },
      columns: [
        {
          header: '불량코드',
          name: 'cmbCd',
          sortingType: 'asc',
          sortable: true,
        },
        {
          header: '불량명',
          name: 'cmbNm',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '수량',
          name: 'miCnt',
          sortable: true,
          editor:'text'
        },
      ],
      summary: {
        position: 'bottom',
        height: 20,  // by pixel
        columnContent: {
          miCnt: {
            template(valueMap) {
              return '불량합계'+valueMap.sum;
            }
          },
        }
      }
    });
    BadInputList.on("dblclick", (e)=>{
      BadInputList.removeRow(e.rowKey);
    })
    //인풋리스트 변형완료했을때 보여주는값 바꿔주기위한 트리거
    passMat.addEventListener('input', BadInputValueEvent);
    BadInputList.on("editingFinish",(e)=>{
      BadInputValueEvent();
    });

    //value값 바뀔때마다 호출할 event
    function BadInputValueEvent(){
      inspMat.value = parseInt(BadInputList.getSummaryValues('miCnt').sum)+parseInt(passMat.value);
      badMat.value = parseInt(BadInputList.getSummaryValues('miCnt').sum);
    }
    //================================================================



    //데이터 옮기기용 전역 변수
    let PubCmmNm = null; //자재명
    let PubMiCnt = null; //검사한양
    let pubMoCnt = null; //주문양

    //odlist 클릭한 행의 modcd값 담기
    odList.on("dblclick", (e) => {
			const rowData = odList.getRow(e.rowKey);
      let selectedModCd=rowData.modCd;
      PubCmmNm = rowData.cmmNm;
      pubMoCnt = rowData.moCnt;
      //클릭한 항목의 검사이력 가져오기
      getTestList(selectedModCd);
      console.log(selectedModCd);
		});


    //--Ajax 검사리스트 호출
    function getTestList(modCd){
			$.ajax({
				url : "MtTestSearch",
				method :"POST",
        async : false,
				dataType : "JSON",
				data : {modCd : modCd},
				success : function(data){
					console.log(data);
          testList.clear();
					testList.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("통신오류");
				},
			})
      setTimeout(function(){setSumHeader()}, 300);
		}
    //검사summary 헤더 갱신
    function setSumHeader(){
    sumNm.innerText = PubCmmNm;
    sumMoCnt.innerText = pubMoCnt;
    sumMoTest.innerText = PubMiCnt;
    sumMoWait.innerText = pubMoCnt-PubMiCnt;
    modalCmm.innerText=PubCmmNm+'검사등록';
    }

    
    
    
    //--검사리스트--
    
    const testList = new Grid({
      el: document.getElementById('testList'), // Container element
      data: null,
      bodyHeight: 500,
      pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
          },
      columns: [
        {
          header: '검사코드',
          name: 'miCd',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '검사일',
          name: 'miDt',
          sortable: true,
          formatter: function (e) {
				return dateChange(e.value);
			},
        },
        {
          header: '담당자',
          name: 'miMng',
          sortable: true
        },
        {
          header: '검사수량',
          name: 'miCnt',
          sortable: true
          
        },
        {
          header: '불량수량',
          name: 'miBadCnt',
          sortable: true
        },
        {
          header: '합격수량',
          name: 'miPassCnt',
          sortable: true
        },
      ],
      summary: {
        position: 'bottom',
        height: 100,  // by pixel
        columnContent: {
          miCnt: {
            template(valueMap) {
              PubMiCnt=valueMap.sum;
              return '검사합계'+valueMap.sum;
            }
          },
          miBadCnt: {
            template(valueMap) {
              return '불량합계'+valueMap.sum;
            }
          },
          miPassCnt:{
            template(valueMap) {
              return '합격합계'+valueMap.sum;
            }
          }
        }
      }
      
    });
    
    
    
    
    
	//날짜변환 함수
	function dateChange(data) {
	let newData = new Date(data);
	let result = newData.getFullYear() + "-" +
				(newData.getMonth() < 10
				? "0" + (newData.getMonth() + 1)
				: newData.getMonth() + 1) +
				"-" + (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
		return result;
}
  </script>
</main>
