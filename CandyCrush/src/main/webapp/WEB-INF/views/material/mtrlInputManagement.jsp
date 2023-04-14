<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#inputGuide{
		margin-left: 10px !important;
		width:300px !important;
		margin-bottom: 30px !important;
		margin-top:10px !important;
	}
	.tui-grid-cell.cell-green {background-color: rgba(118, 228, 118, 0.575)}
</style>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">자재입고관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재입고관리</li>
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

		<!-- 입고목록 상세 모달 -->
		<div id="inputDetailModal" class="w3-modal" style="z-index: 101;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright" onclick="document.getElementById('inputDetailModal').style.display='none'">&times;</span>
				<h3>입고상세목록</h3>
				<div style="clear:both"></div>
				<div id="rigth">
					<button type="button" id="excelBtn" class="cndInsBtn">EXCEL</button>
					<button type="button" id="dateUpdateBtn" class="cndUdtBtn">수정</button>
				</div>
				<label for="modalMinCd">입고코드</label>
				<input type="text" id="modalMinCd" style="width: 300px;" readonly>
				<div id="inputModal"></div>
			</div>
		</div>
	</div><!-- End 자재발주조회 더블클릭하면 나오는 모달 -->

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div>
	
								<h5><b>▶ 검사자료 조회</b></h5>
								<div>
									<label for="caNmInput">업체명</label> 
									<input type="text" id="caNmInput" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);" readonly>&nbsp;
									<button class="srchBtn" id="companySearch"><i class="fa-solid fa-magnifying-glass"></i></button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label for="start">검사자료</label>
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
						<div style="padding-left: 5px; margin-bottom: 20px">
							<label for="inputGuide" id="inputGuide"> >> 기준 : 7일이내 기준</label>
						</div>
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

	<script>
		const Grid = tui.Grid;

		//input에 오늘날짜 부여하기
		$('#mtrlInput').val(new Date().toISOString().substring(0, 10))

		//업체명 input 클릭하면 업체명 모달창 뛰우기
		$('#companySearch').on('click',(e)=>{
			document.getElementById('modal').style.display='block';
			//Modal Grid 빠르게 띄우는 방법
			//모달 안에 있는 그리드를 한번 리프레쉬하고
			//아작스를 통해 통신을 한다음데이터를 뿌려준다?
			setTimeout(()=> caModal.refreshLayout() , 0);
		}); 

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
					//console.log(data);
					caModal.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("modalAccountSearch 통신오류");
				}
			});
		};

		//modal account search Btn event
		$("#modalBtn").on('click',(e)=>{
			modalAccountSearch();
		})

		document.getElementById("modalCaNm").addEventListener("input", () => {
			modalAccountSearch();
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

		let inpuerList7Days = [
									<c:forEach items="${inpuerList7Days}" var="inSht">
										{
											minCd : '${inSht.minCd}',
											minDt : '${inSht.minDt}',
											minCdCount : '${inSht.minCdCount}'
										},
									</c:forEach>
								];

//--------------------------------------------------------------Grud
		//업체명 검색 Grid
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
				$("#caNmInput").val(caNm);
				$("#modal").hide();	
			}
		});
		
		//가져오기 버튼 이벤트(자재입고검사 DB 자료 GET, 진행도 '완료'된 목록)
		$('#inspSearchBtn').on('click', (e)=>{
			let caNmInput = $('#caNmInput').val();
			let start = $('#start').val();
			let end = $('#end').val();
			$.ajax({
				url : "mtrlInputGetList",
				method :"POST",
				dataType : "JSON",
				data : {caNm : caNmInput, start : start, end : end},
				success : function(data){
					materialInspGetList.resetData(data);
				}
			});
		});
		
		//입고등록 Grid
		const materialInspGetList = new Grid({
			el: document.getElementById('materialLotSave'), // Container element
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '검사코드',
					name: 'miCd',
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
					header: '규격',
					name: 'cmmSpec'
				},
				{
					header: '단위',
					name: 'cmmUnit'
				},
				{
					header: '유형',
					name: 'cmmTyp'
				},
				{
					header: '발주코드',
					name: 'moCd'
				},
				{
					header: '입고가능수량',
					name: 'miPassCnt',
				},
				{
					header : '입고수량',
					name : 'minCnt',
					formatter: function(value) {
						return '<div style="font-weight : bolder;">'+value.value+'</div>';
					}
				}
			],
			bodyHeight: 520,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//입고목록상세
		const materialInspDetail = new Grid({
			el: document.getElementById('inputModal'), // Container element
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '검사코드',
					name: 'miCd',
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
					header: '규격',
					name: 'cmmSpec'
				},
				{
					header: '단위',
					name: 'cmmUnit'
				},
				{
					header: '유형',
					name: 'cmmTyp'
				},
				{
					header: '발주코드',
					name: 'moCd'
				},
				{
					header : '입고수량',
					name : 'minCnt',
					editor : 'text',
					validation: {
						dataType: 'number'
					}
				}
			],
			bodyHeight: 520,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//입고등록 Grid ajax 함수
		const mtrlInspList = (caNm = undefined, start = undefined, end = undefined) => {
			$.ajax({
				url : "mtrlInputGetList",
				method :"POST",
				dataType : "JSON",
				success : function(data){
					data.map((item) => {
						item.minCnt = item.miPassCnt
					});
					materialInspGetList.resetData(data);
					//let minCnt = row.minCnt;		//현재재고
					materialInspGetList.getData().forEach(row => {
						materialInspGetList.addCellClassName(row.rowKey, 'minCnt', 'cell-green');
					});
				}
			});
		};
		mtrlInspList();

		//입력값에 대한 예외처리 부분
		// editingStart
		let beforeMoCnt = "";
		materialInspGetList.on("dblclick", (e) => {
			// beforeMoCnt = materialInspGetList.getRow(e.rowKey).minCnt;
			if(e.columnName === "minCnt") {
				Swal.fire({
					icon: "warning",
					title: "주의",
					text: "입고수량 변경 기능은 준비중입니다."
				})
			};
			// console.log(e.rowKey);
			// materialInspGetList.focusChange = -1;
			
		});

		// materialInspGetList.on('editingFinish', (e)=>{
		// 	let rowDate = materialInspGetList.getRow(e.rowKey);
		// 	let minCntData = Number(rowDate.minCnt);					//입고수량
		// 	let miPassCntData = Number(rowDate.miPassCnt);	  //입고가능수량

		// 	//입고가능한 수량 값을 String을 입력했을 경우
		// 	if(isNaN(minCntData)){
		// 		setTimeout(() => {
		// 			Swal.fire({
		// 				icon : 'error',
		// 				title : '경고',
		// 				text: '숫자만 입력 가능합니다',
		// 			});
		// 			materialInspGetList.setValue(e.rowKey, 'minCnt', beforeMoCnt);
		// 			return;
		// 		}, 10);
		// 	}

		// 	//입고가능한 수량보다 입고할 수량이 더 많은 경우
		// 	if(minCntData > miPassCntData){
		// 		setTimeout(() => {
		// 			Swal.fire({
		// 				icon : 'error',
		// 				title : '다시 입력해주세요',
		// 				text: '입고가능한 수량보다 많습니다',
		// 			});
		// 			materialInspGetList.setValue(e.rowKey, 'minCnt', beforeMoCnt);
		// 			return;
		// 		}, 10);
		// 	};

		// 	//입고수량을 0 또는 빈값을 입력했을 경우
		// 	if(minCntData === 0 || minCntData === null){
		// 		setTimeout(() => {
		// 			Swal.fire({
		// 					icon: 'error',
		// 					title: '경고',
		// 					text: "입고수량이 기재되지 않았습니다",
		// 				});
		// 				materialInspGetList.setValue(e.rowKey, 'minCnt', beforeMoCnt);
		// 				return;
		// 		}, 10);
		// 	};
		// });

		//체크한 행만 입고코드를 입힌다
		$('#mtrlInputSaveBtn').on('click',(e)=>{
			let checkRows = materialInspGetList.getCheckedRows();
			if(checkRows.length !== 0){
				
			} else {
				Swal.fire({
					icon: 'error',
					title: '경고',
					text: "선택된 자재가 없거나 데이터가 없습니다.",
				});
			}
		})
		
		//입고목록 Grid
		const mtrlMngInputList = new Grid({
			el: document.getElementById('mtrlInputList'), // Container element
			columns: [
				{
					header: '입고코드',
					name: 'minCd',
				},
				{
					header: '입고일자',
					name: 'minDt',
					formatter: function (e) {
						let newData = new Date(e.value);
						let result = newData.getFullYear() + "-" + (newData.getMonth() < 10 ? "0" + (newData.getMonth() + 1) : newData.getMonth() + 1) + "-" + (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
							return result;
					}
				},
				{
					header: '건수',
					name: 'minCdCount'
				}
			],
			bodyHeight: 520,
		});
		mtrlMngInputList.resetData(inpuerList7Days);

		//입고목록 Grid 행을 클릭하면 상세 모달이 뜬다
		mtrlMngInputList.on('dblclick', (e)=>{
			let getRowData = mtrlMngInputList.getRow(e.rowKey);
			let rowDataMinCd = getRowData.minCd;
			$('#modalMinCd').val(rowDataMinCd);
			console.log(rowDataMinCd);
			document.getElementById('inputDetailModal').style.display='block';

			setTimeout(()=> materialInspDetail.refreshLayout() , 0);

			
			//입고 상세 목록 ajax
			$.ajax({
				url : "mtrlInputDeateilList",
				method : "POST",
				dataType : "JSON",
				data : {minCd : rowDataMinCd},
				success : function(data){
					materialInspDetail.resetData(data);
				}
			})
		});

		//Modal을 Esc 누르면 없어지게 만드는 곳
		$(window).on("keydown", (e) => {
			let caModal = $("#modal");
			let inputDetailModal = $('#inputDetailModal');

			//e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
			if (e.keyCode === 27 && caModal.css("display") === "block") {
				caModal.hide();
			};

			//inputDetailModal
			if (e.keyCode === 27 && inputDetailModal.css("display") === "block") {
				inputDetailModal.hide();
			};
		});
//------------------------------------------------------------------------------------
		//input Date 당일날짜 이후 날짜 선택하지 못하도록 설정해준다
		var now_utc = Date.now();
		var timeOff = new Date().getTimezoneOffset() * 60000;
		var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
		//document.getElementById("mtrlInput").setAttribute("min", today);
		$('#mtrlInput').attr("min", today);


</script>
</main>