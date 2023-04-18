<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="assets/js/sales/prodInputMngmnt/prodOutputMngmntCall.js"></script>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">제품관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">영업관리</a></li>
				<li class="active">제품출고관리</li>
			</ol>
		</div>

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div>
								<h5><b>▶입고대기목록</b></h5>
								<div style="display:flex; justify-content: space-between; align-items: center;">
									<div style="display: block; align-items: center;">
										<label for="productName">제품명</label>
										<input id="productName" name="productName" type="text"
											style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
									</div>
									<div>
										<button id="prdWtngBtn" type="button" class="cndInsBtn">저장</button>
									</div>
								</div>
								
							</div>
							<div style="clear:both"></div>
							<div id="inputWaitingList"></div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<!-- 입고목록 그리드 -->
				<div class="col-md-7">
					<div class="card">
						<div>
							<div class="card-action">▶입고목록</div>
							<div style="clear:both"></div>
							<div id="inputReset" style="padding-left: 5px;">
								<label for="prodInputDt" style="margin-left: 10px; width: 80px;">입고일자</label>
								<input type="date" id="prodInputDt" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							</div>
						</div>
						<div style="clear:both"></div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="prodInputList"></div>
							</div>
						</div>
					</div>
				</div><!-- End Lot 부여 테이블 -->
				
				<!-- 입고목록 테이블 -->
				<div class="col-md-5">
					<div class="card">
						<div class="card-action">▶입고목록상세조회?</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="mtrlInputList"></div>
							</div>
						</div>
					</div> 
				</div> <!--End 입고목록 테이블 -->
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<script src="assets/js/sales/prodInputMngmnt/prodOutputMngmntCntn.js"></script>
	
</main>