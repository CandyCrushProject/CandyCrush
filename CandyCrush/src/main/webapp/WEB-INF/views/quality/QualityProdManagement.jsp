<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<main>
    <!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">제품검사관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">품질관리</a></li>
				<li class="active">제품검사관리</li>
			</ol>
		</div>

		<!-- 업체명 검색 모달 -->
		<div id="modal" class="w3-modal" style="z-index: 100;">
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
		</div><!-- End 업체명 검색 모달 -->

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div>
								<h5><b>▶ 제품검사관리</b></h5>
								<div>
									<label for="caNmInput">생산지시명</label> 
									<input type="text" id="caNmInput" style="width: 440px; border: 1px solid rgba(128, 128, 128, 0.61);" readonly>&nbsp;
									<button class="srchBtn" id="companySearch"><i class="fa-solid fa-magnifying-glass"></i></button>
									
									<br/>
									<label for="start">검사일자</label>
									<input type="date" id="start"
											style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;
									<input type="date" id="end" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
									<button type="button" id="inspSearchBtn" class="cndInsBtn">가져오기</button>
								</div>
							</div>
							<div style="clear:both"></div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<!-- 생산지시 테이블 -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">▶생산지시 목록</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="procCommandList"></div>
							</div>
						</div>
					</div> <!--End 생산지시 테이블 -->
				</div>
			</div> <!--END row-->
			<div class="row">
				<!-- 공정지시 테이블? -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">▶생산지시 상세목록</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="prodcProgressList"></div>
							</div>
						</div>
					</div> <!--End 공정지시 테이블 -->
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<script>
		const Grid = tui.Grid;

		//생산지시 Grid // procCommandList
		const procCommandList = new Grid({
			el: document.getElementById('procCommandList'),
			scrollX: false,
			columns: [
				{
					header: '생산지시코드',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '생산지시명',
					name: ''
				},
				{
					header: '작업일자',
					name: ''
				}
			],
			bodyHeight: 250,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//공정지시 Grid // prodcProgressList
		const prodcProgressList = new Grid({
			el: document.getElementById('prodcProgressList'),
			columns: [
				{
					header: '공정코드',
					name: '',
					sortingType: 'asc',
					sortable: true,
				},
				{
					header: '검사량',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '불량수량',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '합격수량',
					name: ''
				},
				{
					header: '제품코드',
					name: ''
				},
				{
					header: '작업자',
					name: ''
				},
				{
					header: '검사시작시간',
					name: ''
				},
				{
					header: '검사종료시간',
					name: '',
				},
				{
					header : '검사일자',
					name : ''
				}
			],
			bodyHeight: 400,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});
	</script>
</main>