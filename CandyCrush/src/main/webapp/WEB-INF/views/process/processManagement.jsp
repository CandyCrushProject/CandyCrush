<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<link rel="stylesheet" href="assets/css/processManagement.css">
			<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
			<!-- 그리드 -->
			<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
			<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
			<!-- 폰트 어썸 -->
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
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
			</style>
			<main>
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
									<div class="card-action">
										<h3>주문서 조회</h3>
									</div>
									<div class="card-content">
										<div class="procPlan">
											<ul>
												<li class="procPlanBtn-r">
													<button id="oderBtn" type="button" class="cndSrchBtn hi">
														<i class="fa-solid fa-clipboard"></i> 주문서
													</button>
												</li>
											</ul>
										</div>
										<div class="floatEnd"></div>
										<div class="procPlanCraete">
											<h5>주문서 정보</h5>
											<table class="candyTab">
												<thead>
													<tr>
														<th scope="col">No</th>
														<th scope="col">주문코드</th>
														<th scope="col">거래처</th>
														<th scope="col">제품명</th>
														<th scope="col">등록</th>
													</tr>
												</thead>
												<tbody id=orderSheetTab>
												</tbody>
											</table>
										</div>
										<div class="clearBoth">
											<br />
										</div>


									</div>
								</div>

							</div>

							<!-- /. PAGE INNER  -->
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
													<button type="button" class="cndRstBtn hi">
														<i class="fa-solid fa-rotate-right"></i> 초기화
													</button>
												</li>
											</ul>
										</div>
										<div class="floatEnd"></div>
										<!-- 주문서 현재상태 -->
										<input type="hidden" id="orshPr" name="orshPr" readonly>
										<input type="hidden" name="prpldStatus" value="미지시" readonly>
										<input type="hidden" name="prplStatus" value="계획완료" readonly>
										<div class="prodProc">
											<form id="planForm" name="newPlan" action="insertProcPlan" method="POST" onsubmit="return false">
												<div class="row matop">
													<div class="col-md-3">
														주문번호
														<input type="text" id="orshNo" name="orshNo" value="" readonly>
														<input type="hidden" id="caNm" name="caNm" value="" readonly>
														<input type="hidden" id="caNo" name="caNo" value="" readonly>
														<input type="hidden" id="ordrDtlCd" name="ordrDtlCd" value="" readonly>
													</div>
													<div class="col-md-3">
														제품명
														<input type="text" name="cprNm" id="cprNm" value="" readonly>
														<input type="hidden" id="cprCd" name="cprCd" readonly>
													</div>
													<div class="col-md-2">
														주문수량
														<input type="number" id="ordrDtlCnt" name="ordrDtlCnt" value="" readonly>
													</div>
													<div class="col-md-2">
														주문일자
														<input type="date" id="orshDt" name="orshDt" value="" readonly>
													</div>
													<div class="col-md-2">
														납기일자
														<input type="date" id="dlvryDt" name="dlvryDt" value="" readonly>
														<input type="hidden" id="prplSuceDt" name="prplSuceDt" value="" readonly>
														<input type="hidden" id="sttCngDt" name="sttCngDt" value="" readonly>
													</div>
												</div>
												<table class="candyTab tabb">
													<thead>
														<tr>
															<th>계획코드</th>
															<th>생산계획수량</th>
															<th>담당자</th>
															<th>생산작업일자</th>
															<th>작업우선순위</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<input type="text" name="prplCd" id="prplCd" readonly>
																<input type="hidden" name="prpldCd" id="prpldCd" readonly>
															</td>
															<td>
																<input type="number" name="prpldCnt" id="prpldCnt">
															</td>
															<td>
																<input type="text" name="prpldMng" id="prpldMng">
															</td>
															<td>
																<input type="date" name="prstDt" id="prstDt">
															</td>
															<td>
																<select name="prpldWorkTskPri" style="height: 54px;">
																	<option value="1">1</option>
																	<option value="2">2</option>
																	<option value="3">3</option>
																	<option value="4">4</option>
																	<option value="5">5</option>
																</select>
															</td>
													</tbody>
												</table>
											</form>
										</div>
										<div class="clearBoth">
											<br />
										</div>


									</div>
								</div>

							</div>


						</div>

						<!-- /. PAGE WRAPPER  -->
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
				$(document).ready(function () {
					$('#oderBtn').on('click', function () {
						$.ajax({
							url: 'getOrder',
							type: 'GET',
							dataType: 'json',
							success: function (data) {
								// 성공적으로 응답 받았을 때 처리할 로직
								var tbody = $("#orderSheetTab"); // tbody 선택
								tbody.empty(); // tbody 비우기

								// 데이터 반복문 처리
								$.each(data.result, function (index, item) {
									var row = $('<tr>');
									// td 생성		
									row.append($("<td>").attr("hidden", true).text(item.caNo));
									row.append($("<td>").attr("hidden", true).text(item.cprCd));
									row.append($("<td>").attr("hidden", true).text(item.orshDt));
									row.append($("<td>").attr("hidden", true).text(item.orshPr));
									row.append($("<td>").attr("hidden", true).text(item.ordrDtlCnt));
									row.append($("<td>").attr("hidden", true).text(item.dlvryDt));
									row.append($("<th scope='row'>").text(index + 1));
									row.append($("<td>").text(item.orshNo));
									row.append($("<td>").text(item.caNm));
									row.append($("<td>").text(item.cprNm));
									row.append($("<td>").attr("hidden", true).text(item.sttCngDt));
									row.append($("<td>").attr("hidden", true).text(item.ordrDtlCd));
									var td = $("<td>");
									var button = $("<button>", {
										type: "button",
										class: "addBtn cndInsBtn hi",
										text: "등록"
									});
									td.append(button);
									row.append(td);

									tbody.append(row);
								})
							},
							error: function (xhr, status, error) {
								// 요청이 실패했을 때 처리할 로직
								console.error('요청 실패:', error);
							}
						});
					});
				});
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
				$(document).on("click", ".addBtn", function () {
					var orderArray = [];
					var row = $(this).closest("tr");
					row.find("td").each(function () {
						orderArray.push($(this).text());
					});

					$.ajax({
						url: 'getOrder',
						type: 'GET',
						dataType: 'json',
						success: function (data) {

							$("#caNo").val(orderArray[0]);
							$("#cprCd").val(orderArray[1]);
							$("#orshDt").val(orderArray[2]);
							$("#orshPr").val(orderArray[3]);
							$("#ordrDtlCnt").val(orderArray[4]);
							$("#dlvryDt").val(orderArray[5]);
							$("#orshNo").val(orderArray[6]);
							$("#caNm").val(orderArray[7]);
							$("#cprNm").val(orderArray[8]);
							$("#sttCngDt").val(orderArray[9]);
							$("#ordrDtlCd").val(orderArray[10]);
							$.ajax({
								url: 'getProcPlanCode',
								type: 'GET',
								dataType: 'json',
								success: function (data) {
									$("#prplCd").val(data.prplCd);
									$("#prpldCd").val(data.prpldCd);

								},
								error: function (xhr, status, error) {
									// 요청이 실패했을 때 처리할 로직
									console.error('요청 실패:', error);
								}
							});

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
						var orshDt = formatDate($('#orshDt').val());
						var prplDlvryDt = formatDate($('#prplDlvryDt').val());
						var prstDt = formatDate($('#prstDt').val());
						$('#orshDt').val(orshDt);
						$('#prstDt').val(prstDt);
						$('#prplDlvryDt').val(prplDlvryDt);
						newPlan.submit();
					});
				});
			</script>