<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<link rel="stylesheet" href="assets/css/processManagement.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<!-- 그리드 -->
		<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
		<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
		<!-- 폰트 어썸 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
		<script>

			function oderList() {
				$.ajax({
					url: 'getOrder',
					type: 'GET',
					dataType: 'json',
					success: function (data) {
						console.log(data.result);
						// 성공적으로 응답 받았을 때 처리할 로직
						var tbody = $("#orderSheetTab"); // tbody 선택
						tbody.empty(); // tbody 비우기

						// 데이터 반복문 처리
						$.each(data.result, function (index, item) {
							var row = $("<tr>");
							// td 생성		
							row.append($("<td>").attr("hidden", true).text(item.caNm));
							row.append($("<td>").attr("hidden", true).text(item.cprNm));
							row.append($("<th scope='row'>").text(index + 1));
							row.append($("<td>").text(item.orshNo));
							row.append($("<td>").text(item.caNm));
							row.append($("<td>").text(item.cprNm));
							var button = $("<button>", {
								type: "button",
								class: "btn btn-primary addBtn",
								text: "등록",
								style: "background-color: #0d6efd;"
							});
							row.append(button);

							tbody.append(row);
						})
						// 모달 창 열기
						$('#order').modal('show');
					},
					error: function (xhr, status, error) {
						// 요청이 실패했을 때 처리할 로직
						console.error('요청 실패:', error);
					}
				});
			}

		</script>
		<main>
			<div class="modal fade" id="order" tabindex="-1">
				<div class="modal-dialog modal-lg modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">미지시 주문서 조회</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<table class="table table-hover">
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
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
								<div class="card-action">
									<h3>생산계획관리</h3>
								</div>
								<div class="card-content">
									<div class="procPlan">
										<ul>
											<li class="procPlanBtn-r">
												<button>
													<i class="fa-solid fa-plus"></i> 등록
												</button>
											</li>
											<li class="procPlanBtn-r">
												<button id="oderBtn" type="button" class=" btn btn-primary" data-bs-toggle="modal"
													data-bs-target="#order" onclick="oderList()">
													<i class="fa-solid fa-clipboard"></i> 주문서
												</button>
											</li>
											<li class="procPlanBtn-r">
												<button>
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
													<td><input type="text" value="${opInfo.orshNo}"></td>
													<td><input type="text" value="${opInfo.caNm}"></td>
													<td><input type="text" value="${opInfo.cprNm}"></td>
													<td><input type="text" value="${opInfo.ordrDtlCnt}"></td>
													<td><input type="text" value="${opInfo.dlvryDt}"></td>
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