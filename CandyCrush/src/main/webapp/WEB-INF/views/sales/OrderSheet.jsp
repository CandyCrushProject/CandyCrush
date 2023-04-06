<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>


<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />

<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<link rel="stylesheet" href="assets/css/input.css">
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">주문서조회</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">주문서관리</a></li>
				<li class="active">주문서조회</li>
			</ol>

		</div>

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">주문서조회</div>-->
						<div class="card-content">
							<div>
								<label>거래처명</label>
								<input type="text" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<button class="srchBtn">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
							<div>
								<label for="companyName">제품명</label>
								<input type="text" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<button class="srchBtn">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
							<div>
								<label for="companyName">주문일자</label>
								<input type="date" id="selStrtDt"> - <input type="date" id="selendDt">
							</div>
							<div style="clear:both"></div>
						</div>
						<button class="cndSelBtn" type="button">조회</button>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-12">
					<div class="btnBox">
						<button class="cndInsBtn" type="button">등록</button>
						<button class="cndUdtBtn" type="button">수정</button>
						<button class="cndDelBtn" type="button">삭제</button>
					</div>
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">주문서조회</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="orderList"></div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>

	<script>
		const Grid = tui.Grid;
		let orderData = [
			<c:forEach items="${ordrShtList}" var="ordrSht">
				{
					orshNo: '${ordrSht.orshNo}',
					cprCd: '${ordrSht.cprCd}',
					caNo: '${ordrSht.caNo}',
					orshDt: '${ordrSht.orshDt}',
					orshPr: '${ordrSht.orshPr}'
				},
			</c:forEach>
		];
		
		// 자재목록
		const orderList = new Grid({
			el: document.getElementById('orderList'), // Container element
			data: orderData,
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '주문서번호',
					name: 'orshNo',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품코드',
					name: 'cprCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '거래처코드',
					name: 'caNo',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '주문일자',
					name: 'orshDt',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '현재상황',
					name: 'orshPr'
				}
			],
			bodyHeight: 500,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  		}
		});
</script>
</main>