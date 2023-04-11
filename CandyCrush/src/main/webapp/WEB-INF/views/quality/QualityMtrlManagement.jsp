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
  <!-- 업체명 검색 모달 -->
  <div id="modal" class="w3-modal" style="z-index: 100">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span
          class="w3-button w3-display-topright"
          onclick="document.getElementById('modal').style.display='none'"
          >&times;</span
        >
        <h3>업체검색</h3>
        <div>
          <input
            type="text"
            id="modalCaNm"
            placeholder="업체명"
            style="width: 90%"
            autocomplete="off"
          />
          <br />
          <input
            type="text"
            id="modalCaCd"
            placeholder="업체코드"
            style="width: 90%"
            autocomplete="off"
          />
          <button class="srchBtn" id="modalBtn">
            <i class="fa-solid fa-magnifying-glass"></i>
          </button>
        </div>
        <div id="caModal"></div>
      </div>
    </div>
  </div>
  <!-- End 업체명 검색 모달 -->

  <!-- 자재발주조회 더블클릭하면 나오는 모달 -->
  <div id="orderDetailModal" class="w3-modal" style="z-index: 101">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span
          class="w3-button w3-display-topright"
          onclick="document.getElementById('orderDetailModal').style.display='none'"
          >&times;</span
        >
        <h3>상세발주목록</h3>
        <div style="clear: both"></div>
        <div id="rigth">
          <button type="button" id="excelBtn" class="cndInsBtn">EXCEL</button>
          <button type="button" id="dateUpdateBtn" class="cndUdtBtn">
            수정
          </button>
        </div>
        <label for="modalMocd">발주코드</label>
        <input type="text" id="modalMocd" style="width: 90%" readonly />
        <div id="moModal"></div>
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
            <!--<div class="card-action">자재발주조회</div>-->
            <div class="card-content">
              <div id="inputReset">
                <label>업체명</label>
                <input
                  type="text"
                  id="companyName"
                  style="
                    width: 315px;
                    border: 1px solid rgba(128, 128, 128, 0.61);
                  "
                  autocomplete="off"
                />
                <br />
                <label>발주신청일</label>
                <input
                  type="date"
                  id="startDate"
                  style="
                    width: 140px;
                    border: 1px solid rgba(128, 128, 128, 0.61);
                  "
                />&nbsp;ㅡ&nbsp;
                <input
                  type="date"
                  id="endDate"
                  style="
                    width: 140px;
                    border: 1px solid rgba(128, 128, 128, 0.61);
                  "
                />&nbsp;&nbsp;&nbsp;
                <button
                  type="button"
                  class="cndSrchBtn"
                  id="mtrlOrderSeachBtn"
                  onclick="search()"
                >
                  검색
                </button>
                <button type="button" class="cndRstBtn" id="restBtn">
                  초기화
                </button>
              </div>
              <div style="clear: both"></div>
            </div>
          </div>
        </div>
      </div>
      <!--END row-->
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

    //-발주목록
      const Grid = tui.Grid;
      let orderData = [
        <c:forEach items="${OrderList}" var="item">
          {
            moCd:'${item.moCd}',
            cmmCd:'${item.cmmCd}',
            cmmNm:'${item.cmmNm}',
            moCnt:'${item.moCnt}',
            cmmTyp:'${item.cmmTyp}',
            cmmSpec:'${item.cmmSpec}',
            cmmUnit:'${item.cmmUnit}',
            caNo:'${item.caNo}',
            moReqDt:"<fmt:formatDate value="${item.moReqDt}" pattern="yyyy-MM-dd"/>",
          },
        </c:forEach>
      ];

      const odList = new Grid({
      el: document.getElementById('OrderListGrid'), // Container element
      data: orderData,
      columns: [
        {
          header: '발주코드',
          name: 'moCd',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '자재코드',
          name: 'cmmCd',
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
          header: '자재유형',
          name: 'cmmTyp',
          sortable: true
        },
        {
          header: '자재규격',
          name: 'cmmSpec',
          sortable: true
        },
        {
          header: '자재단위',
          name: 'cmmUnit',
          sortable: true
        },
        {
          header: '거래처코드',
          name: 'caNo',
          sortable: true
        },
        {
          header: '납기요청일',
          name: 'moReqDt',
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
      console.log(orderData);
    //데이터 옮기기용 전역 변수
    let CMMNM = null;//발주제품명
    let MOCNT = null;//발주수량 
    let MOTESTED=null;//검사한수량


    //--Ajax 검사리스트 호출
    //odlist 클릭한 행의 mocd값 담기
    
    odList.on("dblclick", (e) => {
			const rowData = odList.getRow(e.rowKey);
      let selectedMoCd=rowData.moCd;
      CMMNM=rowData.cmmNm;
      MOCNT=rowData.moCnt;
      getTestList(selectedMoCd);
      console.log(selectedMoCd);
		});

    
    function getTestList(moCd){
			$.ajax({
				url : "MtTestSearch",
				method :"POST",
        async : false,
				dataType : "JSON",
				data : {moCd : moCd},
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
      setTimeout(function() { insertHeaderSum()}, 300);
		}
    function insertHeaderSum(){
      sumNm.innerText = CMMNM;
      sumMoCnt.innerText = MOCNT;
      sumMoTest.innerText = MOTESTED;
      sumMoWait.innerText = MOCNT-MOTESTED;
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
        {
          header: '자재발주코드',
          name: 'moCd',
          sortable: true
        },
        {
          header: '검사진행도',
          name: 'miNote',
          sortable: true
        },
      ],
      summary: {
        position: 'bottom',
        height: 100,  // by pixel
        columnContent: {
          miCnt: {
            template(valueMap) {
              MOTESTED=valueMap.sum;
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
