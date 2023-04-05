<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="assets/css/prodProcManage.css">

<main>

	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">생산공정</h1>
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">생산관리</a></li>
				<li class="active">생산공정관리</li>
			</ol>

		</div>

		<div id="page-inner">


			<div class="procPlan">
				<ul>
					<li class="procPlanBtn-r">
						<button>공정이동표</button>
					</li>
					<li class="procPlanBtn-r">
						<button>지시조회</button>
					</li>
				</ul>
			</div>
			<div class="floatEnd"></div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">

						<div class="card-action">
							<h3>진행생산지시</h3>
						</div>
						<div class="card-content">
							<div class="procPlanCraete">
								<table class="candyTab">
									<thead>
										<tr>
											<th>생산지시일자</th>
											<th>제품명</th>
											<th>제품코드</th>
											<th>수량</th>
											<th>공정코드</th>
											<th>공정순번</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2023-04-04</td>
											<td>귤맛오렌지</td>
											<td>qwe2e</td>
											<td>5000</td>
											<td>fac213</td>
											<td>1</td>
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
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">
							<h3>공정목록</h3>
						</div>
						<div class="card-content">
							<div class="prodProc">
								<table class="candyTab">
									<thead>
										<tr>
											<th>공정코드</th>
											<th>공정명</th>
											<th>설비코드</th>
											<th>설비명</th>
											<th>공정담당자</th>
											<th>시작시간</th>
											<th>투입량</th>
											<th>생산량</th>
											<th>불량량</th>
											<th>종료시간</th>
											<th>현재상태</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>job</td>
											<td>잡는다</td>
											<td>att</td>
											<td>뚜까패기</td>
											<td>박종민</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>대기중</td>
										</tr>
										<tr>
											<td>job</td>
											<td>잡는다</td>
											<td>att</td>
											<td>뚜까패기</td>
											<td>박종민</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>대기중</td>
										</tr>
										<tr>
											<td>job</td>
											<td>잡는다</td>
											<td>att</td>
											<td>뚜까패기</td>
											<td>박종민</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>대기중</td>
										</tr>
										<tr>
											<td>job</td>
											<td>잡는다</td>
											<td>att</td>
											<td>뚜까패기</td>
											<td>박종민</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>대기중</td>
										</tr>
										<tr>
											<td>job</td>
											<td>잡는다</td>
											<td>att</td>
											<td>뚜까패기</td>
											<td>박종민</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>대기중</td>
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