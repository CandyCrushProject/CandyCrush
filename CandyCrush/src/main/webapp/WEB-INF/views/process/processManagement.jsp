<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
		</style>
		<main>
			<!-- 생산계획 작성 -->
			<div class="modal fade" id="createPlan" tabindex="-1">
				<div class="modal-dialog modal-lg modal-dialog-scrollable">
					<div class="modal-content">
						<form id="planForm" name="newPlan" action="insertProcPlan" method="POST" onsubmit="return false"
							class="row g-3">
							<div class="modal-header">
								<h5 class="modal-title">생산계획 등록</h5>
							</div>
							<div class="modal-body">
								<h5 class="modal-title">주문서 정보</h5>
								<input type="hidden" class="form-control" id="orshPr" name="orshPr" readonly>
								<div class="col-md-4">
									<label class="form-label">주문번호</label>
									<input type="text" class="form-control" id="orshNo" name="orshNo" value="" readonly>
								</div>
								<div class="col-md-4">
									<label class="form-label">제품명</label>
									<input type="text" class="form-control" name="cprNm" id="cprNm" value="" readonly>
									<input type="hidden" class="form-control" id="cprCd" name="cprCd" readonly>
								</div>
								<div class="col-md-4">
									<label class="form-label">주문수량</label>
									<input type="text" class="form-control" id="ordrDtlCnt" name="ordrDtlCnt" value="" readonly>
								</div>
								<div class="col-md-3">
									<label class="form-label">거래처명</label>
									<input type="text" class="form-control" id="caNm" name="caNm" value="" readonly>
									<input type="hidden" class="form-control" id="caNo" name="caNo" value="" readonly>
								</div>
								<div class="col-md-3">
									<label class="form-label">주문일자</label>
									<input type="date" class="form-control" id="orshDt" name="orshDt" value="" readonly>
								</div>
								<div class="col-md-3">
									<label class="form-label">납기일자</label>
									<input type="hidden" class="form-control" id="dlvryDy" name="dlvryDy" value="" readonly>
									<input type="date" class="form-control" id="prplDlvryDt" name="prplDlvryDt" value="" readonly>
								</div>
								<div class="col-md-3">
									<label class="form-label">생산요청수량</label>
									<input type="text" class="form-control" id="prplReqCnt" name="prplReqCnt" value="">
								</div>

								<hr>

								<h5 class="modal-title">생산계획</h5>
								<input type="hidden" class="form-control" name="prpldStatus" value="미지시" readonly>
								<input type="hidden" class="form-control" name="prplStatus" value="계획완료" readonly>
								<div class="col-md-6">
									<label class="form-label">생산계획코드</label>
									<input type="text" class="form-control" name="prplCd" id="prplCd" readonly>
								</div>
								<div class="col-md-6">
									<label class="form-label">생산계획수량</label>
									<input type="text" name="prpldCnt" class="form-control">
								</div>
								<div class="col-md-4">
									<label class="form-label">계획담당자</label>
									<input type="text" name="prpldMng" class="form-control">
								</div>
								<div class="col-md-4">
									<label class="form-label">생산작업일자</label>
									<input type="date" name="prstDt" id="prstDt" class="form-control">
								</div>
								<div class="col-md-4">
									<label class="form-label">작업우선순위</label>
									<select name="prpldWorkTskPri" class="form-select" style="height: 55px;">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
								</div>
								<hr>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col"></th>
											<th scope="col">자재명(단위)</th>
											<th scope="col">자재소모량</th>
											<th scope="col">자재유형</th>
											<th scope="col">투입공정</th>
										</tr>
									</thead>
									<tbody id="rscTable">

									</tbody>
								</table>

								<hr>
								<!-- End Multi Columns Form -->
							</div>
							<div class="modal-footer">
								<button type="button" class="cndInsBtn" id="addPlanBtn">등록</button>
								<button type="button" class="cndDelBtn" data-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- End Modal Dialog Scrollable-->

			<!-- 조문서 조회 modal시작 -->
			<div class="modal fade" id="order" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">주문서 조회</h4>
						</div>
						<div class="modal-body">
							<table class="table table-hover" style="text-align: center;">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">주문코드</th>
										<th scope="col">거래처</th>
										<th scope="col">제품명</th>
										<th scope="col">등록</th>
									</tr>
								</thead>
								<tbody id=orderSheetTab>
								</tbody>
							</table>
							<!-- End Multi Columns Form -->
						</div>
						<div class="modal-footer">
							<button type="button" class="cndRstBtn" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 조문서 조회 Modal 끝-->

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
									<h3>생산계획관리</h3>
								</div>
								<div class="card-content">
									<div class="procPlan">
										<ul>
											<li class="procPlanBtn-r">
												<button class="cndInsBtn">
													<i class="fa-solid fa-plus"></i> 등록
												</button>
											</li>
											<li class="procPlanBtn-r">
												<button id="oderBtn" type="button" class="cndSrchBtn" data-toggle="modal" data-target="#order">
													<i class="fa-solid fa-clipboard"></i> 주문서
												</button>
											</li>
											<li class="procPlanBtn-r">
												<button class="cndRstBtn">
													<i class="fa-solid fa-rotate-right"></i> 초기화
												</button>
											</li>
										</ul>
									</div>
									<div class="floatEnd"></div>
									<div class="procPlanCraete">
										<table class="candyTab">
											<thead>
												<tr>
													<th>생산계획코드</th>
													<th>주문서번호</th>
													<th>거래처명</th>
													<th>제품명</th>
													<th>주문수량</th>
													<th>납기일자</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
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

						<!-- /. PAGE INNER  -->
					</div>

					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="card-action">
									<h3>제품</h3>
								</div>
								<div class="card-content">
									<div class="prodProc">
										<table class="candyTab">
											<thead>
												<tr>
													<th>생산코드</th>
													<th>제품코드</th>
													<th>제품명</th>
													<th>생산계획일자</th>
													<th>생산요청수량</th>
													<th>작업우선순위</th>
													<th>계획코드</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>ddal001</td>
													<td>ddal</td>
													<td>딸기맛담배</td>
													<td>2023-04-04</td>
													<td>500</td>
													<td>1</td>
													<td>plan00001</td>
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
									<h3>제품공정확인</h3>
								</div>
								<div class="card-content">
									<div class="prodProc">
										<table class="candyTab">
											<thead>
												<tr>
													<th>제품코드</th>
													<th>공정코드</th>
													<th>계획코드</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>choco</td>
													<td>fac0001</td>
													<td>plan00001</td>
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

					<div class="row">
						<div class="col-md-8">
							<div class="card">
								<div class="card-action">
									<h3>사용가능자재</h3>
								</div>
								<div class="card-content">
									<div class="prodProc">
										<table class="candyTab">
											<thead>
												<tr>
													<th><input type="checkbox"></th>
													<th>자재명</th>
													<th>자재LOT</th>
													<th>사용가능수량</th>
													<th>출고수량</th>
													<th>사용량</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input type="checkbox"></td>
													<td>호랑이담배</td>
													<td>fac0001</td>
													<td>100000</td>
													<td>1000</td>
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
						<div class="col-md-4">
							<div class="card">
								<div class="card-action">
									<h3>자재확인</h3>
								</div>
								<div class="card-content">
									<div class="prodProc">
										<table class="candyTab">
											<thead>
												<tr>
													<th>자재코드</th>
													<th>공정코드</th>
													<th>출고수량</th>
													<th>계획코드</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>prod0001</td>
													<td>fac0001</td>
													<td>500</td>
													<td>candycrush000001</td>
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

					<!-- /. PAGE WRAPPER  -->
				</div>
			</div>


		</main>
		<script>
			function printAlert(message) {
				if (message == null || message == "") return;
				alert(message);

			}
			printAlert(`${message}`);
			$(document).ready(function () {
				// $('#order').hide();
				$('#oderBtn').on('click', function () {
					$.ajax({
						url: 'getOrder',
						type: 'GET',
						dataType: 'json',
						success: function (data) {
							console.log(data.prplCd);
							// 성공적으로 응답 받았을 때 처리할 로직
							var tbody = $("#orderSheetTab"); // tbody 선택
							tbody.empty(); // tbody 비우기

							// 데이터 반복문 처리
							$.each(data.result, function (index, item) {
								var row = $('<tr>');
								// td 생성		
								row.append($("<td>").attr("hidden", true).text(data.prplCd));
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
								var td = $("<td>");
								var button = $("<button>", {
									type: "button",
									class: "addBtn cndInsBtn",
									text: "등록",
								});
								td.append(button);
								row.append(td);

								tbody.append(row);
							})
							// 모달 창 열기
							// $('#order').show();
							$('#order').modal('show');
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

				$("#prplCd").val(orderArray[0]);
				$("#caNo").val(orderArray[1]);
				$("#cprCd").val(orderArray[2]);
				$("#orshDt").val(orderArray[3]);
				$("#orshPr").val(orderArray[4]);
				$("#ordrDtlCnt").val(orderArray[5]);
				$("#dlvryDt").val(orderArray[6]);
				$("#prplDlvryDt").val(orderArray[6]);
				$("#orshNo").val(orderArray[7]);
				$("#caNm").val(orderArray[8]);
				$("#cprNm").val(orderArray[9]);

				// 현재 모달창 닫기
				$('#order').modal('hide');

				// 다른 모달창 열기
				$('#createPlan').modal('show');
			});
			$(document).ready(function () {
				$('#addPlanBtn').on('click', function () {
					var orshDt = formatDate($('#orshDt').val());
					var prplDlvryDt = formatDate($('#prplDlvryDt').val());
					var prstDt = formatDate($('#prstDt').val());
					$('#orshDt').val(orshDt);
					$('#prstDt').val(prstDt);
					$('#prplDlvryDt').val(prplDlvryDt);
					$('#createPlan').modal('hide');
					newPlan.submit();
				});
			});
			$(document).ready(function () {
				$("#cprNm").on('click', function () {
					// 선택된 옵션의 값을 가져와서 처리
					var selectedBom = $(this).val();
					console.log(selectedBom);
					$.ajax({
						url: 'getBomInfo',
						type: 'GET',
						data: {
							bomCd: selectedBom
						},
						dataType: 'json',
						success: function (data) {
							// 성공적으로 응답 받았을 때 처리할 로직
							console.log('요청 성공:', data.BomRscInfo);
							var tbody = $("#rscTable"); // tbody 선택
							tbody.empty(); // tbody 비우기

							// 데이터 반복문 처리
							$.each(data.BomRscInfo, function (index, item) {
								var row = $("<tr>");

								// td 생성		
								row.append($("<th scope='row'>").text(index + 1));
								row.append($("<td>").text(item.rscNm));
								row.append($("<td>").text(item.useCnt + "(" + item.unit + ")"));
								row.append($("<td>").text(item.rscTyp));
								row.append($("<td>").text(item.prcsNm));

								tbody.append(row);
							});

						},
						error: function (xhr, status, error) {
							// 요청이 실패했을 때 처리할 로직
							console.error('요청 실패:', error);
						}
					});
				});
			});

			/* 체크박스 연결 */
			// tbody의 체크박스
			const tbodyCheckbox = document.querySelectorAll('#proPlanChk input[type="checkbox"]');
			// thead의 체크박스
			const theadCheckbox = document.querySelector('th input[type="checkbox"]');

			// tbody의 체크박스의 상태를 모니터링하여 thead의 체크박스 상태를 변경
			function updateTheadCheckbox() {
				// tbody의 체크박스 중 하나라도 체크가 안되어 있으면 thead의 체크박스를 체크 해제
				if ([...tbodyCheckbox].some((checkbox) => !checkbox.checked)) {
					theadCheckbox.checked = false;
				} else {
					// tbody의 체크박스가 모두 체크 되어 있으면 thead의 체크박스를 체크
					theadCheckbox.checked = true;
				}
			}

			// tbody의 체크박스를 클릭할 때마다 thead의 체크박스 상태 업데이트
			tbodyCheckbox.forEach((checkbox) => {
				checkbox.addEventListener('click', () => {
					updateTheadCheckbox();
				});
			});

			// thead의 체크박스를 클릭할 때마다 tbody의 체크박스 상태 업데이트
			theadCheckbox.addEventListener('click', () => {
				tbodyCheckbox.forEach((checkbox) => {
					checkbox.checked = theadCheckbox.checked;
				});
			});
		</script>