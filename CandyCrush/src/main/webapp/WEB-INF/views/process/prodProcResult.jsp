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
                <div class="card-action">작업시작등록
                  <td><button onclick="startInsert();" style="display: inline;" class="cndInsBtn">작업시작</button></td>
                </div>
                <div class="card-content">
                  <table class="candyTab">
                    <tbody>
                      <!-- 데이터전송용 숨겨진데이터 -->
                      <form name="startForm" action="startProg" onsubmit="return false">
                        <tr style="display: none;">
                          <input type="text" name="prcmPrcd" id="prcmPrcd" required readonly>
                          <input type="text" name="cmCd" id="cmCd" required readonly>
                          <input type="text" name="prcmCd" id="prcmCd" required readonly>
                        </tr>
                        <!-- ========================= -->
                        <tr>
                          <th>제품명</th>
                          <th>공정명</th>
                        </tr>
                        <tr>
                          <td><input type="text" name="" id="cprNm" value="(받아온제품명)" placeholder="" required readonly></td>
                          <td><input type="text" name="" id="cmNm" value="(받아온공정명)" placeholder="" required readonly></td>
                        </tr>
                        <tr>
                          <th>작업자</th>
                          <th>사용설비</th>
                        </tr>
                        <tr>
                          <td><input type="text" name="prpeMng" id="prpeMng" value="" placeholder="담당자 이름" required></td>
                          <td>
                            <select name="facCd" id="facAble">
                            </select>
                          </td>
                        </tr>
                        <tr>
                          <th>작업시작일</th>
                          <th>생산목표수량</th>
                        </tr>
                        <tr>
                          <td><input type="datetime-local" placeholder="작업시작" name="prpeWkStartDt" id="ProgStartTime" required readonly></td>
                          <td><input type="text" id="targetAmount"></td>
                        </tr>
                      </form>
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

  <!-- 작업종료 모달 -->
  <div id="procFinishModal" class="w3-modal" style="z-index: 101">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span
          class="w3-button w3-display-topright"
          onclick="document.getElementById('procFinishModal').style.display='none'"
          >&times;</span
        >
        <h2 id="">작업등록</h2>
          <div class="row">
            <div class="col-md-16">
              <div class="card">
                <div class="card-action">작업종료등록
                  <button onclick="insertResult()" style="display: inline;" class="cndInsBtn">작업완료</button>
                </div>
                <div class="card-content">
                  <table class="candyTab">
                    <tbody>
                      <tr style="display: none;">
                        <input type="text" name="prcmPrcdF" id="prcmPrcdF" required readonly>
                        <input type="text" name="prpeCdF" id="prpeCdF" required readonly>
                        <input type="text" name="cmCd" id="cmCdF" required readonly>
                      </tr>
                      <tr>
                        <th>제품명</th>
                        <th>공정명</th>
                      </tr>
                      <tr>
                        <td><input type="text" name="" id="cprNmF" value="" placeholder=""></td>
                        <td><input type="text" name="" id="cmNmF" value="" placeholder=""></td>
                      </tr>
                      <tr>
                        <th>사용설비</th>
                        <td><input type="text" id="usedFac" readonly></td>
                      </tr>
                      <tr>
                        <th>작업자</th>
                        <th>작업량</th>
                      </tr>
                      <tr>
                        <td><input type="text" name="" id="prpeMngF" value="" placeholder="담당자 이름" readonly></td>
                        <td><input type="number" placeholder="작업량" name="" id="doneQnt" value="" readonly></td>
                      </tr>
                      <tr>
                        <th>생산량</th>
                        <th>불량량(하단 불량목록에서 작성)</th>
                      </tr>
                      <tr>
                        <td><input type="number" placeholder="생산량" name="" id="makeQnt" value=""></td>
                        <td><input type="number" placeholder="불량량" name="" id="badQntF" value="" readonly></td>
                      </tr>
                      <tr>
                        <th>작업시작일</th>
                        <th>작업종료일</th>
                      </tr>
                      <tr>
                        <td><input type="datetime-local" placeholder="작업시작" name="" id="prpeWkStartDtF"></td>
                        <td><input type="datetime-local" placeholder="작업종료" name="" id="prpeWkEndDtF" ></td>
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

          <h2 id="modalCmm">불량등록</h2>
          <div class="col-md-6">
            <div class="card">
              <div class="card-action">불량항목</div>
              <div class="card-content">
                <div class="table-responsive">
                  <div id="badCdListGrid"></div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <div class="card">
                <div class="card-action">검사항목 </div>
                <div class="card-content">
                  <div class="table-responsive">
                    <div id="badCdListInsertGrid"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>



      </div>
    </div>
  </div>
  <!-- End  -->

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
        <div class="col-md-4">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">생산지시</div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="ProcOrderListGrid"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-5">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">공정현황조회
              <br>
              <div>
              </div>
            </div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="ProcessGrid"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <!-- Advanced Tables -->
          <div class="card">
            <div class="card-action">진행중 작업조회
              <br>
              <div>
                <table class="candyTab">
                </table>
              </div>
            </div>
            <div class="card-content">
              <div class="table-responsive">
                <div id="ProcessProgGrid"></div>
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




const Grid = tui.Grid;
Grid.setLanguage('ko');//생산지시 조회
    const ProcOdList = new Grid({
      el: document.getElementById('ProcOrderListGrid'), // Container element
      data: null,
      columns: [
      { 
            header: '생산지시코드', //==========================코드숨겨놓음
            name: 'prcmCd',
            hidden:true,
        },
        { 
            header: '제품코드', //==========================코드숨겨놓음
            name: 'cprCd',
            hidden:true,
        },
        {
          header: '제품명',
          name: 'cprNm',
        },
        {
          header: '생산지시일',
          name: 'prcmDt',
          formatter: function (e) {
						return dateChange(e.value);
					},
        },
        {
          header: '생산시작일',
          name: 'prcmStartDt',
          formatter: function (e) {
						return dateChange(e.value);
					},
        },
        {
          header: '생산종료일',
          name: 'prcmEndDt',
          formatter: function (e) {
						return dateChange(e.value);
					},
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
    //생산지시 리스트 불러오기
    function getProcOrderList(){
      $.ajax({
        url : "getProcCommand",
        method :"GET",
        async : false,
        dataType : "JSON",
        // data : {modCd : modCd},
        
        success : function(data){
          console.log(data);
          ProcOdList.clear();
          ProcOdList.resetData(data);
        },
        error : function(reject){
          console.log(reject);
          console.log("통신오류");
        },
      })
    }
    getProcOrderList(); //시작시조회

//====공정지시조회==================================================
    const ProcList = new Grid({
      el: document.getElementById('ProcessGrid'), // Container element
      data: null,
      columns: [
        {
          header: '공정지시코드', //공정코드숨겨놨음====================== 
          name: 'prcmPrcd',
          sortable: true,
          hidden: true,
        },
        {
          header: '공정코드', //공정코드숨겨놨음====================== 
          name: 'cmCd',
          sortable: true,
          hidden: true,
        },
        {
            header: '제품코드',
            name: 'cprCd',
            sortable: true,
            hidden: true,
        },
        {
          header: '제품명',
          name: 'cprNm',

          sortable: true,
        },
        {
          header: '공정순번',
          name: 'prcmTurn',
          sortingType: 'asc',
          sortable: true,
        },
        {
          header: '공정명',
          name: 'cmNm',
          sortable: true,
        },
        {
          header: '목표생산량',
          name: 'prcmQnt',
          sortable: true
        },
        {
          header: '생산량',
          name: 'prprQnt',
          sortable: true
        },
        {
          header: '불량량',
          name: 'prprBad',
          sortable: true
        },
        {
          header: '총작업량',
          name: 'prQntSum',
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

    // 해당 지시건 공정정보 가져오기
    function getProc(commandCD){
      console.log(commandCD);
      $.ajax({
        url : "getProc",
        method :"POST",
        async : false,
        dataType : "JSON",
        data : {prcmCd : commandCD},
        
        success : function(data){
          console.log(data);
          ProcList.resetData(data);
        },
        error : function(reject){
          console.log(reject);
          console.log("통신오류");
        },
      })
    }

    //해당 공정건 가동가능 설비 가져오기
    function getProcFac(commandCD){
      console.log(commandCD);
      $.ajax({
        url : "getProcFac",
        method :"POST",
        async : false,
        dataType : "JSON",
        data : {prcmPrcd : commandCD},
        
        success : function(data){
          console.log(data +"설비가져옴");
          ableFacData=data;

          for(i=0;i<data.length;i++){
            facAble.options[i]=new Option(data[i].facNm,data[i].facCd);
          }
        },
        error : function(reject){
          console.log(reject);
          console.log("통신오류");
        },
      })
    }

    //지시리스트에서 고르면 공정표시하기
    ProcOdList.on("dblclick", (e) => {
			const rowData = ProcOdList.getRow(e.rowKey);
			getProc(rowData.prcmCd);
      prcmCd.value = rowData.prcmCd;
		});

    //공정리스트에서 클릭하면 모달창 필요한정보 넘겨서띄우기
    ProcList.on("dblclick", (e) => {
			const rowData = ProcList.getRow(e.rowKey);
      console.log(rowData.cmCd);
      cmCd.value=rowData.cmCd;
      prcmPrcd.value=rowData.prcmPrcd;
      cprNm.value=rowData.cprNm;
      cmNm.value=rowData.cmNm;
      targetAmount.value = rowData.prcmQnt;
      resetTime(ProgStartTime);
      getProcFac(rowData.prcmPrcd);
      console.log(rowData.prcmPrcd+'이거 설비 가져와야됨');
      document.getElementById('procInsertModal').style.display='block';
		});
    //작업시작 insert
    function startInsert(){
      let startData = $("form[name=startForm]").serialize() ;
      $.ajax({
        type : 'post',
        url : 'startProg',
        data : startData,
        dataType : 'json',
        error: function(xhr, status, error){
          Swal.fire({
            icon: 'error',
						title: '경고',
						text: "입력실패",
				});
        },
        success : function(data){
          Swal.fire({
					icon: 'success',
					title: '입력완료 작업개시!',
					text: '작업코드'
				  });
          document.getElementById('procInsertModal').style.display='none';
          setTimeout(()=>getProcProg(), 100);
        }
      });
    }

//===================================================진행중인 공정 확인============
    const ProcProgList = new Grid({
      el: document.getElementById('ProcessProgGrid'), // Container element
      data: null,
      columns: [
        {
          header: '공정실적코드', //공정코드숨겨놨음====================== 
          name: 'prpeCd',
          sortable: true,
          hidden: true,
        },
        {
          header: '공정지시코드', //공정코드숨겨놨음====================== 
          name: 'prcmPrcd',
          sortable: true,
          hidden: true,
        },
        {
          header: '작업시작일시', //공정코드숨겨놨음====================== 
          name: 'prpeWkStartDt',
          sortable: true,
          hidden: true,
        },
        {
          header: '사용설비코드',
          name: 'facCd',
          sortable: true,
          hidden: true,
        },
        {
          header: '사용설비명',
          name: 'facNm',
          sortable: true,
          // hidden: true,
        },
        {
            header: '제품코드',
            name: 'cprCd',
            sortable: true,
            hidden: true,
        },
        {
          header: '제품명',
          name: 'cprNm',
          sortable: true,
        },
        {
          header: '공정명',
          name: 'cmNm',
          sortable: true,
        },
        {
          header: '작업자',
          name: 'prpeMng',
          sortable: true,
        },
        {
          header: '작업자',
          name: 'prcmQnt',
          sortable: true,
        },
      ],
      bodyHeight: 500,
      pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
          }
    });

    //진행공정현황 가져오기
    function getProcProg(){
      console.log();
      $.ajax({
        url : "getProcProg",
        method :"GET",
        async : false,
        
        success : function(data){
          ableFacData=data;
          ProcProgList.resetData(data);
        },
        error : function(reject){
          console.log(reject);
          console.log("통신오류");
        },
      })
    }
    getProcProg();

    //진행중 공정 더블클릭으로 해당공정 모달띄우기
    ProcProgList.on("dblclick", (e) => {
			const rowDataF = ProcProgList.getRow(e.rowKey);
      selectProcMtrl(rowDataF.prcmPrcd);
      //모달 정보 업데이트
      prcmPrcdF.value=rowDataF.prcmPrcd;
      prpeCdF.value=rowDataF.prpeCd;
      cmCdF.value=rowDataF.cmCd;
      cmNmF.value=rowDataF.cmNm;
      cprNmF.value=rowDataF.cprNm;
      usedFac.value=rowDataF.facNm;
      prpeMngF.value=rowDataF.prpeMng;
      prpeWkStartDtF.value =formatTimestamp(rowDataF.prpeWkStartDt);
      resetTime(prpeWkEndDtF);
      document.getElementById('procFinishModal').style.display='block';
      doneQnt.value=rowDataF.prcmQnt;//====여기수정함
      getBadCd();
      
      setTimeout(()=>refreshModalGrid(), 100);
		});

//=========================================================
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



//불량코드 리스트 그리드================================================================
const badCdList = new Grid({
      el: document.getElementById('badCdListGrid'), // Container element
      data: null,//나중에 데이타 넣어!
      columns: [
        {
            header: '불량코드', //===숨겨
            name: 'prbdCd',
            sortingType: 'asc',
            sortable: true,
            hidden:true
        },
        {
            header: '불량명', 
            name: 'prbdNm',
            sortingType: 'asc',
            sortable: true,
        },
        {
            header: '불량상세', 
            name: 'prbdCtt',
            sortingType: 'asc',
            sortable: true,
        },
      ],
      bodyHeight: 500,
      pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
          }
    });
    //모달 GRID 리프래쉬
    function refreshModalGrid(){
      badCdList.refreshLayout();
      badCdInsertList.refreshLayout();
    }
    //불량코드 리스트 불러오기
    function getBadCd(){
      $.ajax({
        url : "getBadCd",
        method :"GET",
        async : false,
        dataType : "JSON",
        
        success : function(data){
          badCdList.clear();
          badCdList.resetData(data);
        },
        error : function(reject){
          console.log(reject);
          console.log("통신오류");
        },
      })
    }

    //넣을 불량코드 그리드

    let MtrlList = [];
    const badCdInsertList = new Grid({
      el: document.getElementById('badCdListInsertGrid'), // Container element
      data: null,//나중에 데이타 넣어!
      columns: [
        {
            header: '불량코드', //===숨겨
            name: 'prbdCd',
            sortingType: 'asc',
            sortable: true,
            hidden:true
        },
        {
            header: '불량명', 
            name: 'prbdNm',
            sortingType: 'asc',
            sortable: true,
        },
        {
            header: '불량수', 
            name: 'badQnt',
            sortingType: 'asc',
            sortable: true,
            editor: 'text'
        },
        {
        header: '자재',
        name: 'cmmCd',
        formatter: 'listItemText',
        editor: {
          type: 'select',
          options: {
            listItems: MtrlList,
            }
          }
        }
      ],
      summary: {
        position: 'bottom',
        height: 20,  // by pixel
        columnContent: {
          badQnt: {
            template(valueMap) {
              return '불량합계'+valueMap.sum;
            }
          },
        }
      },
      bodyHeight: 500,
      pageOptions: {
        useClient: true,
        type: 'scroll',
        perPage: 30
          }
    });
    //불량코드 그리드 >> 블량 인서트그리드 옮겨넣기
    badCdList.on("dblclick", (e) => {
			const rowData = badCdList.getRow(e.rowKey);
			//자재목록 Grid에 행이 없으면 해당 값을 집어넣고,	
			//자재목록 Grid에 행이 하나라도 있으면 경고창을 띄운다
			if (badCdInsertList.getRow(e.rowKey) == null) {
				rowData.badQnt = 0;		//불량수량
				badCdInsertList.appendRow(rowData);
        badCdInsertList.sort("prbdNm", true); 
			} else {
				Swal.fire({
					icon: 'warning',
					title: '경고',
					text: "(" + rowData.prbdCd + ")" + rowData.prbdNm + "은(는) 이미 있습니다.",
				});
			}
		});

    //인풋리스트 변형완료했을때 보여주는값 바꿔주기위한 트리거
    makeQnt.addEventListener('input', BadInputValueEvent);
    badCdInsertList.on("editingFinish",(e)=>{
      badQntF.value = parseInt(badCdInsertList.getSummaryValues('badQnt').sum);
      makeQnt=doneQnt.value-badQntF.value//==================================★==========★==========★==========★==========★==========★==========★==========★==========★==========★==========★==========★==========★==========★
    });



    //실적 INSERT가즈아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ

    function insertResult(){
      let badData=badCdInsertList.getData();
      console.log(badData);
      if (badData.length==0)
      {
        badData=[];
        var badDataInsertData = new Object();
        console.log(prpeCdF.value);
        badDataInsertData.prpeCd=prpeCdF.value;
        badDataInsertData.prpeWkEndDt=prpeWkEndDtF.value;
        badDataInsertData.prpeProd=makeQnt.value;
        badDataInsertData.prpeBadQnt=badQntF.value;
        badDataInsertData.prpeAmntWk=doneQnt.value;
        badDataInsertData.prcmPrcd=prcmPrcdF.value;
        badData.push(badDataInsertData);
        console.log(badData);
      }
      else{
        for(let i=0;i<badData.length;i++){//최소한개의 열만들기
        console.log(prpeCdF.value);
        badData[i].prpeCd=prpeCdF.value;
        badData[i].prpeWkEndDt=prpeWkEndDtF.value;
        badData[i].prpeProd=makeQnt.value;
        badData[i].prpeBadQnt=badQntF.value;
        badData[i].prpeAmntWk=doneQnt.value;
        badData[i].prcmPrcd=prcmPrcdF.value;
        console.log(badData);
      }
    };

      console.log(badData);
      $.ajax({
        type : 'post',
        url : 'insertResult',
        contentType: 'application/json',
        data : JSON.stringify(badData),
        dataType : 'json',
        error: function(xhr, status, error){
          Swal.fire({
            icon: 'error',
						title: '경고',
						text: "입력실패",
				});
        },
        success : function(data){
          
          Swal.fire({
					icon: 'success',
					title: '입력완료 수고하셨습니다',
					text: '작업코드'
				  });
          document.getElementById('procFinishModal').style.display='none'

          setTimeout(()=>getProcProg(), 100);
          setTimeout(()=>getProc(prcmCd.value),100);
        }
      });

    }


    //사용자재 불러오기
    
    function selectProcMtrl(prcmPrcdM){
      $.ajax({
        type : 'post',
        url : 'selectProcMtrl',
        data : {prcmPrcd:prcmPrcdM},
        dataType : "JSON",
        error: function(xhr, status, error){
          Swal.fire({
            icon: 'error',
						title: '경고',
						text: "입력실패",
				});
        },
        success : function(data){
          MtrlList=[];
          for(i=0;i<data.length;i++){
            let mtrlData =new Object;
            mtrlData.text=data[i].cmmNm;
            mtrlData.value=data[i].cmmCd;
            MtrlList.push(mtrlData);
          }
          //동적칼럼 지원안한데 개시ㅏ버라버라버ㅏㄹㄹㄹㄹㄹㄹㄹㄹㄹ 
          badCdInsertList.setColumns(
                          [
                      {
                          header: '불량코드', //===숨겨
                          name: 'prbdCd',
                          sortingType: 'asc',
                          sortable: true,
                          hidden:true
                      },
                      {
                          header: '불량명', 
                          name: 'prbdNm',
                          sortingType: 'asc',
                          sortable: true,
                      },
                      {
                          header: '불량수', 
                          name: 'badQnt',
                          sortingType: 'asc',
                          sortable: true,
                          editor: 'text'
                      },
                      {
                      header: '자재',
                      name: 'cmmCd',
                      formatter: 'listItemText',
                      editor: {
                        type: 'select',
                        options: {
                          listItems: MtrlList,
                          }
                        }
                      }
                    ]
          )
        }
      });
    };



    //날짜 포메터
    function dateChange(data) {
      if(data!=null && data!=0){
      let newData = new Date(data);
      let result = newData.getFullYear() + "-" +
            (newData.getMonth() < 10
            ? "0" + (newData.getMonth() + 1)
            : newData.getMonth() + 1) +
            "-" + (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
        return result;
      }
      else return null;
		};


    //모달시간 input에 현재시간 넣기
		function resetTime(id){
      id.value=timestamp();
      console.log("reset timestamp");
    };
	  //현재시간 htmlinput format
		function timestamp(){
		    let today = new Date();
		    today.setHours(today.getHours() + 9);
		    return today.toISOString().replace('T', ' ').substring(0, 19);
		}
    function formatTimestamp(time){
      let formedTime=new Date(time);
      formedTime.setHours(formedTime.getHours() + 9);
		    return formedTime.toISOString().replace('T', ' ').substring(0, 19);
		}
  </script>
</main>
