<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

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
								<input type="text">
								<button id="ordrSrchBtn" class="srchBtn">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
							<div>
								<label for="companyName">제품명</label>
								<input type="text">
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
						<button id="ordrBtn" class="cndSelBtn" type="button">조회</button>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-12">
					<div class="btnBox">
						<button id="ordrBtn" class="cndInsBtn" type="button">등록</button>
						<button id="ordrBtn" class="cndUdtBtn" type="button">수정</button>
						<button id="ordrDelBtn" class="cndDelBtn" type="button">삭제</button>
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
		let ordrBtn = document.getElementById("ordrBtn"); //조회버튼
		let delBtn = document.getElementById("delBtn"); //삭제버튼
		let ordrSrchBtn = document.getElementById("ordrSrchBtn"); //모달 거래처 검색 버튼
		let confirmBtn = document.getElementById("confirmBtn"); //거래처 모달창 확인버튼
		let vendNmInput = document.getElementById("vendNm"); //거래처명 검색 인풋박스
		let selStrtDt = ""; //주문일자 검색
		let selendDt = ""; //주문일자 검색
		let vendNm = ""; //거래처명 검색
		let checkLen = 0; //체크박스 선택 개수
		let vendSearch = ""; //모달창 거래처명 저장변수
		
		 //조회버튼 눌렀을때 
	    function search() {
	      start = document.getElementById("selStrtDt").value;
	      end = document.getElementById("selendDt").value;
	      vendNm = document.getElementById("vendNm").value.toUpperCase();
	      $.ajax({
	        url: "orderSearch",
	        method: "post",
	        data: { start: start, end: end, vendNm: vendNm },
	        success: function (data) {
	          grid.resetData(data); //그리드 적용
	        },
	        error: function (reject) {
	          console.log(reject);
	        },
	      });
	    }


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