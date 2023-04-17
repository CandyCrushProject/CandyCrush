<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	.tui-grid-cell.cell-green {background-color: rgba(118, 228, 118, 0.575)}
	.tui-grid-cell.cell-weight {font-weight: bold;}
</style>
<main>
	<!-- 주의사항 -->
	<!-- id와 class는 그대로 진행할 것 -->
	<!-- Style 입혀놔서 변경하면 css가 깨질 수 있음 -->

    <!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">제품검사관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">품질관리</a></li>
				<li class="active">제품검사관리</li>
			</ol>
		</div>

		<!-- 생산완료제품 검색 모달 -->
		<div id="prodModal" class="w3-modal" style="z-index: 100;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('prodModal').style.display='none'">&times;</span>
					<h3>생산완료제품 조회</h3>
					<div id="prodModalGrid"></div>
				</div>
			</div>
		</div><!-- End 생산완료제품 검색 모달 -->

		<!-- 검사등록 모달 -->
		<div id="inspModal" class="w3-modal" style="z-index: 100;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('inspModal').style.display='none'">&times;</span>
					<h3>검사등록</h3>
					<div style="text-align: center;">
						<label for="inspDt">검사일자</label>
						<input type="date" id="inspDt" style="width: 250px;">
						<label for="mng">작업자</label>
						<input type="text" id="mng" autocomplete="off" style="width: 250px;">
						<br/>
						<label for="process">설비</label>
						<input type="text" id="process" autocomplete="off" style="width: 250px;">
						<label for="inspCnt">검사량</label>
						<input type="number" id="inspCnt" style="width: 250px;">
						<!--<button class="srchBtn" id="mtrlOrdermodalBtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>-->
					</div>
					<hr/>
					<div id="inspInsert" style="float: left; width: 300px; margin-left: 20px;"></div>
					<div style="clear:both"></div>
					<div id="qualityProdInspInsertModal">
						<button type="button" class="cndInsBtn">검사시작</button>
						<input type="text" class="inspInputStyle" style="margin-right: 10px;">
						<button type="button" class="cndDelBtn">검사종료</button>
						<input type="text" class="inspInputStyle">
						<br/>
						<span style="margin-right: 20px;">불량등록</span>
						<input type="number" min="0" value="0" id="badInsert">
						<button type="button" id="" class="cndDelBtn">불량(+)</button>
						<button type="button" id="" class="cndInsBtn">불량(-)</button>
					</div>
					<hr/>
					<div class="mtrlOrderRightBtn" style="left:380px;">
						<button type="button" id="" class="cndRstBtn">검사등록</button>
						<button type="button" id="modalHide" class="cndRstBtn">등록취소</button>
					</div>
					<div style="clear:both"></div>
				</div>
			</div>
		</div><!-- End 검사등록 모달 -->

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div>
								<h5><b>▶ 제품검사 등록</b></h5>
								<div>
									<label for="prodPass">생산완료제품</label> 
									<input type="text" id="prodPass" style="width: 440px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;
									<button class="srchBtn" id="prodSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
									
									<br/>
									<label for="start">생산완료일자</label>
									<input type="date" id="start"
									style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;
									<input type="date" id="end" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
									<div id="rigth">
										<button type="button" id="procSearchBnt" class="cndSrchBtn">검색</button>
										<button type="button" id="resetBtn" class="cndRstBtn ">초기화</button>
									</div>
									<div style="clear:both"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<!-- 생산지시 테이블 -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">▶생산지시 목록</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="procCommandList"></div>
							</div>
						</div>
					</div> <!--End 생산지시 테이블 -->
				</div>
			</div> <!--END row-->
			<div class="row">
				<!-- 공정지시 테이블? -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">
							<span>▶생산지시 상세목록</span>
							<br/>
							<div class="mtrlOrderRightBtn">
								<label for="procCd">생산지시코드</label>
								<input type="text" id="procCd" style="width: 200px;">
								<button id="prodInsertBtn" class="cndInsBtn">등록</button>
							</div>
						</div>
						<div style="clear:both"></div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="prodcProgressList"></div>
							</div>
						</div>
					</div> <!--End 공정지시 테이블 -->
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<script>
		const Grid = tui.Grid;
		let procProdAllList = [
														<c:forEach items="${procProdList}" var="item">
															{
																prcmDt : '${item.prcmDt}',
																prcmCd : '${item.prcmCd}',
																cprCd : '${item.cprCd}',
																cprNm : '${item.cprNm}',
																cprTyp : '${item.cprTyp}',
															},
														</c:forEach>
													]
		let cprNm = "";
		let start = "";
		let end = "";

		//날짜 가공
		const date = new Date();
		const years = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const month2 = String(date.getMonth() + 2).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		const getStartToday = years+ "-" + month + "-" + day;
		const getOneMonthLater = years+ "-" + month2 + "-" + day;

		var hours = ('0' + date.getHours()).slice(-2); 
		var minutes = ('0' + date.getMinutes()).slice(-2);
		var timeString = hours + ":" + minutes;
		//var seconds = ('0' + date.getSeconds()).slice(-2); 

		var timeString = hours + ':' + minutes;
		
		const procCommandIsNotNullList = (cprNm = undefined, start = undefined, end = undefined) => {
			$.ajax({
				url : "procProdAllList",
				method :"POST",
				dataType : "JSON",
				success : function(data){
					procCommandList.resetData(data);			//아작스 결과를 그리드에 그려준다
					procCommandList.getData().forEach(row => {	//입고수량의 Cell에 바탕화면을 연두색으로 변경
						procCommandList.addCellClassName(row.rowKey, 'cprNm', 'cell-weight');
					});
				}
			});
		};
		procCommandIsNotNullList();

		//생산지시목록 Grid(생산지시) // procCommandList
		const procCommandList = new Grid({
			el: document.getElementById('procCommandList'),
			scrollX: false,
			columns: [
				{
					header: '생산지시코드',
					name: 'prcmCd',				//생산지시/생산지시코드
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '생산제품명',
					name: 'cprNm'					//완제품관리/제품명
				},
				{
					header: '작업시작일자',
					name: 'prcmStartDt',		//생산지시/생산시작일자
					formatter: function (e) {
						let newData = new Date(e.value);
						let result = newData.getFullYear() + "-" +
									(newData.getMonth() < 10 ? "0" + (newData.getMonth() + 1) : newData.getMonth() + 1)
									+ "-" + (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
						return result;
					}
				},
				{//PRCM_END_DT
					header: '작업종료일자',
					name: 'prcmEndDt',		//생산지시/생산시작일자
					formatter: function (e) {
						let newData = new Date(e.value);
						let result = "";
						if(newData){
							result = newData.getFullYear() + "-" +
										(newData.getMonth() < 10 ? "0" + (newData.getMonth() + 1) : newData.getMonth() + 1)
										+ "-" + (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
						} else {
							result = "";
						}
						
						return result;
					},
					sortingType: 'desc',
					sortable: true
				}
			],
			bodyHeight: 250,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//생산지시상세목록 Grid(공정지시) // prodcProgressList
		const prodcProgressList = new Grid({
			el: document.getElementById('prodcProgressList'),
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '제품번호',
					name: 'cprCd',
					rowSpan: true,
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품명',
					name: 'cprNm',
					rowSpan: true,
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '검사수량',
					name: 'prcmQnt',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '합격수량',
					name: 'prprQnt'
				},
				{
					header: '불량수량',
					name: 'prprBad',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '작업자',
					name: 'piMng',
					editor: 'text'
				},
				{
					header: '검사일자',
					name: 'piDt',
					editor: {
						type: 'datePicker',
						options: {
							format: 'yyyy-MM-dd',
							//시작일자와 종료일자를 설정해줌
							selectableRanges : [[getStartToday, getOneMonthLater]],
							language: 'ko'
						}
					}
				},
				{
					header: '검사시작시간',
					name: 'piStrDt',
					formatter: function (e) {
						return timeString;
					},
				},
				{
					header: '검사종료시간',
					name: 'piEndDt',
					editor: 'text'
				},
				{
					header: '비고',
					name: 'piNote',
					editor: 'text'
				},
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//생산완료제품 모달 검색 Grid
		const prodModalGrid = new Grid({
			el: document.getElementById('prodModalGrid'),
			rowHeaders: ['rowNum'],
			columns: [
				{
					header: '생산지시일자',	   //생산지시
					name: 'prcmDt'
				},
				{
					header: '생산지시코드',
					name: 'prcmCd',			//생산지시
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품코드',		//제품관리
					name: 'cprCd'
				},
				{
					header: '제품명',		//제품관리
					name: 'cprNm',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품유형',		//제품관리
					name: 'cprTyp'
				}
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});
		prodModalGrid.resetData(procProdAllList);

		//그리드에서 행 클릭해서 제품명을 input에 넣기
		prodModalGrid.on('click',(e)=>{
			let cprNm = prodModalGrid.getData()[e.rowKey].cprNm;

			if (e.targetType !== "columnHeader") {
				Swal.fire({
					icon: 'success',
					title: '선택상품 : ' + cprNm,
				});
			};

			$("#prodPass").val(cprNm);
			$("#prodModal").hide();	
		})

		//조회버튼 클릭시 조건에 해당되는 제품명 조회
		$('#procSearchBnt').on('click',()=>{
			let prodInput = $('#prodPass').val();
			let dateStart = $('#start').val();
			let dateEnd = $('#end').val();

			$.ajax({
				url : "procProdAllList",
				method :"POST",
				dataType : "JSON",
				data : {cprNm : prodInput, start : dateStart, end : dateEnd},
				success : function(data){
					procCommandList.resetData(data);
					procCommandList.getData().forEach(row => {
						procCommandList.addCellClassName(row.rowKey, 'cprNm', 'cell-weight');
					});
				}
			});
		});

		procCommandList.on('click', (e)=>{
			let getPrcmCdData = procCommandList.getData()[e.rowKey].prcmCd;

			if(getPrcmCdData === undefined){
				return;
			}
			
			$.ajax({
				url : "procPrprDetailList",
				method :"POST",
				dataType : "JSON",
				data : {prcmCd : getPrcmCdData},
				success : function(data){
					//자료가 없으면 자료없다고 알림 띄우기
					if(data.length === 0){
						Swal.fire({
							title: '자료가 없습니다.',
							text: getPrcmCdData + '에 대한 자료가 없습니다.',
							icon: 'error'
						})
						return;
					} else {
						$('#procCd').val(getPrcmCdData);
						prodcProgressList.resetData(data);
					};
				}
			});
		})

		//생산완료제품 모달 검색 Grid
		const inspInsert = new Grid({
			el: document.getElementById('inspInsert'),
			scrollX: false,
			columns: [
				{
					header: '설비명',
					name: ''
				},
				{
					header: '가동상태',
					name: '',
					sortingType: 'asc',
					sortable: true
				}
			],
			bodyHeight: 200,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//초기화버튼
		$('#resetBtn').on('click', () => {
			procCommandList.clear();		//생산지시목록 Grid 초기화
			prodcProgressList.clear();		//생산지시상세목록 Grid 초기화
		});

		//생산완료제품 Modal
		$('#prodSearch').on('click',()=>{
			document.getElementById('prodModal').style.display='block';
			setTimeout(()=> prodModalGrid.refreshLayout() , 0);
		});//inspModal

		$('#prodInsertBtn').on('click',()=>{
			let procCd = $('#procCd').val();		//생산지시코드

			let checkRows = prodcProgressList.getCheckedRows();
			if(checkRows.length !== 0){
				checkRows.map((item) => {
					item.prcmCd = procCd;			//생산지시코드
					item.piCnt = item.prcmQnt		//검사수량
					item.piPassCnt = item.prprQnt	//합격수량
					item.piBadCnt = item.prprBad	//불량수량
					item.piStrDt = timeString;		//검사시작시간
				});

				//console.log(checkRows);
				$.ajax({
					url : "procPrprDetailList",
					method :"POST",
					data : JSON.stringify(checkRows),
					dataType : "JSON",
					contentType : "application/json",
					success : function(data){
						console.log(data);
						/*Swal.fire({
							icon: 'success',
							title: "검사완료",
							text:  "검사가 완료되었습니다."
						});
						prodcProgressList.removeCheckedRows();
						procCommandIsNotNullList();*/
					} 
				});
			} else {
				Swal.fire({
					icon: 'error',
					title: '경고',
					text: "선택된 데이터가 없습니다.",
				});
			};
		});








		//생산지시 상세목록 Grid 쪽 등록버튼 누르면 모달창이 짠
		/*$('#prodInsertBtn').on('click',()=>{
			document.getElementById('inspModal').style.display='block';
			setTimeout(()=> inspInsert.refreshLayout() , 0);
		});*/
		/*$('#modalHide').on('click',()=>{
			$('#inspModal').hide();
		});*/



	</script>
</main>