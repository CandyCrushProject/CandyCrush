<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<link rel="stylesheet" href="assets/css/processManagement.css">
			<link rel="stylesheet" href="assets/css/processOrder.css">
			<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
			<script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
			<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

			<style>
				.procOder button {
					padding: 5px 20px;
				}
			</style>
			<main>
				<!-- 계획 조회 모달 -->
				<div class="modal fade" id="plan" tabindex="-1">
					<div class="modal-dialog modal-lg modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header" style="border:none;">
								<h4>생산계획 조회</h4>
							</div>
							<div class="modal-body">
								<div id="procPlanList">
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="cndRstBtn" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 페이지 네브 -->
				<div id="page-wrapper">
					<div class="header">
						<h1 class="page-header">생산지시</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">생산관리</a></li>
							<li class="active">생산지시관리</li>
						</ol>

					</div>

					<!-- 페이지 바디 -->
					<div id="page-inner">

						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-action">
										<div class="procOderBtn-r">
											<button class="cndSelBtn" id="planBtn" type="button" data-toggle="modal" data-target="#plan">
												<i class="fa-regular fa-folder-open"></i>
												계획조회
											</button>
											<button class="cndInsBtn" id="addOrderBefore">
												<i class="fa-solid fa-plus"></i>
												목록추가
											</button>
										</div>
										<h3>생산지시관리</h3>
										<h4>생산 지시 대기</h4>
									</div>
									<div class="card-content">
										<div id="procOrderFormGrid"></div>
										<div class="clearBoth">
											<br />
										</div>
									</div>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-action">
										<div class="procOderBtn-r">
											<button class="cndInsBtn" id="addProcOrder">
												<i class="fa-solid fa-plus"></i>
												지시등록
											</button>
										</div>
										<h4>생산 지시 등록</h4>
									</div>
									<div class="card-content">
										<input type="date" name="prcmDt" id="prcmDt" value="" style="width: 120px;" readonly>
										<div id="insertOrderForm"></div>
										<div class="clearBoth">
											<br />
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="row">


							<div class="col-md-8">
								<div class="card">
									<div class="card-action">
										<h4>생산공정(공정 및 자재)</h4>
									</div>
									<div class="card-content">
										<div id="procGrid"></div>
										<div class="clearBoth">
											<br />
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-4">
								<div class="card">
									<div class="card-action">
										<h4>공정자재지시</h4>
									</div>
									<div class="card-content">
										<div id="mtrlGrid"></div>
										<div class="clearBoth">
											<br />
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</main>

			<script>
				// 생산지시일자 당일일자 입력
				$('#prcmDt').val(getToday());

				// 날짜 포맷 변경 함수
				function formatDate(time) {
					var date = new Date(time);
					var year = date.getFullYear();
					var month = ("0" + (date.getMonth() + 1)).slice(-2);
					var day = ("0" + date.getDate()).slice(-2);
					var formattedDate = year + "-" + month + "-" + day;
					return formattedDate;
				}
				// 오늘날짜
				function getToday() {
					var date = new Date();
					var year = date.getFullYear();
					var month = ("0" + (date.getMonth() + 1)).slice(-2);
					var day = ("0" + date.getDate()).slice(-2);
					var formattedDate = year + "-" + month + "-" + day;
					return formattedDate;
				}

				let cprNm = ""; // 제품 이름 모음
				let rowKey = ""; // 그리드 행의 행키 값
				let columnName = ""; // 그리드 열 이름
				let row = ""; // 그리드 행 값
				let prplCdSet; // 생산계획코드 모음
				let mtrlMapArr = []; // 자재 목록 배열
				let managerList = []; // 담당자 목록 배열
				let result = 0; // 예상소모량 계산 값

				// 관리자 목록 받아오기
				function getManagerList() {
					$.ajax({
						url: 'managerList',
						type: 'GET',
						dataType: 'json',
						success: function (data) {
							for (let i = 0; i < data.length; i++) {
								// 담당자 목록 그리드 셀렉트 배열로 만들어줌
								managerList.push({ text: data[i].memNm, value: data[i].memNm })
							}
						},
						error: function (xhr, status, error) {
							// 요청이 실패했을 때 처리할 로직
							console.error('요청 실패:', error);
						}
					});
				}

				$(document).ready(function () {

					// 계획조회 버튼 클릭 이벤트
					$('#planBtn').on('click', function () {
						$.ajax({
							url: 'ProcPlanOrder',
							method: 'get',
							success: function (data) {
								procPlanGrid.resetData(data);
								setTimeout(() => procPlanGrid.refreshLayout(), 300);
							}, error: function (err) {
								console.log("실패");
							}
						});
					})

					// 목록추가 버튼 클릭 이벤트
					$('#addOrderBefore').on('click', function () {
						let rows = procOrderFormGrid.getCheckedRows();
						procOrderFormGrid.removeCheckedRows();
						if (rows.length > 0) {
							insertOrderFormGrid.resetData(rows);
							insertOrderFormGrid.uncheckAll();
							getManagerList();
						} else {
							Swal.fire({
								icon: 'error',
								title: '경고',
								text: "선택된 생산계획이 없습니다.",
							});
						};
					})

					// 지시등록 버튼 클릭 이벤트
					$('#addProcOrder').on('click', function (ev) {
						let insertOrder = insertOrderFormGrid.getCheckedRows();
						$.ajax({
							url: 'insertProcOrder',
							method: 'POST',
							data: JSON.stringify(insertOrder),
							dataType: 'json',
							contentType: 'application/json',
							success: function (data) {
								insertProg();
							}, error: function (err) {
								Swal.fire({
									icon: 'error',
									title: '실패',
									text: "생산지시에 실패했습니다.",
								});
							}
						});
					})

				});

				// 생산공정 정보 받는 함수
				function insertProg() {
					let insertProg = procGrid.getData();
					$.ajax({
						url: 'insertProg',
						method: 'POST',
						data: JSON.stringify(insertProg),
						dataType: 'json',
						contentType: 'application/json',
						success: function (data) {
							insertMtrl();
						}, error: function (err) {
							console.log(err);
						}
					});
				}

				// 공정자재 정보 받는 함수
				function insertMtrl() {
					let insertMtrl = mtrlGrid.getData();
					$.ajax({
						url: 'insertMtrl',
						method: 'POST',
						data: JSON.stringify(insertMtrl),
						dataType: 'json',
						contentType: 'application/json',
						success: function (data) {
							insertOrderFormGrid.removeCheckedRows();
							procGrid.clear();
							mtrlGrid.clear();
							Swal.fire({
								icon: 'success',
								title: '완료',
								text: "해당 계획의 생산지시가 완료되었습니다..",
							});
						}, error: function (err) {
							console.log(err);
						}
					});
				}

				// 생산 계획 조회 그리드
				const procPlanGrid = new tui.Grid({
					el: document.getElementById('procPlanList'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					selectionUnit: 'row',
					rowHeaders: ['rowNum'],
					columns: [
						{
							header: '생산계획코드',
							name: 'prplCd',
							align: 'center'
						},
						{
							header: '생산제품개수',
							name: 'cprCnt',
							align: 'center'
						},
						{
							header: '생산계획일자',
							name: 'prplDt',
							align: 'center'
						},
						{
							header: '계획관리자',
							name: 'prplMng',
							align: 'center'
						},
					]
				});
				procPlanGrid.on('dblclick', function (ev) {
					rowKey = ev.rowKey;
					columnName = ev.columnName;
					row = procPlanGrid.getRow(rowKey);
					prplCdSet = {
						prplCd: row.prplCd
					};
					$('#plan').modal('hide');
					procPlanDetail();
				});

				// 계획 상세 조회 함수
				function procPlanDetail() {
					$.ajax({
						url: 'ProcPlanOrderDetail',
						method: 'POST',
						data: JSON.stringify(prplCdSet),
						dataType: 'json',
						contentType: 'application/json',
						success: function (data) {
							procOrderFormGrid.resetData(data);
						}, error: function (err) {
							console.log(err);
						}
					});
				}


				// 생산 지시 대기 그리드
				const procOrderFormGrid = new tui.Grid({
					el: document.getElementById('procOrderFormGrid'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					rowHeaders: ['checkbox'],
					columns: [
						{
							header: '생산계획헤더코드',
							name: 'prplCd',
							hidden: true
						},
						{
							header: '제품코드',
							name: 'cprCd',
							hidden: true
						},
						{
							header: '계획상세코드',
							name: 'prpldCd',
							align: 'center'
						},
						{
							header: '제품명',
							name: 'cprNm',
							align: 'center'
						},
						{
							header: '생산계획수량',
							name: 'prpldCnt',
							align: 'center',
						},
						{
							header: '생산계획일자',
							name: 'prplDt',
							align: 'center'
						},
						{
							header: '계획관리자',
							name: 'prplMng',
							align: 'center'
						},
						{
							header: '현재상태',
							name: 'prpldStatus',
							align: 'center'
						},
					]
				});

				// 생산 지시 등록 그리드
				const insertOrderFormGrid = new tui.Grid({
					el: document.getElementById('insertOrderForm'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					rowHeaders: ['checkbox'],
					columns: [
						{
							header: '제품코드',
							name: 'cprCd',
							hidden: true
						},
						{
							header: '계획상세코드',
							name: 'prpldCd',
							align: 'center'
						},
						{
							header: '제품명',
							name: 'cprNm',
							align: 'center'
						},
						{
							header: '생산계획수량',
							name: 'prpldCnt',
							align: 'center',
						},
						{
							header: '생산지시수량',
							name: 'prcmCnt',
							align: 'center',
							editor: 'text',
							onAfterChange: function (data) { // 값이 변경되면 실행되는 함수
								let tt = procGrid.getData();

								result = data.value * (tt[0].cbmtCnsm / 1000);
								mtrlGrid.setValue(0, 'prmpPutQnt', result, false);

								result = data.value * (tt[1].cbmtCnsm / 1000);
								mtrlGrid.setValue(1, 'prmpPutQnt', result, false);

								result = data.value * (tt[2].cbmtCnsm / 1000);
								mtrlGrid.setValue(2, 'prmpPutQnt', result, false);

								result = data.value * (tt[5].cbmtCnsm / 1000);
								mtrlGrid.setValue(3, 'prmpPutQnt', result, false);

								result = data.value * (tt[4].cbmtCnsm / 1000);
								mtrlGrid.setValue(4, 'prmpPutQnt', result, false);


							}
						},
						{
							header: '생산시작일자',
							name: 'prcmStartDt',
							align: 'center',
							formatter: function (data) {
								let dateVal = '';
								if (data.value != null) {
									dateVal = formatDate(data.value);
								} else {
									dateVal = getToday();
								}
								return dateVal;
							},
							editor: {
								type: 'datePicker',
								options: {
									format: 'yyyy-MM-dd',
									date: getToday()
								}
							}
						},
						{
							header: '생산마감일자',
							name: 'prcmDeadline',
							align: 'center',
							formatter: function (data) {
								let dateVal = '';
								if (data.value != null) {
									dateVal = formatDate(data.value);
								} else {
									dateVal = getToday();
								}
								return dateVal;
							},
							editor: {
								type: 'datePicker',
								options: {
									format: 'yyyy-MM-dd',
									date: getToday()
								}
							}
						},
						{
							header: '지시담당자',
							name: 'prcmMng',
							align: 'center',
							editor: {
								type: 'select',
								options: {
									listItems: managerList
								},
							},
						},
					]
				});

				insertOrderFormGrid.on('click', function (ev) {
					row = insertOrderFormGrid.getRow(ev.rowKey);
					getBom(row.cprCd);
					setBom(row.cprCd);
				});

				// 생산공정 정보 받는 함수
				function getBom(cprCd) {
					let ccd = { cprCd: cprCd };
					$.ajax({
						url: 'getBomInfo',
						method: 'post',
						data: JSON.stringify(ccd),
						contentType: 'application/json',
						dataType: 'json',
						success: function (data) {
							procGrid.resetData(data);
						}, error: function (rej) {
							console.log(rej);
						}
					});
				}


				// 생산공정 그리드
				const procGrid = new tui.Grid({
					el: document.getElementById('procGrid'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					columns: [
						{
							header: '제품코드',
							name: 'cprCd',
							hidden: true
						},
						{
							header: '자재코드',
							name: 'cmmCd',
							hidden: true
						},
						{
							header: 'BOM코드',
							name: 'bomCd',
							hidden: true
						},
						{
							header: '공정코드',
							name: 'cmCd',
							hidden: true
						},
						{
							header: '공정순서',
							name: 'cmSq',
							align: 'center',
							rowSpan: true
						},
						{
							header: '공정명',
							name: 'cmNm',
							align: 'center',
							rowSpan: true
						},
						{
							header: '자재명',
							name: 'cmmNm',
							align: 'center'
						},
						{
							header: '자재소모량/1천개',
							name: 'cbmtCnsm',
							align: 'center',
						},
						{
							header: '자재단위',
							name: 'cbmtMs',
							align: 'center',
						}
					]
				});


				// 공정자재지시 그리드에 들어갈 정보
				function setBom(cprCd) {
					let cmm = {
						cprCd: cprCd
					}
					$.ajax({
						url: 'getMtrlInput',
						method: 'post',
						data: JSON.stringify(cmm),
						contentType: 'application/json',
						dataType: 'json',
						success: function (data) {
							mtrlGrid.resetData(data.mtrlMap);
						}, error: function (rej) {
							console.log(rej);
						}
					});
				}

				// 공정자재지시 그리드
				const mtrlGrid = new tui.Grid({
					el: document.getElementById('mtrlGrid'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					columns: [
						{
							header: '생산계획상세코드',
							name: 'prpldCd',
							hidden: true
						},
						{
							header: '자재코드',
							name: 'cmmCd',
							hidden: true
						},
						{
							header: '자재명',
							name: 'cmmNm',
							align: 'center'
						},
						{
							header: '예상소모량/1천개',
							name: 'prmpPutQnt',
							align: 'center',
						},
						{
							header: '자재단위',
							name: 'cbmtMs',
							align: 'center',
						}
					]
				});

			</script>