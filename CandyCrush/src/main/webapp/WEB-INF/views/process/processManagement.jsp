<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/css/processManagement.css">

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
						<div class="card-action"><h3>생산계획관리</h3></div>
						<div class="card-content">
							<div class="procPlan">
								<ul>
									<li class="procPlanBtn-l">생산계획일자</li>
									<li class="procPlanBtn-l"><input type="date"></li>
									<li class="procPlanBtn-r">
										<button>등록</button>
									</li>
									<li class="procPlanBtn-r">
										<button>주문서</button>
									</li>
									<li class="procPlanBtn-r">
										<button>초기화</button>
									</li>
								</ul>
							</div>
							<div class="floatEnd"></div>
							<div class="procPlanCraete">
								<table class="candyTab">
									<thead>
										<tr>
											<th>계획코드</th>
											<th>주문번호</th>
											<th>필요수량</th>
											<th>납기일자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>candycrush000001</td>
											<td>candycrush000001</td>
											<td>5000</td>
											<td>2023-04-04</td>
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
						<div class="card-action"><h3>제품공정</h3></div>
						<div class="card-content">
							<div class="prodProc">
								<table class="candyTab">
									<thead>
										<tr>
											<th>제품명</th>
											<th>공정코드</th>
											<th>시작일자</th>
											<th>종료일자</th>
											<th>생산수량</th>
											<th>작업우선순위</th>
											<th>계획코드</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>딸기맛담배</td>
											<td>fac0001</td>
											<td>2023-04-04</td>
											<td>2023-04-10</td>
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
						<div class="card-action"><h3>제품공정확인</h3></div>
						<div class="card-content">
							<div class="prodProc">
								<table class="candyTab">
									<thead>
										<tr>
											<th>제품명</th>
											<th>공정코드</th>
											<th>계획코드</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>초코맛오뎅</td>
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
						<div class="card-action"><h3>사용가능자재</h3></div>
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
						<div class="card-action"><h3>제품공정확인</h3></div>
						<div class="card-content">
							<div class="prodProc">
								<table class="candyTab">
									<thead>
										<tr>
											<th>제품코드</th>
											<th>공정순번</th>
											<th>공정코드</th>
											<th>계획코드</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>prod0001</td>
											<td>fac0001</td>
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

			<!-- /. PAGE WRAPPER  -->
		</div>
	</div>


</main>