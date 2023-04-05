<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="assets/css/processManagement.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<main>


	<!-- The Modal -->
	<div id="order" class="w3-modal">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span onclick="document.getElementById('order').style.display='none'"
					class="w3-button w3-display-topright">&times;</span>
				<p>주문정보를 받을거임</p>
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
									<li class="procPlanBtn-l">생산계획일자</li>
									<li class="procPlanBtn-l"><input type="date"></li>
									<li class="procPlanBtn-r">
										<button>
											<i class="material-icons dp48 itag">library_add</i>등록
										</button>
									</li>
									<li class="procPlanBtn-r">
										<button onclick="document.getElementById('order').style.display='block'">
											<i class="material-icons dp48 itag">library_books</i>주문서
										</button>
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
											<th>주문번호</th>
											<th>거래처코드 / 거래처명</th>
											<th>요청수량</th>
											<th>납기일자</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>candycrush000001</td>
											<td>ㅁㄴㅇ/ㅁㄴㅇ</td>
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