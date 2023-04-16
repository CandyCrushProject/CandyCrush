<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


			<link rel="stylesheet" href="assets/css/processManagement.css">
			<style>
				.matop {
					margin-top: 20px;
				}

				input[type="date"] {
					border: none;
					border-bottom: 1px solid #9e9e9e;
				}

				.btnSet {
					float: right;
					margin-right: 20px;
				}

				.btnSet button {
					margin: 0px 5px;
				}

				#orderSheetTab td {
					vertical-align: middle;
				}

				#orderSheetTab tr:hover {
					cursor: pointer;
					background-color: antiquewhite;
				}

				#orderDetail tr:hover {
					cursor: pointer;
					background-color: antiquewhite;
				}
			</style>
			<main>
				<!-- 주문서 조회 모달 -->
				<div class="modal fade" id="order" tabindex="-1">
					<div class="modal-dialog modal-lg modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<h3 class="modal-title">주문서 상세 조회</h3>
								<br>
								<h5>주문번호</h5>
								<input type="text" id="orshNoCd" style="width: 200px;" readonly>
							</div>
							<div class="modal-body">
								<div id="orderDetailList"></div>
							</div>
							<div class="modal-footer">
								<button type="button" class="cndRstBtn" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<!-- /. NAV SIDE  -->
				<div id="page-wrapper">
					<div class="header">
						<h1 class="page-header">생산계획</h1>
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">생산관리</a></li>
							<li class="active">생산계획관리</li>
						</ol>
					</div>

					<div id="page-inner">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-content">
										<div class="procPlanCraete">
											<div>
												<button type="button" class="cndInsBtn hi" style="float: right; display: inline;"
													id="planAddBtn">
													<i class="fa-solid fa-plus"></i> 추가
												</button>
											</div>
											<h4 style="padding-bottom: 20px;">미계획 주문서 리스트</h4>
											<!-- 처음 주문서들 정보 뿌려줄 것들 -->
											<div id="orderSheetGrid"></div>
										</div>
										<div class="clearBoth">
											<br />
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="row inpw">
							<div class="col-md-12">
								<div class="card">
									<div class="card-action">
										<h3>생산계획등록</h3>
									</div>
									<div class="btnSet">
										<button type="button" class="cndInsBtn hi" id="addPlanBtn">
											<i class="fa-solid fa-plus"></i> 등록
										</button>
									</div>
									<div class="clearBoth"></div>
									<div class="card-content">

										<input type="hidden" name="prpldStatus" id="prpldStatus" value="미지시" readonly>
										<input type="hidden" name="prplStatus" id="prplStatus" value="계획완료" readonly>
										<h4>생산계획일자</h4>
										<input type="date" name="prplDt" id="prplDt" value="" readonly>
										<div id="insertPlanGrid"></div>

									</div>
									<div class="clearBoth">
										<br />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<script>
				let list = "";
				let getrow;
				let sendrows = [];
				let orshNoList = [];
				let ordrDtlCdSet = "";
				let orshNoSet = "";
				$(function () {
					getOrder();
					$('#prplDt').val(getToday());
				})
				// 처음 뿌려주는 미계획주문서 리스트
				function getOrder() {
					$.ajax({
						url: 'getOrder',
						type: 'GET',
						dataType: 'json',
						success: function (data) {
							orderSheetGrid.resetData(data);
						},
						error: function (xhr, status, error) {
							// 요청이 실패했을 때 처리할 로직
							console.error('요청 실패:', error);
						}
					});
				}




				// 날짜 포맷 변경 함수
				function formatDate(time) {
					var date = new Date(time);
					var year = date.getFullYear();
					var month = ("0" + (date.getMonth() + 1)).slice(-2);
					var day = ("0" + date.getDate()).slice(-2);
					var formattedDate = year + "-" + month + "-" + day;
					return formattedDate;
				}
				// 오늘날짜
				function getToday() {
					var date = new Date();
					var year = date.getFullYear();
					var month = ("0" + (date.getMonth() + 1)).slice(-2);
					var day = ("0" + date.getDate()).slice(-2);
					var formattedDate = year + "-" + month + "-" + day;
					return formattedDate;
				}

				$(document).ready(function () {
					// 미계획 주문서 리스트 체크된 데이터를 가져와 db에서 정보 가져옴
					$('#planAddBtn').on('click', function () {
						const rows = orderSheetGrid.getCheckedRows();
						for (let i = 0; i < rows.length; i++) {
							orshNoSet += rows[i].orshNo + ",";
						}
						list = {
							orshNo: orshNoSet
						};
						if (rows.length > 0) {
							$.ajax({
								url: "getDownOrders",
								method: "POST",
								contentType: 'application/json',
								data: JSON.stringify(list),
								dataType: 'json',
								success: function (data) {
									let orshNom = "";
									let op = data.orderNPlan;
									addOrderPlanGrid.resetData(op);
									orderSheetGrid.removeCheckedRows();
								}, error: function (err) {
									Swal.fire({
										icon: 'error',
										title: '경고',
										text: "목록을 불러올 수 없습니다.",
									});
								}
							});
						} else {
							Swal.fire({
								icon: 'error',
								title: '경고',
								text: "선택된 주문서나 데이터가 없습니다.",
							});
						};
					});

				});

				function addUpdate() {
					console.log(list);
					$.ajax({
						url: 'orderUpdate',
						method: 'post',
						data: JSON.stringify(list),
						contentType: 'application/json',
						dataType: 'json',
						success: function (data) {
							console.log("성공", data)
						}, error: function (rej) {
							console.log("안되는데요?")
						}
					});
				}
				$(document).ready(function () {


					$('#addPlanBtn').on('click', function () {
						$.ajax({
							url: 'insertProcPlan',
							method: 'POST',
							data: JSON.stringify(addOrderPlanGrid.getData({ ignoredColumns: ['_attributes', 'rowKey'] })),
							contentType: 'application/json',
							dataType: 'json',
							success: function (data) {
								if (data.retCode == '실패') return;
								addOrderPlanGrid.clear();
								Swal.fire({
									icon: 'success',
									title: '등록',
									text: "생산계획 등록이 완료되었습니다.",
								});
								addUpdate();
							}, error: function (rej) {
								Swal.fire({
									icon: 'error',
									title: '실패',
									text: "등록도중 오류가 생겼습니다.",
								});
							}
						});

					});
				});

				// 미계획 주문서에 대한 데이터 리스트 받아오는 그리드
				const orderSheetGrid = new tui.Grid({
					el: document.getElementById('orderSheetGrid'),
					minBodyHeight: 30,
					rowHeaders: ['checkbox'],
					columns: [
						{
							header: '주문번호',
							name: 'orshNo',
							align: 'center'
						},
						{
							header: '주문건수',
							name: 'ordrCdCnt',
							align: 'center'
						},
						{
							header: '거래처',
							name: 'caNm',
							align: 'center'
						},
						{
							header: '주문일자',
							name: 'orshDt',
							align: 'center'
						},
						{
							header: '납품일자',
							name: 'dlvryDt',
							align: 'center'
						}
					]
				});

				var row;
				// 행 클릭시 모달이 뜨며 정보가 들어있는 그리드 함수 실행
				orderSheetGrid.on('dblclick', function (ev) {

					row = orderSheetGrid.getRow(ev.rowKey);
					console.log(row);

					getOrderDetail(row.orshNo, row.caNm);
					$('#order').modal('show');
				});

				// 주문 상세 모달창
				function getOrderDetail(orshNo, caNm) {
					$.ajax({
						url: 'getOrderDetail',
						method: 'post',
						data: {
							orshNo: orshNo,
							caNm: caNm
						},
						success: function (data) {
							orderDetailGrid.resetData(data);
							$('#orshNoCd').val(data[0].orshNo);
							setTimeout(() => orderDetailGrid.refreshLayout(), 200);
						}, error: function (rej) {
							console.log(rej);
						}
					});
				}

				// 미계획 주문서에 대한 데이터 리스트 받아오는 그리드
				const orderDetailGrid = new tui.Grid({
					el: document.getElementById('orderDetailList'),
					minBodyHeight: 30,
					rowHeaders: ['rowNum'],
					columns: [
						{
							header: '주문상세코드',
							name: 'ordrDtlCd',
							align: 'center'
						},
						{
							header: '제품명',
							name: 'cprNm',
							align: 'center'
						},
						{
							header: '거래처',
							name: 'caNm',
							align: 'center'
						},
						{
							header: '주문수량',
							name: 'ordrDtlCnt',
							align: 'center'
						},
						{
							header: '현재상태',
							name: 'orshPr',
							align: 'center'
						},
					]
				});

				// 체크된 주문리스트를 계획등록폼으로 이동시킴
				const addOrderPlanGrid = new tui.Grid({
					el: document.getElementById('insertPlanGrid'),
					scrollX: false,
					scrollY: false,
					minBodyHeight: 30,
					rowHeaders: ['rowNum'],
					columns: [
						{
							header: '제품코드',
							name: 'cprCd',
							hidden: true
						},
						{
							header: '제품명',
							name: 'cprNm',
							align: 'center'
						},
						{
							header: '주문수량',
							name: 'sumDtlCnt',
							align: 'center',
						},
						{
							header: '생산계획수량',
							editor: 'text',
							name: 'prpldCnt',
							align: 'center',
						},
						// {
						// 	header: '생산작업일자',
						// 	name: 'prstDt',
						// 	formatter: function (data) {
						// 		let dateVal = '';
						// 		if (data.value != null) {
						// 			dateVal = formatDate(data.value);
						// 		} else {
						// 			dateVal = getToday();
						// 		}
						// 		return dateVal;
						// 	},
						// 	editor: {
						// 		type: 'datePicker',
						// 		options: {
						// 			format: 'yyyy-MM-dd',
						// 			date: getToday()
						// 		}
						// 	}
						// },
						{
							header: '계획관리자',
							name: 'prplMng',
							editor: 'text',
							align: 'center',
						}
					]
				});

			</script>