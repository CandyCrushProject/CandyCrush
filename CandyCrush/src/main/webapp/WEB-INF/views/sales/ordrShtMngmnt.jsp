<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="assets/css/orderSheetModal.css">
<script src="assets/js/orderSheet/ordrShtMngmntCall.js"></script>
<main>
	
	<!-- 주문서 등록 모달 -->
	<div id="ordrDtilMdl" class="w3-modal" style="z-index: 100;">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span class="w3-button w3-display-topright"
          onclick="document.getElementById('ordrDtilMdl').style.display='none'">&times;</span>
        <h3 class="mdlTitle">주문서</h3>
        <form action="">
          <div class="accntInfo">
            <label for="orshNo">주문서번호</label>
            <input id="orshNo" name="orshNo" type="text" readonly>
          </div>
          <div class="accntInfoMngBox">
						<div class="accntInfo">
							<label for="caNo">거래처코드</label>
							<input id="caNo" name="caNo" type="text" readonly>
						</div>
						<div class="accntInfo">
							<label for="caNm">거래처명</label>
							<input id="caNm" name="caNm" type="text" readonly>
						</div>
					</div>
          <div class="accntInfoMngBox">
            <div class="accntInfo">
              <label for="caMng">담당자</label>
              <input id="caMng" name="caMng" type="text" readonly>
            </div>
            <div class="accntInfo">
              <label for="caMngPh">담당자번호</label>
              <input id="caMngPh" name="caMngPh" type="tel" readonly>
            </div>
          </div>
          <div class="accntInfo">
            <label for="orshDt">주문일자</label>
            <input id="orshDt" name="orshDt" type="date" readonly>
            <label for="dlvryDt">납기일자</label>
            <input id="dlvryDt" name="dlvryDt" type="date">
          </div>
					<div>
						<h4>제품선택</h4>
						<button id="getOrdrBtn" type="button">
							<i class="fa-solid fa-plus"></i>
						</button>
					</div>
					<div class="table-responsive">
						<div id="ordrProdList"></div>
					</div>
          
          <!-- <table>
            <colgroup>
              <col style="width: 33.33%" />
              <col style="width: 33.33%" />
              <col style="width: 33.33%" />
            </colgroup>
            <thead>
              <tr>
                <th>주문상세코드</th>
                <th>제품명</th>
                <th>수량</th>
              </tr>
            </thead>
          </table> -->
        </form>
        <div id="ordrModal"></div>
      </div>
    </div>
  </div><!-- End 주문서 등록 -->

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