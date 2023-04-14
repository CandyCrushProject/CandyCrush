<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	label{
		width: 70px;
		margin-left: 10px;
		color : black;
	}
	input[type="text"]{
		width: 90%;
	}
	.tui-grid-cell.cell-red {background-color: rgba(255, 121, 121, 0.432)}
	.tui-grid-cell.cell-green {background-color: rgba(118, 228, 118, 0.575)}
	</style>
<main>
	<!-- 업체검색모달 -->
	<div id="modal" class="w3-modal" style="z-index: 100;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright" onclick="document.getElementById('modal').style.display='none'">&times;</span>
				<h3>업체검색</h3>
				<div>
					<input type="text" id="modalCaNm" placeholder="업체명" style="width: 90%;" autocomplete="off">
					<br/>
					<input type="text" id="modalCaCd" placeholder="업체코드" style="width: 90%;" autocomplete="off">
					<button class="srchBtn" id="mtrlOrdermodalBtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				<div id="caModal"></div>
			</div>
		</div>
	</div><!-- End 업체검색모달 -->

	<!-- 자재발주조회 더블클릭하면 나오는 모달 -->
	<div id="orderDetailModal" class="w3-modal" style="z-index: 101;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright" onclick="document.getElementById('orderDetailModal').style.display='none'">&times;</span>
				<h3>상세발주목록</h3>
				<div style="clear:both"></div>
				<div id="rigth">
					<button type="button" id="excelBtn" class="cndInsBtn">EXCEL</button>
					<button type="button" id="dataUpdeBtn" class="cndUdtBtn">수정</button>
					<button type="button" id="dataDelBtn" class="cndDelBtn">삭제</button>
				</div>
				<label for="modalMocd">발주코드</label>
				<input type="text" id="modalMocd" style="width: 90%;" readonly>
				<label for="modalMoStt">진행상황</label>
				<input type="text" id="modalMoStt" style="width: 90%;" readonly>
				<div id="moModal"></div>
			</div>
		</div>
	</div><!-- End 자재발주조회 더블클릭하면 나오는 모달 -->

	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">자재발주관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재발주관리</li>
			</ol>
		</div>
		
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!--자재목록 테이블-->
					<div class="card">
						<div class="card-content">
							<div class="inputReset">
							<label for="mtrlName">원자재명</label>
							<input type="text" id="mtrlName" autocomplete="off"
										style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							<!--<label for="companyName">업체명</label>
							<input type="text" id="companyName" autocomplete="off"
										style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">-->
							<button id="search" class="cndSrchBtn" onclick="search()">검색</button>
							<button type="button" class="cndRstBtn restBtn">초기화</button>
							</div>
							<div class="card-action">자재목록</div>
							<div class="table-responsive">
								<div id="material"></div>
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
						<div class="card-action">
							<span>자재발주</span>
							<div class="mtrlOrderRightBtn">
								<button id="orderDelete" class="cndDelBtn">삭제</button>
								<button id="orderInsert" class="cndInsBtn">등록</button>
							</div>
						</div>
						<div class="card-content">
							<div style="clear:both"></div>
							<div class="table-responsive">
								<div id="materialOrder"></div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">자재발주조회</div>
							<div class="inputReset">
								&nbsp;&nbsp;&nbsp;<label>발주신청일</label>&nbsp;&nbsp;&nbsp;
								<input type="date" id="startDate"
									style="width: 150px;">&nbsp;<span style="font-weight: bold; font-size: larger;">~</span>&nbsp;
								<input type="date" id="endDate"
									style="width: 150px;">&nbsp;&nbsp;&nbsp;
								<label>업체명</label>
								<input type="text" id="companyNameOrderList" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);" autocomplete="off" >
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="cndSrchBtn" id="mtrlOrderSeachBtn" onclick="orderListSearch()">검색</button>
								<button type="button" class="cndRstBtn restBtn">초기화</button>
								<div class="mtrlOrderRightBtn">
									<button type="button" class="cndDelBtn" id="orderMasterDelBtn">발주삭제</button>
								</div>
							</div>
							<div style="clear:both"></div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="materialOrderList"></div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>

	<script>
		//Tost Ui Grid 선언
		const Grid = tui.Grid;

		//날짜 가공
		const date = new Date();
		const years = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const month2 = String(date.getMonth() + 2).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		const getStartToday = years+ "-" + month + "-" + day;
		const getOneMonthLater = years+ "-" + month2 + "-" + day;

		let changecaNm = "";
		//Modal Grid 빠르게 띄우는 방법
		$('#companyName').click(function(){
			document.getElementById('modal').style.display='block';
			changecaNm = "companyName";
			setTimeout(()=> caModal.refreshLayout() , 0);
		});

		$('#companyNameOrderList').on('click',(e)=>{
			document.getElementById('modal').style.display='block';
			changecaNm = "companyNameOrderList";
			//Modal Grid 빠르게 띄우는 방법
			//모달 안에 있는 그리드를 한번 리프레쉬하고
			//아작스를 통해 통신을 한다음데이터를 뿌려준다?
			setTimeout(()=> caModal.refreshLayout() , 0);
		}); 

		//리셋버튼 누르면 input value 초기화해준다.
		$('.restBtn').on('click', ()=>{
			$('.inputReset').find('input').each(function(){
				$(this).val('');
			});
		});

		//업체정보조회 :  Model Class -> c tag
		let accountList =  [
								<c:forEach items="${accountList}" var="acSht">
									{
										caNo : '${acSht.caNo}',
										caNm : '${acSht.caNm}',
										caBsnsNum : '${acSht.caBsnsNum}',
										caMng : '${acSht.caMng}',
										caMngPh : '${acSht.caMngPh}'
									},
								</c:forEach>
							];
//--------------------------------------------------------------Ajax
		let cmmNm = null;
		let caNm = null;
		let OrderListCaNm = null;

		let modalCaNm = null;
		let modalCaCd = null;

		//검색/날짜기준
		let start = null;
		let end = null;
		
		const metarialGetData = (cmmNm = undefined, caNm = undefined) => {
			$.ajax({
				url : "mtrlSearch",
				method :"POST",
				dataType : "JSON",
				data : {cmmNm : cmmNm, caNm : caNm},
				success : function(data){
					material.resetData(data);
					material.getData().forEach(row => {
						//Grid Row color change
						let cmmInven = row.cmmInven;		//현재재고
						let cmmSafStc = row.cmmSafStc; 	//안전재고
						if(cmmInven < cmmSafStc){
							material.addRowClassName(row.rowKey, 'cell-red');
						} /*else {
							material.addRowClassName(row.rowKey, 'cell-green');
						}*/
					});

				} 
			});
		}
		metarialGetData();

		document.getElementById("mtrlName").addEventListener("input", () => {
			search();
		});

		//업체명, 발주신청일 시작일자, 발주신청일 종료일자
		const mtrlOrderGetData = (caNm = undefined, start = undefined, end = undefined) => {
			$.ajax({
				url : "mtrlOrderDateSearch",
				method :"POST",
				dataType : "JSON",
				data : {caNm : caNm, start : start, end : end},
				success : function(data){
					materialOrderList.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("mtrlOrderGetData 통신오류");
				}
			});
		};
		mtrlOrderGetData();
		
		//자재검색
		function search(){
			cmmNm = document.getElementById('mtrlName').value; //원자재명
			caNm = ""//document.getElementById('companyName').value //업체명
			
			$.ajax({
				url : "mtrlSearch",
				method :"POST",
				dataType : "JSON",
				data : {cmmNm : cmmNm, caNm : caNm},
				success : function(data){
					material.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("search 통신오류");
				}
			});
		};
		
		//모달/업체명검색
		function modalAccountSearch(){
			modalCaNm = document.getElementById('modalCaNm').value;
			modalCaCd = document.getElementById('modalCaCd').value;

			$.ajax({
				url : "accountCheck",
				method :"POST",
				dataType : "JSON",
				data : {caNm : modalCaNm, caNo : modalCaCd},
				success : function(data){
					caModal.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("modalAccountSearch 통신오류");
				}
			});
		}

		//modal account search Btn event
		$("#mtrlOrdermodalBtn").on('click',(e)=>{
			modalAccountSearch();
		})

		document.getElementById("modalCaNm").addEventListener("input", () => {
			modalAccountSearch();
		});

		//발주신청일 또는 업체명으로 자재발주를 조회하는 비동기 통신
		function orderListSearch(){
			OrderListCaNm = $("#companyNameOrderList").val();
			start = $("#startDate").val();
			end = $("#endDate").val();

			$.ajax({
				url : "mtrlOrderDateSearch",
				method :"POST",
				dataType : "JSON",
				data : {caNm : OrderListCaNm, start : start, end : end},
				success : function(data){
					//console.log(data);
					materialOrderList.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("search 통신오류");
				}
			});
		};
		
//--------------------------------------------------------------End Ajax

//--------------------------------------------------------Grid Instant
		//업체명 input onclick event modal Grid
		const caModal = new Grid({
			el: document.getElementById('caModal'),
			columns: [
				{
					header: '업체코드',
					name: 'caNo',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '업체명',
					name: 'caNm'
				},
				{
					header: '사업자번호',
					name: 'caBsnsNum'
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
		caModal.resetData(accountList);	// 그리드에 값 입력

		//모달창 tr 선택하면 돌아가는 click event
		caModal.on("click", (e) => {
			let caNm = caModal.getData()[e.rowKey].caNm;
			if (e.targetType !== "columnHeader") {
				Swal.fire({
					icon: 'success',
					title: '업체명 선택완료',
					text: '업체명 : ' + caNm,
				});

				if(changecaNm === "companyName"){
					$("#companyName").val(caNm);
				} else {
					$("#companyNameOrderList").val(caNm);
				}
				$("#modal").hide();	
			};
		});

		//자재목록 Grid
		const material = new Grid({
			el: document.getElementById('material'),
			rowHeaders: ['rowNum'],
			columns: [
				{
					header: '자재코드',
					name: 'cmmCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '자재명',
					name: 'cmmNm',
					sortingType: 'asc',
					sortable: true
				},
				/*{
					header: '업체코드',
					name: 'caNo'
				},
				{
					header: '업체명',
					name: 'caNm'
				},*/
				{
					header: '자재유형',
					name: 'cmmTyp'
				},
				{
					header: '자재규격',
					name: 'cmmSpec'
				},
				{
					header: '자재단위',
					name: 'cmmUnit'
				},
				{
					header: '입고재고',
					name: 'cmlInCnt'
				},
				{
					header: '출고재고',
					name: 'motCnt'
				},
				{
					header: '현재재고',
					name: 'cmmInven'
				},
				{
					header: '안전재고',
					name: 'cmmSafStc',
					formatter: function(rowdata) {
						//let rowData = value.row.;
						let cmmInven = rowdata.row.cmmInven;	//현재재고
						let cmmSafStc = rowdata.row.cmmSafStc;	//안전재고
						let backgroudColor = "";

						if (cmmInven < cmmSafStc){
							backgroudColor = "red";
						} else {
							backgroudColor = "green";
						}
						return '<span style="color:'
								+backgroudColor+'";>'+cmmSafStc+'</span>';
					}
				}
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//자재발주 Grid
		const materialOrder = new Grid({
			el: document.getElementById('materialOrder'),
			rowHeaders: ["checkbox"],
			columns: [
				/*{
					header: '발주코드',
					name: 'moCd',
					sortingType: 'asc',
					sortable: true
				},*/
				{
					header: '업체코드',
					name: 'caNo',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '업체명',
					name: 'caNm',
					editor: {
					type: 'select',
						options: {
							listItems: [
							{ text: '업체1', value: '1' },
							{ text: '업체2', value: '2' },
							{ text: '업체3', value: '3' }
							]
						}
					}
				},
				{
					header: '자재코드',
					name: 'cmmCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '자재명',
					name: 'moTitle',
				},
				{
					header: '발주신청일',
					name: 'moReoDt',
					sortingType: 'asc',
					sortable: true,
				},
				{
					header: '발주수량',
					name: 'moCnt',
					editor: 'text',
					validation: {
						dataType: 'number'
					}
				},
				{
					header: '현재재고',
					name: 'cmmInven'
				},
				{
					header: '납기요청일',
					name: 'moReqDt',
					sortingType: 'asc',
					sortable: true,
					editor: {
						type: 'datePicker',
						options: {
							format: 'yyyy-MM-dd',
							language: 'ko',
						}
					},
					formatter: function (e) {
						return dateChange(e.value);
					},
				}
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//자재발주 checkbox 클릭 후 삭제를 누르면 행 삭제
		$('#orderDelete').on('click', ()=>{
			materialOrder.removeCheckedRows();
		});

		//자재발주 List
		const materialOrderList = new Grid({
			el: document.getElementById('materialOrderList'), // Container element
			rowHeaders: ["checkbox"],
			columns: [
				{
					header: '발주코드',
					name: 'moCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '발주명',
					name: 'moTitle',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '발주신청일',
					name: 'moReoDt',
					sortingType: 'asc',
					sortable: true,
					formatter: function (e) {
						return dateChange(e.value);
					}
				},
				{
					header: '업체코드',
					name: 'caNo'
				},
				{
					header: '업체명',
					name: 'caNm'
				},
				{
					header : '진행상황',
					name : 'moStt',
					sortingType: 'asc',
					sortable: true
				}
			],
			bodyHeight: 420,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//발주삭제 버튼
		let delMocd = "";
		let delMoStt = [];
		let checkLen = 0;

		materialOrderList.on('check', (ev) => {
			checkLen = materialOrderList.getCheckedRows().length;
		});
			
		materialOrderList.on('checkAll', (ev) => {
			checkLen = materialOrderList.getCheckedRows().length;
		});
		
		$('#orderMasterDelBtn').on('click', (e) => {
			let rows = materialOrderList.getCheckedRows();
			for(let i = 0 ; i < checkLen ; i++){
				delMocd += rows[i].moCd + ',';
				delMoStt[i] = {value : rows[i].moStt};

				if(delMoStt[i].value === '진행중' || delMoStt[i].value === '입고완료'){
					setTimeout(() => {
						Swal.fire({
							icon: 'error',
							title: '경고',
							text: "해당 발주는 삭제가 불가합니다",
						});
						return;
					}, 10);
				} else {
					//체크된 행이 없다면 선택된 발주코드가 없다고 알림창을 띄운다
					if(rows.length !== 0){
						$.ajax({
							url : "delOrder",
							method :"POST",
							data : {delMocd : delMocd},
							success : function(data){
								Swal.fire({
									icon: 'success',
									title: "삭제완료"
								});
								//삭제 후 알림창을 띄운 후 그리드를 새로 그려준다
								orderListSearch();
							},
							error : function(err){
								console.log(err);
							}
						});
					} else {
						Swal.fire({
							icon: 'error',
							title: '경고',
							text: "선택된 발주코드가 없습니다",
						});
					}
				};
			};
		});
		
		//발주목록 행 더블클릭 이벤트
		materialOrderList.on('dblclick', (e)=>{
			//모달창
			document.getElementById('orderDetailModal').style.display='block';
			//Modal Grid 빠르게 띄우는 방법
			setTimeout(()=> moModal.refreshLayout() , 0);
			

			const rowDate = materialOrderList.getRow(e.rowKey);
			//Modal 안에 발주코드 readonly
			let rowDateMoCd = rowDate.moCd;		//발주코드
			let rowDateMoStt = rowDate.moStt;	//진행상황
			$("#modalMocd").val(rowDateMoCd);
			$("#modalMoStt").val(rowDateMoStt);

			// $("#orderDetailModal").css("width", "99%");
			// $("#orderDetailModal").css("width", "100%");
			$.ajax({
				url : "mtrlOrderDetailList",
				method :"POST",
				dataType : "JSON",
				data : {moCd : rowDateMoCd},
				success : function(data){
					moModal.resetData(data);
				} 
			});
		});
		
		//발주목록 행 더블클릭하면 나오는 모달창 안에 있는 발주상세 Grid
		const moModal = new Grid({
			el: document.getElementById('moModal'),
			rowHeaders: ["checkbox"],
			columns: [
				{
					header : '발주상세코드',
					name : 'modCd',
					sortingType: 'asc',
					sortable: true,
				},
				{
					header: '자재코드',
					name: 'cmmCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '자재명',
					name: 'cmmNm',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '업체코드',
					name: 'caNo',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '업체명',
					name: 'caNm',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '발주수량',
					name: 'moCnt',
					editor: 'text',
					validation: {
						dataType: 'number'
					}
				},
				{
					header: '현재재고',
					name: 'cmmInven',
				},
				{
					header: '안전재고',
					name: 'cmmSafStc'
				},
				{
					header: '예상재고량',
					name: 'cmmEstInven',
					formatter: function(rowdata) {
						let cmmEstInven = rowdata.row.cmmEstInven;
						let color = "blue";
						return '<span style="color:' + color + '";>'
						+ cmmEstInven  + '</span>';
					}
				},
				{
					header: '납기요청일',
					name: 'moReqDt',
					editor: {
						type: 'datePicker',
						options: {
							format: 'yyyy-MM-dd',
							//시작일자와 종료일자를 설정해줌
							selectableRanges : [[getStartToday, getOneMonthLater]],
							language: 'ko',
						}
					},
					formatter: function (e) {
						return dateChange(e.value);
					},
				}
			],
			bodyHeight: 420,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//엑셀버튼 클릭 이벤트
		const options = {
			includeHiddenColumns: true,
			onlySelected: true,
			fileName: 'mtrlExport',
		};
		
		//엑셀버튼을 누르면 해당되는 발주상세목록을 엑셀로 만들어준다
		$("#excelBtn").on('click', function(){
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
						icon : 'success'
					});
				}
			});
		});

		//등록버튼이벤트
		$('#dataUpdeBtn').on('click',(e)=>{
			let rowDate2 = moModal.getData(e.rowKey);

			let moCd = $('#modalMocd').val();
			let moStt = $('#modalMoStt').val();
			let moCnt = "";
			let moReqDt = "";
			let realMoReqDt = "";
			let cmmCd = "";
			
			for(let i = 0 ; i < rowDate2.length ; i++){
				moCnt = rowDate2[i].moCnt;
				moReqDt = rowDate2[i].moReqDt;
				cmmCd = rowDate2[i].cmmCd;
				realMoReqDt = dateChange(moReqDt);

				//넘어가는 데이터 확인
				//console.log(moCnt);
				/*console.log(realMoReqDt);
				console.log(cmmCd);*/

				if(moStt === '입고완료' || moStt === '진행중'){
					setTimeout(() => {
						Swal.fire({
							icon: 'error',
							title: '경고',
							text: "해당 발주는 수정이 불가합니다",
						});
					return;
					}, 10);
				};

				$.ajax({
					url : "mtrlOrderDetailUpdate",
					method : "POST",
					dataType : "JSON",
					data : { moCd : moCd, moCnt : moCnt, moReqDt : realMoReqDt, cmmCd : cmmCd },
					success : function(result){
						if(moCnt == 0){
							Swal.fire({
								icon: 'warning',
								title: '경고',
								text: "수량이 올바르게 입력되지 않았습니다",
							});
							return;
						} else {
							Swal.fire({
								icon: 'success',
								title: '수정완료',
								text: "발주코드 : " + moCd + "가 수정되었습니다",
							});
						};
					},
					error : function(reject){
						console.log(reject);
						console.log("mtrlOrderList Insert error!");
					}
				});
			};
		});

		let OrderListBeforeMoCnt = 0;

		//editingFinish --> 셀 수정이 완료되기 전
		//셀 수정이 완료되기 전의 발주수량 값을 들고온다.
		moModal.on("editingStart", (e) => {
			OrderListBeforeMoCnt = moModal.getRow(e.rowKey).moCnt;
		});

		//발주수량 값 바뀌면 예상재고량 자동계산되도록 하는 방법
		moModal.on('editingFinish', (e) => {
			
			let oneMoStt = $('#modalMoStt').val();
			if(oneMoStt === '진행중' || oneMoStt ==='입고완료'){
				setTimeout(() => {
					Swal.fire({
						icon: 'error',
						title: '경고',
						text: "해당 발주는 수정이 불가합니다",
					});
					return;
				}, 10);
			};
			//editingFinish --> 셀 수정이 완료된 후
			/*셀 수정이 완료될 때,
				변화하는 발주수량 값과 현재수량을 더해서 예상재고량 값을 변화시킨다.
				단, 변화되는 값이 문자일 경우 경고창을 띄우고 
				NaN을 띄우는 것이 아닌 셀 수정되기 전의 발주수량을 데리고 와서 셋팅해준다.
				**매우 중요**
					editingFinish evnet를 쓸 경우, sweet alert이 정상실행이 되지 않아서 setTimeout으로 감싸주었다.
				발주수량 값을 Number로 입력했을 경우, 
				현재재고와 발주수량을 더해서 예상재고량 값을 변경시킨다.
			*/
			let moModalRowDate = moModal.getRow(e.rowKey);

			let moCntDate = 0;
			let cmmEstInvencDate = 0;

			moCntDate = Number(moModalRowDate.moCnt);				//발주수량
			cmmEstInvencDate = Number(moModalRowDate.cmmInven);		//현재수량
			cmmSafStcData = Number(moModalRowDate.cmmSafStc);		//안전수량

			if(isNaN(moCntDate)){
				setTimeout(() => {
					Swal.fire({
						icon: 'error',
						title: '경고',
						text: '숫자만 입력 가능합니다',
					});
					/*이 작업을 안하면 발주수량이 NaN으로 표시된다.*/
					moModal.setValue(e.rowKey, 'moCnt', OrderListBeforeMoCnt);
					//그대로 빠꾸
					return;
				}, 10);
			} else {
				// **예상재고량** = 현재재고 + 발주수량
				cmmEstInvencDate += moCntDate;
				moModal.setValue(e.rowKey, 'cmmEstInven', cmmEstInvencDate);

				//예상재고량보다 안전수량이 많으면 경고창 띄우기
				if(cmmEstInvencDate < cmmSafStcData){
					moModal.addRowClassName(e.rowKey, 'cell-red');
					const Toast = Swal.mixin({
						toast: true,
						position: 'center-center',
						showConfirmButton: false,
						timer: 3000,
						timerProgressBar: true,
						didOpen: (toast) => {
						toast.addEventListener('mouseenter', Swal.stopTimer)
						toast.addEventListener('mouseleave', Swal.resumeTimer)
						}
					});
					Toast.fire({
						icon: 'error',
						title: '재고예상량이 안전재고보다 작습니다. <br/> 발주수량을 다시 입력해주세요.'
					})

				} else {
					moModal.removeRowClassName(e.rowKey,'cell-red');
				}
			};
		});
		
		//삭제버튼
		$('#dataDelBtn').on('click', (e)=>{
			//삭제
			let oneMoCd = $('#modalMocd').val();										//발주번호
			let oneMoStt = $('#modalMoStt').val();
			let delModCd = "";
			let rowKey = moModal.getCheckedRowKeys();								//여러개 누르면 [0, 1, 2 ...]으로 값이 들어옴
			//console.log(rowKey);																	//키 값이 배열형태로 들어온다는 의미
			let totalCnt = moModal.getRowCount();										//해당하는 Grid의 전체 행 값을 가져온다
			let checkCount = moModal.getCheckedRows().length;				//해당 Grid에서 체크된 행의 개수

			for(let i = 0 ; i < rowKey.length ; i++){
				delModCd += moModal.getRow(rowKey[i]).modCd + ",";		//삭제할 발주상세코드 -> mo001, mo002, mo003, ...
			};

			if(oneMoStt === '진행중' || oneMoStt ==='입고완료'){
				//setTimeout(() => {
					Swal.fire({
						icon: 'error',
						title: '경고',
						text: "해당 발주는 수정이 불가합니다",
					});
					return;
				//}, 10);
			} else {
				//선택된 행이 없다면 경고창 띄우기
				if(rowKey.length !== 0){
					//Grid의 모든 행을 지우면 모달창이 없어지면서 발주목록까지 초기화해주기
					if(totalCnt == checkCount){
						$.ajax({
							url : "delOrderDetail",
							method :"POST",
							data : {moCd : oneMoCd , modCd : delModCd},
							success : function(data){
								//console.log(data);
								
								Swal.fire({
									icon: 'success',
									title: "삭제완료"
								});
								//발주상세 행 지워주고
								moModal.removeCheckedRows();
								//모달창 없애고
								$("#orderDetailModal").hide();	
								//발주목록 초기화
								mtrlOrderGetData();
							},
							error : function(err){
								console.log(err);
							}
						});
					} else {
						$.ajax({
							url : "delOrderDetail",
							method :"POST",
							data : {moCd : oneMoCd , modCd : delModCd},
							success : function(data){
								//console.log(data);
								Swal.fire({
									icon: 'success',
									title: "삭제완료"
								});
								moModal.removeCheckedRows();
							},
							error : function(err){
								console.log(err);
							}
						});
					}
				} else {
					Swal.fire({
						icon: 'error',
						title: '경고',
						text: "선택된 발주코드가 없습니다",
					});
					return;
				}
			}
		});

//---------------------------------------------------------발주목록 행에 값 넣는 장소
		let moCd = null;
		let cmmCd = null;
		let myObj = null;
		let caNo = null;
		let caNm2 = null;
		let cmmInven = null;
		let fontColor = null;

		//자재목록 tr 클릭하면 자재발주목록 뜨는 dbclick event
		material.on("dblclick", (e) => {
			const rowData = material.getRow(e.rowKey);
			
			//자재목록 Grid에 행이 없으면 해당 값을 집어넣고,	
			//자재목록 Grid에 행이 하나라도 있으면 경고창을 띄운다
			if (materialOrder.getRow(e.rowKey) === null) {
				//rowData.moCd = '${getmtrlOrderCode.moCd}';	 //발주코드
				rowData.moTitle = rowData.cmmNm;				  //발주명
				rowData.moReoDt = getStartToday;			//발주신청일
				rowData.moReqDt = getStartToday;			//납기요청일
				rowData.moCnt = 0;							//발주수량
				var orderSafStc = rowData.cmmInven;			//안전재고
				materialOrder.appendRow(rowData);			//자재목록 Grid에서 해당되는 행을 더블클릭하면 자재발주 Grid에 append!
				materialOrder.sort("cmmCd", true);			//정렬 안해주면 그리드 고장남
			} else {
				Swal.fire({
					icon: 'warning',
					title: '경고',
					text: "(" + rowData.cmmCd + ")" + rowData.caNm + "은(는) 이미 있습니다.",
				});
			}
		});

		//console.log(material.getCellClassName(e.rowKey, caNm));
		


		//발주수량 0으로 발주등록할 때 예외처리하는 방법
		let beforeMoCnt = 0;
		materialOrder.on("editingStart", (e) => {
			beforeMoCnt = materialOrder.getRow(e.rowKey).moCnt;
		});

		materialOrder.on('editingFinish', (e) => {
			let modalRowDate = materialOrder.getRow(e.rowKey);
			let moCntData = Number(modalRowDate.moCnt);
			if(isNaN(moCntData)){
				setTimeout(() => {
					Swal.fire({
						icon : 'error',
						title : '경고',
						text: '숫자만 입력 가능합니다',
					});
					materialOrder.setValue(e.rowKey, 'moCnt', beforeMoCnt);
					return;
				}, 10);
			}
		});

		//발주등록버튼 클릭 이벤트
		$('#orderInsert').on('click',(ev)=>{
			const rows = materialOrder.getCheckedRows();
			
			materialOrderList .finishEditing();

			if (rows.length !== 0) {
				$.ajax({
					url : "mtrlOrder",
					method :"POST",
					data : JSON.stringify(rows),
					//dataType : "JSON",
					contentType : "application/json",
					success : function(data){
						//const rowsMoCd = rows[0].moCd; 			//발주번호 들고옴
						Swal.fire({
							icon: 'success',
							title: "발주완료",
							text:  "요청하신 발주가 정상적으로 등록되었습니다"
						});
						materialOrder.removeCheckedRows();		//자재발주 Grid 체크한 모든 행을 remove!
						//자재발주조회 그리드를 새로 그려준다
						mtrlOrderGetData();
					} 
				});
			} else {
				Swal.fire({
					icon: 'error',
					title: '경고',
					text: "선택된 자재가 없거나 데이터가 없습니다.",
				});
			};
		});

		//ESC 누르면 모달창 없어지게 하는 방법
		//keydown --> 사용자가 키를 누르거나 키를 놓을 때 발생
		$(window).on("keydown", (e) => {
			let caModal = $("#modal");
			let orderDetailModal = $("#orderDetailModal");

			//e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
			if (e.keyCode === 27 && caModal.css("display") === "block") {
				caModal.hide();
			};

			if (e.keyCode === 27 && orderDetailModal.css("display") === "block") {
				orderDetailModal.hide();
			};
		});

		//날짜변환 함수
		function dateChange(data) {
		let newData = new Date(data);
		let result = newData.getFullYear() + "-" +
					(newData.getMonth() < 10
					? "0" + (newData.getMonth() + 1)
					: newData.getMonth() + 1) +
					"-" + (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
			return result;
		};
		//발주수량 입력할 때 안전재고보다 소량으로 기재할 시 
		//안전재고 숫자가 빨간색으로 보이게 (정상작동안됨/추후에 하는걸로!!)
		/*materialOrder.on("click", (e) => {
			console.log(e)
		})*/
		/*materialOrder.on('editingFinish',(ev)=> {
			const changedRowData = materialOrder.getRow(ev.rowKey);
			const orderListSaf = changedRowData.cmmSafStc;		//안전재고
			const orderListMocnt = changedRowData.moCnt;		//발주수량

			const orderRow = materialOrder.getRow(ev.rowKey);
			if (orderListMocnt >= orderListSaf) {
				console.log("괜찮");
				fontColor = 'red';
				orderRow = '<span style="color:'+fontColor+'";>'+orderListSaf+'</span>';
			} else {
				console.log("위험");
				fontColor = 'green';
			}
		});*/
//---------------------------------------

</script>
</main>