<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="assets/css/orderSheetModal.css">
<script src="assets/js/sales/prodInputMngmnt/prodInputMngmntCall.js"></script>
<style>
	#inputGuide{
		margin-left: 10px !important;
		width:300px !important;
		margin-bottom: 30px !important;
		margin-top:10px !important;
	}
</style>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">제품관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">영업관리</a></li>
				<li class="active">제품입고관리</li>
			</ol>
		</div>

		<!-- 업체명 검색 모달 -->
		<!-- <div id="modal" class="w3-modal" style="z-index: 100;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('modal').style.display='none'">&times;</span>
					<h3>업체검색</h3>
					<div>
						<input type="text" id="modalCaNm" placeholder="업체명" style="width: 100%;" autocomplete="off">
						<br/>
						<input type="text" id="modalCaCd" placeholder="업체코드" style="width: 100%;" autocomplete="off">
					</div>
					<div id="caModal"></div>
				</div>
			</div>
		</div>End 업체명 검색 모달 -->

		<!-- 입고목록 상세 모달 -->
		<!-- End 자재발주조회 더블클릭하면 나오는 모달 -->

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div>
								<h5><b>▶입고대기목록</b></h5>
								<div>
									<label for="caNmInput">제품명</label> 
									<input id="caNmInput" type="text" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
								</div>
							</div>
							<div style="clear:both"></div>
							<div id="prodInputList"></div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-8">
					<!-- Lot 부여 테이블 -->
					<div class="card">
						<div>
							<div class="card-action">▶입고등록</div>
							<div style="clear:both"></div>
							<button type="button" class="cndInsBtn mtrlInputMngFloatBtn" id="mtrlInputSaveBtn">저장</button>
							<button type="button" class="cndDelBtn mtrlInputMngFloatBtn">삭제</button>
							<div id="inputReset" style="padding-left: 5px;">
								<label for="mtrlInput" style="margin-left: 10px; width: 80px;">입고일자</label>
								<input type="date" id="mtrlInput" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							</div>
						</div>
						<div style="clear:both"></div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="materialLotSave"></div>
							</div>
						</div>
					</div>
				</div><!-- End Lot 부여 테이블 -->
				<!-- 입고목록 테이블 -->
				<div class="col-md-4">
					<div class="card">
						<div class="card-action">▶입고목록</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="mtrlInputList"></div>
							</div>
						</div>
					</div> <!--End 입고목록 테이블 -->
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<script src="assets/js/sales/prodInputMngmnt/prodInputMngmntCntn.js"></script>
	
</main>