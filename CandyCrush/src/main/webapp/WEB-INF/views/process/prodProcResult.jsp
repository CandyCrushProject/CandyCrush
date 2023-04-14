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
  <div id="procInsertModal" class="w3-modal" style="z-index: 101">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span
          class="w3-button w3-display-topright"
          onclick="document.getElementById('procInsertModal').style.display='none'"
          >&times;</span
        >
        <h2 id="">작업등록</h2>
          <div class="row">
            <div class="col-md-16">
              <div class="card">
                <div class="card-action">공정작업등록
                  <button onclick="" style="display: inline;" class="cndInsBtn">작업시작</button>
                </div>
                <div class="card-content">
                  <table class="candyTab">
                    <tbody>
                      <tr>
                        <th>제품명</th>
                        <th>공정명</th>
                      </tr>
                      <tr>
                        <td><input type="text" name="" id="" value="(받아온제품명)" placeholder=""></td>
                        <td><input type="text" name="" id="" value="(받아온공정명)" placeholder=""></td>
                      </tr>
                      <tr>
                        <th>사용설비</th>
                        <td>
                          <select name="" id="">
                            <option value="설비가 여기들어갑니다~"></option>
                          </select>
                        </td>
                      </tr>
                      <tr>
                        <th>작업자</th>
                        <th>작업량</th>
                      </tr>
                      <tr>
                        <td><input type="text" name="" id="" value="" placeholder="담당자 이름"></td>
                        <td><input type="number" placeholder="작업량" name="" id="" value="" readonly></td>
                      </tr>
                      <tr>
                        <th>생산량</th>
                        <th>불량량</th>
                      </tr>
                      <tr>
                        <td><input type="number" placeholder="생산량" name="" id="" value=""></td>
                        <td><input type="number" placeholder="불량량" name="" id="" value=""></td>
                      </tr>
                      <tr>
                        <th>작업시작일</th>
                        <th>작업종료일</th>
                      </tr>
                      <tr>
                        <td><input type="datetime-local" placeholder="작업시작" name="" id=""></td>
                        <td><input type="datetime-local" placeholder="작업종료" name="" id="" ></td>
                      </tr>
                    </tbody>
                  </table>
                  <div class="table-responsive">
                    <div id="BadInputList"></div>
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
      <h1 class="page-header">생산실적</h1>
      <ol class="breadcrumb">
        <li><a href="#">candy</a></li>
        <li><a href="#">생산관리</a></li>
        <li class="active">생산실적</li>
      </ol>
    </div>
    <div id="page-inner">
      <div class="row">
        <div class="col-md-6">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">생산지시</div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="OrderListGrid"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">공정현황조회
              <button onclick=" document.getElementById('procInsertModal').style.display='block';" style="display: inline;" class="cndInsBtn">작업시작</button>
              <br>
              <div>
                <table class="candyTab">
                </table>
              </div>
            </div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="ProcessOrderGrid"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!--END row-->
      <div class="row">
        <div class="col-md-12">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">생산실적 
              <br>
              <div>
                <table class="candyTab">
                </table>
              </div>
            </div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="resultListGrid"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    <!-- /. PAGE INNER  -->
  </div>

  <script>



    function getOrderList(modCd){
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

const Grid = tui.Grid;
Grid.setLanguage('ko');
    const odList = new Grid({
      el: document.getElementById('OrderListGrid'), // Container element
      data: null,//나중에 데이타 넣어!
      columns: [
        { 
            header: '제품코드', //==========================코드숨겨놓음
            name: '',
            hidden:true,
        },
        {
          header: '제품명',
          name: '',
        },
        {
          header: '생산지시일',
          name: '',
        },
        {
          header: '생산시작일',
          name: '',
        },
        {
          header: '생산종료일',
          name: '',
        },
        {
          header: '생산진행도',
          name: '',
        },
      ],
      bodyHeight: 500,
      pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
          }
    });

    const odProcList = new Grid({
      el: document.getElementById('ProcessOrderGrid'), // Container element
      data: null,//나중에 데이타 넣어!
      columns: [

        {
          header: '공정코드', //공정코드숨겨놨음====================== 
          name: '',
          sortingType: 'asc',
          sortable: true,
          hidden: true,
        },
        {
            header: '제품코드',
            name: '',
            sortingType: 'asc',
            sortable: true,
            hidden: true,
        },
        {
          header: '제품명',
          name: '',
          sortingType: 'asc',
          sortable: true,
        },
        {
          header: '공정명',
          name: '',
          sortingType: 'asc',
          sortable: true,
        },
        {
          header: '목표생산량',
          name: '',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '생산량',
          name: '',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '불량량',
          name: '',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '총작업량',
          name: '',
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

    const odResultList = new Grid({
      el: document.getElementById('resultListGrid'), // Container element
      data: null,//나중에 데이타 넣어!
      columns: [
        {
            header: '공정실적코드', //===숨겨
            name: '',
            sortingType: 'asc',
            sortable: true,
            hidden:true
        },
        
      	{
          header: '공정지시코드',
          name: '',
          sortingType: 'asc',
          sortable: true,
          hidden:true
        },
        {
          header: '공정코드',
          name: '',
          sortable: true,
          hidden:true
        },
        {
          header: '제품코드',
          name: '',
          sortingType: 'asc',
          sortable: true,
          hidden:true
        },
        {
          header: '제품명',
          name: '',
          sortingType: 'asc',
          sortable: true,
        },
        {
          header: '공정명',
          name: '',
          sortable: true,
        },
        {
          header: '작업자',
          name: '',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '작업시작일시',
          name: '',
          sortingType: 'asc',
          sortable: true
        },
        {
          header: '작업종료일시',
          name: '',
          sortable: true
        },
        {
          header: '작업량',
          name: '',
          sortable: true
        },
        {
          header: '생산량',
          name: '',
          sortable: true
        },
        {
          header: '불량량',
          name: '',
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
  </script>
</main>
