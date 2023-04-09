<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<link rel="stylesheet" href="assets/css/processOrder.css">
	<main>
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
						<div class="card">
							<div class="card-content">
								<div class="procOder">
									<ul>
										<li class="procOderBtn-r">
											<button>저장</button>
										</li>
										<li class="procOderBtn-r">
											<button>계획조회</button>
										</li>
										<li class="procOderBtn-r">
											<button>초기화</button>
										</li>
									</ul>
								</div>
								<div class="floatEnd"></div>
								<div class="procOderCraete">
									<table class="candyTab">
										<thead>
											<tr>
												<th>제품코드</th>
												<th>제품명</th>
												<th>계획코드</th>
												<th>납기일자</th>
												<th>필요수량</th>
												<th>지시수량</th>
												<th>담당자</th>
												<th>작업지시일</th>
											</tr>
										</thead>
										<tbody>
											<div id="procPlanList"></div>
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

				<!-- /. PAGE WRAPPER  -->
			</div>
		</div>
	</main>