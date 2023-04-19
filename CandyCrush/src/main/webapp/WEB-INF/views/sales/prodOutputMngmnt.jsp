<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="assets/js/sales/prodOutputMngmnt/prodOutputMngmntCall.js"></script>
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
								<h5><b>▶주문서 목록</b></h5>
								<div style="display:flex; justify-content: space-between; align-items: center;">
									<div style="display: block; align-items: center;">
										<label for="accountName">거래처명</label>
										<input id="accountName" name="accountName" type="text"
											style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
									</div>
								</div>
								
							</div>
							<div style="clear:both"></div>
							<div id="outputOrdrShtList"></div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<!-- 주문서 상세조회 테이블 -->
				<div class="col-md-6">
					<div class="card">
						<div>
							<div class="card-action">▶주문서 상세목록</div>
							<div style="clear:both"></div>
						</div>
						<div style="clear:both"></div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="outputOrdrShtDtlList"></div>
							</div>
						</div>
					</div>
				</div><!-- End Lot 부여 테이블 -->
				
				<!-- 제품재고 확인 테이블 -->
				<div class="col-md-6">
					<div class="card">
						<div class="card-action">▶제품재고조회</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="prdctInstt"></div>
							</div>
						</div>
					</div> 
				</div> <!--End 제품재고 확인 테이블 -->
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<script src="assets/js/sales/prodOutputMngmnt/prodOutputMngmntCntn.js"></script>
	
</main>