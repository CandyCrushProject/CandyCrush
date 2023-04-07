<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script src="assets/js/orderSheet/orderSheet.js"></script>
<main>
	<!-- 업체검색 Modal -->
	<div id="accntNmMdl" class="w3-modal" style="z-index: 100;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright"
					onclick="document.getElementById('accntNmMdl').style.display='none'">&times;</span>
				<h3>업체검색</h3>
				<div>
					<input type="text" id="modalCaNm" placeholder="업체명" style="width: 50%;">
					<button class="srchBtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				<!-- 업체명 붙음 -->
				<div id="accntmdl"></div>
			</div>
		</div>
	</div><!-- End Modal -->

	<!-- 제품명 Modal -->
	<div id="prdNmMdl" class="w3-modal" style="z-index: 100;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright"
					onclick="document.getElementById('prdNmMdl').style.display='none'">&times;</span>
				<h3>업체검색</h3>
				<div>
					<input type="text" id="modalCaNm" placeholder="업체명" style="width: 90%;">
					<br />
					<input type="text" id="modalCaCd" placeholder="업체코드" style="width: 90%;">
					<button class="srchBtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				<!-- 제품명 붙음 -->
				<div id="prodMdl"></div>
			</div>
		</div>
	</div><!-- End Modal -->

	<!-- 주문서 등록 Modal -->
	<div id="prdNmMdl" class="w3-modal" style="z-index: 100;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright"
					onclick="document.getElementById('prdNmMdl').style.display='none'">&times;</span>
				<h3>업체검색</h3>
				<div>
					<input type="text" id="modalCaNm" placeholder="업체명" style="width: 90%;">
					<br />
					<input type="text" id="modalCaCd" placeholder="업체코드" style="width: 90%;">
					<button class="srchBtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				<!-- 제품명 붙음 -->
				<div id="prodMdl"></div>
			</div>
		</div>
	</div><!-- End Modal -->
	
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
						<div class="card-content">
							<div>
								<label for="acctnNm">거래처명</label> <!-- 거래처명 label -->
								<input type="text" id="ordrCmpnyNm" style="width: 200px;"> <!-- 거래처명 input -->
								<button id="mdlCaNmSrchBtn" class="srchBtn"> <!-- 거래처 모달창 버튼 -->
									<i class="fa-solid fa-magnifying-glass"></i>
								</button> <!-- 거래처 모달창 버튼 -->
							</div>
							<div>
								<label for="prodNm">제품명</label> <!-- 제품명 label -->
								<input type="text" id="prodNm" style="width: 200px;"/> <!-- 제품명 input -->
								<button id="prdNmSrchBtn" class="srchBtn"> <!-- 제품명 모달 버튼-->
									<i class="fa-solid fa-magnifying-glass"></i>
								</button> <!-- end 조회버튼-->
							</div>
							<div>
								<label for="companyName">주문일자</label> <!-- 주문일자 label -->
								<input type="date" id="selStrtDt"> - <input type="date" id="selendDt"> <!-- date input -->
							</div>
						</div>
						<!-- 조회버튼 -->
						<button id="ordrBtn" class="cndSelBtn" type="button">조회</button>
						<!-- end 조회버튼 -->
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-12">
					<!-- 버튼 박스 -->
					<div class="btnBox">
						<button id="ordrBtn" class="cndInsBtn" type="button" onclick="search()">등록</button> 
						<button id="ordrBtn" class="cndUdtBtn" type="button">수정</button>
						<button id="ordrDelBtn" class="cndDelBtn" type="button">삭제</button>
					</div> <!-- end 버튼 박스 -->
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">주문서조회</div>
						<div class="card-content">
							<!-- 주문서 목록 조회박스 -->
							<div class="table-responsive">
								<div id="orderList"></div>
							</div> <!-- end 주문서 목록 조회박스 -->
						</div>
					</div>
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
</main>

<script>
	// 주문조회 목록 Grid
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

