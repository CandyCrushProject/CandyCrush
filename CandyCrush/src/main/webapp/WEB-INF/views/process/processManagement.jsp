<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<link rel="stylesheet" href="assets/css/processManagement.css">
			<style>
				#orderSheetTab td {
					vertical-align: middle;
				}

				.hi {
					height: 35px;
					padding: 0;
					padding-left: 10px;
					padding-right: 10px;
				}

				.padbot {
					margin-bottom: 20px;
				}

				.matop {
					margin-top: 20px;
				}

				input[type="date"] {
					border: none;
					border-bottom: 1px solid #9e9e9e;
				}

				#orderSheetTab tr:hover {
					cursor: pointer;
					background-color: antiquewhite;
				}

				#orderDetail tr:hover {
					cursor: pointer;
					background-color: antiquewhite;
				}
			</style>
			<main>
				<!-- 주문서 조회 모달 -->
				<div class="modal fade" id="order" tabindex="-1">
					<div class="modal-dialog modal-lg modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title">주문서 상세 조회</h3>
								<br>
								<h5>주문번호</h5>
								<input type="text" id="orshNoCd" style="width: 200px;" readonly>
							</div>
							<div class="modal-body">
								<div id="orderDetailList"></div>
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
						<h1 class="page-header">생산계획</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">생산관리</a></li>
							<li class="active">생산계획관리</li>
						</ol>
					</div>

					<div id="page-inner">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-content">
										<div class="procPlanCraete">
											<div>
												<button type="button" class="cndInsBtn hi" style="float: right; display: inline;" id="">
													<i class="fa-solid fa-plus"></i> 추가
												</button>
											</div>
											<h4 style="padding-bottom: 20px;">미계획 주문서 리스트</h4>
											<!-- 처음 주문서들 정보 뿌려줄 것들 -->
											<div id="orderSheetTab"></div>
										</div>
										<div class="clearBoth">
											<br />
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row inpw">
							<div class="col-md-12">
								<div class="card">
									<div class="card-action">
										<h3>생산계획등록</h3>
									</div>
									<div class="card-content">
										<div class="procPlan">
											<ul class="padbot">
												<li class="procPlanBtn-r">
													<button type="button" class="cndInsBtn hi" id="addPlanBtn">
														<i class="fa-solid fa-plus"></i> 등록
													</button>
												</li>
												<li class="procPlanBtn-r">
													<button type="button" class="cndRstBtn hi" id="resetBtn">
														<i class="fa-solid fa-rotate-right"></i> 초기화
													</button>
												</li>
											</ul>
										</div>
										<div class="clearBoth">
											<br />
										</div>
										<!-- 주문서 현재상태 -->
										<form id="planForm" name="newPlan" action="insertProcPlan" method="POST" onsubmit="return false">
											<input type="hidden" id="orshPr" name="orshPr" readonly>
											<input type="hidden" name="prpldStatus" value="미지시" readonly>
											<input type="hidden" name="prplStatus" value="계획완료" readonly>
											<input type="hidden" id="caNm" name="caNm" value="" readonly>
											<input type="hidden" id="caNo" name="caNo" value="" readonly>
											<input type="hidden" id="ordrDtlCd" name="ordrDtlCd" value="" readonly>
											<input type="hidden" id="cprCd" name="cprCd" readonly>
											<input type="hidden" id="sttCngDt" name="sttCngDt" value="" readonly>
											<input type="hidden" name="prpldCd" id="prpldCd" readonly>
											<div id="insertPlanGrid"></div>
										</form>
									</div>
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
									<h3>자재BOM정보</h3>
								</div>
								<div class="card-content">
									<!-- BOM -->
									<div class="prodProc">
										<table class="candyTab tabb">
											<thead>
												<tr>
													<th>No</th>
													<th>제품명</th>
													<th>자재명</th>
													<th>공정명</th>
													<th>자재소모수량/포대</th>
												</tr>
											</thead>
											<tbody id="bomMtrlSheet">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				</div>
			</main>
			<script>
				function printAlert(message) {
					if (message == null || message == "") return;
					Swal.fire({
						icon: 'success',
						title: '등록되었습니다.',
						text: '생산계획의 등록이 완료되었습니다.',
					});
				}
				printAlert(`${message}`);
				function getBomDate(orshNo, cprCd) {
					$.ajax({
						url: 'getBomInfo',
						type: 'GET',
						data: {
							orshNo: orshNo,
							cprCd: cprCd
						},
						dataType: 'json',
						success: function (data) {
							// 성공적으로 응답 받았을 때 처리할 로직
							var tbody = $("#bomMtrlSheet"); // tbody 선택
							tbody.empty(); // tbody 비우기

							// 데이터 반복문 처리
							$.each(data.bomInfo, function (index, item) {
								var row = $('<tr>');
								// td 생성		
								row.append($("<td>").attr("hidden", true).text(item.cbmtCd));
								row.append($("<td>").attr("hidden", true).text(item.cmmCd));
								row.append($("<td>").attr("hidden", true).text(item.cmCd));
								row.append($("<td>").attr("hidden", true).text(item.cprCd));
								row.append($("<th scope='row'>").text(index + 1));
								row.append($("<td>").text(item.cprNm));
								row.append($("<td>").text(item.cmmNm));
								row.append($("<td>").text(item.cmNm));
								row.append($("<td>").text(item.cbmtQtt));

								tbody.append(row);
							})
						},
						error: function (xhr, status, error) {
							// 요청이 실패했을 때 처리할 로직
							console.error('요청 실패:', error);
						}
					});
				}
				$(document).ready(function () {


					$('#resetBtn').on('click', function () {
						$("#orshNo").val('');
						$("#cprNm").val('');
						$("#ordrDtlCnt").val('');
						$("#orshDt").val('');
						$("#dlvryDt").val('');
						$("#prplCd").val('');
						$("#prpldCnt").val('');
						$("#prpldMng").val('');
						$("#prstDt").val('');
						$("#prplSuceDt").val('');
					});
				});
				getOrder();
				function getOrder() {
					$.ajax({
						url: 'getOrder',
						type: 'GET',
						dataType: 'json', // orderSheetTab 
						success: function (data) {
							orderSheetGrid.resetData(data.result);
						},
						error: function (xhr, status, error) {
							// 요청이 실패했을 때 처리할 로직
							console.error('요청 실패:', error);
						}
					});
				}
				function getOrderDate(orshNo, caNo) {
					let addData = {
						orshNo: orshNo,
						caNo: caNo
					};
					$.ajax({
						url: 'getOrderDetail',
						type: 'GET',
						data: addData,
						dataType: 'json',
						success: function (data) {
							// 성공적으로 응답 받았을 때 처리할 로직
							var tbody = $("#orderDetail"); // tbody 선택
							tbody.empty(); // tbody 비우기

							// 데이터 반복문 처리
							$.each(data.result, function (index, item) {
								var row = $("<tr>").addClass("planBtn").on('dblclick', function () {
									getBomDate(item.orshNo, item.cprCd);
								});
								row.append($("<td>").attr("hidden", true).text(item.orshNo));
								row.append($("<td>").attr("hidden", true).text(item.caNo));
								row.append($("<td>").attr("hidden", true).text(item.orshDt));
								row.append($("<td>").attr("hidden", true).text(item.cprCd));
								row.append($("<td>").attr("hidden", true).text(item.sttCngDt));
								row.append($("<th scope='row'>").text(index + 1));
								row.append($("<td>").text(item.ordrDtlCd));
								row.append($("<td>").text(item.ordrDtlCnt));
								row.append($("<td>").text(item.cprNm));
								row.append($("<td>").text(item.caNm));
								row.append($("<td>").text(item.dlvryDt));
								row.append($("<td>").text(item.orshPr));

								tbody.append(row);
							})
							$('#order').modal('hide');
						},
						error: function (xhr, status, error) {
							// 요청이 실패했을 때 처리할 로직
							console.error('요청 실패:', error);
						}
					});
				}
				// 날짜 포맷 변경 함수
				function formatDate(time) {
					var date = new Date(time);
					var year = date.getFullYear();
					var month = ("0" + (date.getMonth() + 1)).slice(-2);
					var day = ("0" + date.getDate()).slice(-2);
					var formattedDate = year + "-" + month + "-" + day;
					return formattedDate;
				}


				/* 주문서정보 -> 생산계획작성 */
				$(document).on("dblclick", ".planBtn", function () {
					$.ajax({
						url: 'getProcPlanCode',
						type: 'GET',
						dataType: 'json',
						success: function (data) {

						},
						error: function (xhr, status, error) {
							// 요청이 실패했을 때 처리할 로직
							console.error('요청 실패:', error);
						}
					});
				});
				$(document).ready(function () {
					$('#addPlanBtn').on('click', function () {
						if ($('#orshNo').val() == "") {
							Swal.fire({
								icon: 'error',
								title: '주문서정보가 없습니다.',
								text: '주문서 조회를 먼저하여 정보를 입력해주세요',
							});
							return false;
						}
						if ($('#prpldCnt').val() == "") {
							Swal.fire({
								icon: 'error',
								title: '빈칸이 있습니다',
								text: '생산계획수량을 입력해주세요',
							});
							return false;
						}
						if ($('#prpldMng').val() == "") {
							Swal.fire({
								icon: 'error',
								title: '빈칸이 있습니다',
								text: '담당자를 입력해주세요',
							});
							return false;
						}
						if ($('#prstDt').val() == "") {
							Swal.fire({
								icon: 'error',
								title: '빈칸이 있습니다',
								text: '생산작업일자를 선택해주세요',
							});
							return false;
						}
						if ($('#prplSuceDt').val() == "") {
							Swal.fire({
								icon: 'error',
								title: '빈칸이 있습니다',
								text: '생산완료목표일을 선택해주세요',
							});
							return false;
						}
						var orshDt = formatDate($('#orshDt').val());
						var prplDlvryDt = formatDate($('#prplDlvryDt').val());
						var prstDt = formatDate($('#prstDt').val());
						var prplSuceDt = formatDate($('#prplSuceDt').val());
						$('#orshDt').val(orshDt);
						$('#prstDt').val(prstDt);
						$('#prplDlvryDt').val(prplDlvryDt);
						$('#prplSuceDt').val(prplSuceDt);
						newPlan.submit();
					});
				});

				// 미계획 주문서에 대한 데이터 리스트 받아오는 그리드
				const orderSheetGrid = new tui.Grid({
					el: document.getElementById('orderSheetTab'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					rowHeaders: ['checkbox'],
					columns: [
						{
							header: '주문코드',
							name: 'orshNo',
							align: 'center'
						},
						{
							header: '주문건수',
							name: 'ordrCdCnt',
							align: 'center'
						},
						{
							header: '거래처',
							name: 'caNm',
							align: 'center'
						},
						{
							header: '주문일자',
							name: 'orshDt',
							align: 'center'
						},
						{
							header: '납품일자',
							name: 'dlvryDt',
							align: 'center'
						}
					]
				});
				orderSheetGrid.on('dblclick', function (ev) {
					var row = orderSheetGrid.getRow(ev.rowKey);
					getOrderDetail(row.orshNo, row.caNm);
					$('#order').modal('show');
				});

				function getOrderDetail(orshNo, caNm) {
					$.ajax({
						url: 'getOrderDetail',
						method: 'post',
						data: {
							orshNo: orshNo,
							caNm: caNm
						},
						success: function (data) {
							orderDetailGrid.resetData(data);
							$('#orshNoCd').val(data[0].orshNo);
							setTimeout(() => orderDetailGrid.refreshLayout(), 200);
						}, error: function (rej) {
							console.log(rej);
						}
					});
				}
				// 미계획 주문서에 대한 데이터 리스트 받아오는 그리드
				const orderDetailGrid = new tui.Grid({
					el: document.getElementById('orderDetailList'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					rowHeaders: ['rowNum'],
					columns: [
						{
							header: '주문상세코드',
							name: 'ordrDtlCd',
							align: 'center'
						},
						{
							header: '제품명',
							name: 'cprNm',
							align: 'center'
						},
						{
							header: '거래처',
							name: 'caNm',
							align: 'center'
						},
						{
							header: '주문수량',
							name: 'ordrDtlCnt',
							align: 'center'
						},
						{
							header: '현재상태',
							name: 'orshPr',
							align: 'center'
						},
					]
				});

			</script>