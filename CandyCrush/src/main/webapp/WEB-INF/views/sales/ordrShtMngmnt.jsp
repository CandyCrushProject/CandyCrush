<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="assets/js/orderSheet/ordrShtMngmntCall.js"></script>
<style>
	label {
		width: 70px;
		margin-left: 10px;
		color: black;
	}

	#inputBox {
		margin-left: 10px;
	}

	#contextBox {
		float: right;
		margin-bottom: 20px;
	}

	input[type="text"] {
		width: 90%;
	}
</style>
<main>
	<!-- 자재발주조회 더블클릭하면 나오는 모달 -->
	<div id="orderDetailModal" class="w3-modal" style="z-index: 101;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright"
					onclick="document.getElementById('orderDetailModal').style.display='none'">&times;</span>
				<h3>상세발주목록</h3>
				<div style="clear:both"></div>
				<div id="rigth">
					<button type="button" id="excelBtn" class="cndInsBtn">EXCEL</button>
					<button type="button" id="dateUpdateBtn" class="cndUdtBtn">수정</button>
				</div>
				<label for="modalMocd">발주코드</label>
				<input type="text" id="modalMocd" style="width: 90%;" readonly>
				<div id="moModal"></div>
			</div>
		</div>
	</div><!-- End 자재발주조회 더블클릭하면 나오는 모달 -->

	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">주문서관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">영업관리</a></li>
				<li class="active">주문서관리</li>
			</ol>
		</div>

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!--자재목록 테이블-->
					<div class="card">
						<div class="card-content">
							<div id="inputBox">
								<label for="accountName">거래처명</label>
								<input type="text" id="accountName" autocomplete="off"
									style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<button class="srchBtn">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
							<div class="card-action">거래처목록</div>
							<div class="table-responsive">
								<div id="accntList"></div>
							</div>
						</div>
					</div>
					<!--End 자재목록 테이블 -->
				</div>
			</div> <!--END row-->
			<!--자재발주 테이블-->
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">자재발주</div>
						<div class="card-content">
							<div id="contextBox">
								<button id="orderInsert" class="cndInsBtn">
									<i class="fa-solid fa-plus"></i>등록
								</button>
								<button class="cndUdtBtn" type="button">
									<i class="fa-solid fa-wrench"></i>수정
								</button>
								<button id="orderDelete" class="cndDelBtn">
									<i class="fa-solid fa-minus"></i>삭제
								</button>
							</div>
							<div style="clear:both"></div>
							<div class="table-responsive">
								<div id="materialOrder"></div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>

	<script src="assets/js/orderSheet/ordrShtMngmntCntnt.js"></script>
</main>