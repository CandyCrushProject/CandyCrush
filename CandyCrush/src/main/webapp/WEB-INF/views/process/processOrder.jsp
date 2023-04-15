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
								<div>
									<input type="text" id="cprNm" placeholder="제품명" style="width: 20%; display: inline;"
										autocomplete="off">
								</div>
							</div>
							<div class="modal-body">
								<div id="procPlanList"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="cndRstBtn" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
				<!-- /. NAV SIDE  -->
				<div id="page-wrapper">
					<div class="header">
						<h1 class="page-header">생산지시</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">생산관리</a></li>
							<li class="active">생산지시관리</li>
						</ol>

					</div>

					<div id="page-inner">

						<div class="row">
							<div class="col-md-12">
								<ul>
									<li class="procOderBtn-r">
										<button class="cndInsBtn ">
											<i class="fa-solid fa-plus"></i>
											등록
										</button>
									</li>
									<li class="procOderBtn-r">
										<button class="cndSelBtn" id="planBtn" type="button" data-toggle="modal" data-target="#plan">
											<i class="fa-regular fa-folder-open"></i>
											계획조회
										</button>
									</li>
									<li class="procOderBtn-r">
										<button class="cndRstBtn ">
											<i class="fa-solid fa-rotate-right"></i>
											초기화
										</button>
									</li>
								</ul>
								<div class="clearBoth"></div>
							</div>
						</div>


						<div class="row">
							<div class="col-md-8">
								<div class="card">
									<div class="card-action">
										<h3>공정자재</h3>
									</div>
									<div class="card-content">
										<div class="prodProc">
											<table class="candyTab">
												<thead>
													<tr>
														<th>공정코드</th>
														<th>자재명</th>
														<th>LOT번호</th>
														<th>출고수량</th>
														<th>재고수량</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>qeqw231</td>
														<td>된장</td>
														<td>qweasd124fsd</td>
														<td>300</td>
														<td>600</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="clearBoth">
											<br />
										</div>


									</div>
								</div>

							</div>
							<div class="col-md-4">
								<div class="card">
									<div class="card-action">
										<h3>자재지시</h3>
									</div>
									<div class="card-content">
										<div class="prodProc">
											<table class="candyTab">
												<thead>
													<tr>
														<th>공정코드</th>
														<th>LOT번호</th>
														<th>출고수량</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>fac0001</td>
														<td>canwewet153534</td>
														<td>500</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="clearBoth">
											<br />
										</div>


									</div>
								</div>
							</div>
						</div>
						<!-- /. PAGE INNER  -->
					</div>
					<!-- /. PAGE WRAPPER  -->
				</div>
				</div>
			</main>

			<script>


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

				var cprNm = "";
				var rowKey = "";
				var columnName = "";
				var row = "";
				function search() {
					$.ajax({
						url: "cprSearch",
						method: "POST",
						dataType: "JSON",
						data: {
							cprNm: $('#cprNm').val(),
							prpldStatus: "계획완료"
						},
						success: function (data) {
							procPlanGrid.resetData(data);
						}, error: function (err) {
							console.log("실패");
						}
					});
				}

				$(document).ready(function () {

					document.getElementById("cprNm").addEventListener("input", () => {
						search();
					});


					$('#planBtn').on('click', function () {
						$.ajax({
							url: 'ProcPlanOrder',
							method: 'get',
							success: function (data) {
								procPlanGrid.resetData(data);
								setTimeout(() => procPlanGrid.refreshLayout(), 200);
							}, error: function (err) {
								console.log("실패");
							}
						});
					})
				})
				const procPlanGrid = new tui.Grid({
					el: document.getElementById('procPlanList'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					selectionUnit: 'row',
					rowHeaders: ['rowNum'],
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
				procPlanGrid.on('dblclick', function (ev) {
					rowKey = ev.rowKey;
					columnName = ev.columnName;
					row = procPlanGrid.getRow(rowKey);
					console.log(row);

					$('#plan').modal('hide');
				});

			</script>