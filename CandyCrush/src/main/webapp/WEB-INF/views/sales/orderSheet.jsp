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
					<input type="text" id="accntMdlCaNm" placeholder="업체명" style="width: 50%;" autocomplete="off">
					<!-- <input type="text" id="accntMdlCaCd" placeholder="업체코드" style="width: 90%;"> -->
				</div>
				<!-- 업체명 붙음 -->
				<div id="accntmdl"></div>
			</div>
		</div>
	</div><!-- End Modal -->
	
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">주문서조회</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">영업관리</a></li>
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
								<input type="text" id="ordrCmpnyNm" style="width: 50%;"> <!-- 거래처명 input -->
							</div>
							<div>
								<label for="companyName">주문일자</label> <!-- 주문일자 label -->
								<input type="date" id="selStrtDt" style="width: 25%;"> - <input type="date" id="selendDt" style="width: 25%;"> <!-- date input -->
							</div>
						</div>
						<!-- 조회버튼 -->
						<button id="ordrSchBtn" class="cndSelBtn" type="button">
							<i class="fa-solid fa-magnifying-glass"></i>조회
						</button>
						<button type="button" class="cndRstBtn hi" id="resetBtn">
							<i class="fa-solid fa-rotate-right"></i> 초기화
						</button>
						<!-- end 조회버튼 -->
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-12">
					
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">주문서조회</div>
						<div class="card-content">
							<!-- 주문서 목록 조회박스 -->
							<div class="table-responsive">
								<div id="orderList"></div>
							</div> <!-- end 주문서 목록 조회박스 -->
							<div>
								<button type="button" id="excelBtn" class="cndInsBtn">EXCEL</button>
							</div>
						</div>
						
					</div>
				</div>
			</div> <!--END row-->
		</div> <!-- /. PAGE INNER  -->
	</div>
</main>

<script>
//---------------------------------------------------------------------------------------------
	//업체정보조회 :  Model Class -> c tag
		let ordrAccntList = [
			<c:forEach items="${accuntList}" var="acList">
			{
				caNo : '${acList.caNo}',
				caNm : '${acList.caNm}',
				caCeoNm : '${acList.caCeoNm}',
				caMng : '${acList.caMng}',
				caMngPh : '${acList.caMngPh}'
			},
			</c:forEach>
		];

		//업체명 modal Grid
		const accntGrid = tui.Grid;
		const accntmdl = new accntGrid({
			el: document.getElementById('accntmdl'),
			data: ordrAccntList,
			columns: [
				{
					header: '거래처코드',
					name: 'caNo',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '거래처명',
					name: 'caNm'
				},
				{
					header: '대표자',
					name: 'caCeoNm'
				},
				{
					header: '담당자',
					name: 'caMng'
				},
				{
					header: '담당자번호',
					name: 'caMngPh'
				}
			],
			bodyHeight: 200,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		let accntMdlCaNm = ""; // 모달창에서 업체 저장 변수

		//모달창 업체명검색
		function mdlAccntSrch() {
			accntMdlCaNm = document.getElementById('accntMdlCaNm').value;

			$.ajax({
				url: "ordrAccntSrch",
				method: "POST",
				dataType: "JSON",
				data: { caNm: accntMdlCaNm },
				success: function (data) {
					console.log(data);
					accntmdl.resetData(data);
				},
				error: function (rej) {
					console.log(rej)
				}
			});
		}
//---------------------------------------------------------------------------------------------
	

	$(document).ready(function () {
		// 거래처 모달
		$('#ordrCmpnyNm').on('click', function () {
			document.getElementById('accntNmMdl').style.display = 'block';
			setTimeout(() => accntmdl.refreshLayout(), 0);
		});

		//조회버튼 눌렀을 때 검색
		$('#ordrSchBtn').on('click', function () {
			ordrShtSearch();
		});

		//
		$('#accntMdlCaNm').on('input', function () {
			mdlAccntSrch();
		});

		$("#excelBtn").on('click', function () {
			Swal.fire({
				title: '엑셀파일로 받아보시겠습니까?',
				text: "원하지 않는다면 취소를 눌러주세요",
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '확인',
				cancelButtonText: '취소',
				reverseButtons: true, // 버튼 순서 거꾸로

			}).then((result) => {
				if (result.isConfirmed) {
					moModal.export('xlsx', options);
				} else {
					Swal.fire({
						title: '취소되었습니다',
						icon: 'success'
					});
				}
			});
		});

		// 모달창 tr 선택하면 조회페이지 input에 입력되는 click event
		accntmdl.on("click", (e) => {
			let caNm = accntmdl.getData()[e.rowKey].caNm;
			if (e.targetType !== "columnHeader") {
				Swal.fire({
					icon: 'success',
					title: '업체명 선택완료',
					text: '업체명 : ' + caNm,
				});
				$("#ordrCmpnyNm").val(caNm);
				$("#accntNmMdl").hide();
			}
		});

		//ESC 누르면 모달창 없어지게 하는 방법
		//keydown --> 사용자가 키를 누르거나 키를 놓을 때 발생
		$(window).on("keydown", (e) => {
			let accntNmMdl = $("#accntNmMdl");

			//e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
			if (e.keyCode === 27 && accntNmMdl.css("display") === "block") {
				accntNmMdl.hide();
			};
		});
	});

	
</script>