<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	#companyName{
		cursor:pointer;
	}
	#modalMocd{
		background-color: rgb(233, 233, 233);
		border: 0 !important;
		border-radius: 15px;
		width: 200px !important;
		height: 32px;
		padding-left : 20px;
	}
	#rigth{
		float: right;
		position: relative;
		bottom: 25px;
	}
</style>

<main>
	<!-- 업체명 검색 모달 -->
	<div id="modal" class="w3-modal" style="z-index: 100;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright" onclick="document.getElementById('modal').style.display='none'">&times;</span>
				<h3>업체검색</h3>
				<div>
					<input type="text" id="modalCaNm" placeholder="업체명" style="width: 90%;">
					<br/>
					<input type="text" id="modalCaCd" placeholder="업체코드" style="width: 90%;">
					<button class="srchBtn" id="modalBtn">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				<div id="caModal"></div>
			</div>
		</div>
	</div><!-- End 업체명 검색 모달 -->

	<!-- 자재발주조회 더블클릭하면 나오는 모달 -->
	<div id="orderDetailModal" class="w3-modal" style="z-index: 101;">
		<div class="w3-modal-content">
			<div class="w3-container">
				<span class="w3-button w3-display-topright" onclick="document.getElementById('orderDetailModal').style.display='none'">&times;</span>
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
			<h1 class="page-header">자재발주조회</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재발주조회</li>
			</ol>
		</div>

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div id="inputReset">
								<label>업체명</label>
								<input type="text" id="companyName" style="width: 315px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<br/>
								<label>발주신청일</label>
								<input type="date" id="startDate"
									style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;
								<input type="date" id="endDate"
									style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<button type="button" class="cndSrchBtn" id="mtrlOrderSeachBtn" onclick="search()">검색</button>
								<button type="button" class="cndRstBtn" id="restBtn">초기화</button>
							</div>
							<div style="clear:both"></div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">자재발주조회</div>
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
		const Grid = tui.Grid;
		//리셋버튼 누르면 input value 초기화해준다.
		$('#restBtn').on('click', ()=>{
			$('#inputReset').find('input').each(function(){
				$(this).val('');
			});
		});

		//업체명 input 클릭하면 업체명 모달창 뛰우기
		$('#companyName').on('click',(e)=>{
			document.getElementById('modal').style.display='block';
			//Modal Grid 빠르게 띄우는 방법
			setTimeout(()=> caModal.refreshLayout() , 0);
		}); 
		
		//데이터가공
		const date = new Date();

		const years = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const month2 = String(date.getMonth() + 2).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		
		//당일 날짜 
		const getToday = years+ "-" + month + "-" + day;
		//당일 날짜 기준 한달 뒤 날짜
		const getOneMonthLater = years+ "-" + month2 + "-" + day;

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

//----------------------------------------Grid 부분 / 
		//업체명 modal Grid
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
				$("#companyName").val(caNm);
				$("#modal").hide();	
			}
		});

		//모달창 tr 선택하면 돌아가는 click event
		caModal.on("click", (e) => {
			let caNm = caModal.getData()[e.rowKey].caNm;
			if (e.targetType !== "columnHeader") {
				Swal.fire({
					icon: 'success',
					title: '업체명 선택완료',
					text: '업체명 : ' + caNm,
				});
				$("#companyName").val(caNm);
				$("#modal").hide();	
			}
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
				} 
			});
		};

		//modal account search Btn event
		$("#modalBtn").on('click',(e)=>{
			modalAccountSearch();
		});

		document.getElementById("modalCaNm").addEventListener("input", () => {
			modalAccountSearch();
		});
//--------------------------------------------------------------------------------Ajax----------------------
		let caNm = null;
		let start = null;
		let end = null;

		//업체명, 발주신청일 시작일자, 발주신청일 종료일자
		const mtrlOrderGetData = (caNm = undefined, start = undefined, end = undefined) => {
			$.ajax({
				url : "mtrlOrderDateSearch",
				method :"POST",
				dataType : "JSON",
				data : {caNm : caNm, start : start, end : end},
				success : function(data){
					//console.log(data);
					materialOrderList.resetData(data);
				} 
			});
		};
		mtrlOrderGetData();

		function search(){
			caNm = $("#companyName").val();
			start = $("#startDate").val();
			end = $("#endDate").val();

			$.ajax({
				url : "mtrlOrderDateSearch",
				method :"POST",
				dataType : "JSON",
				data : {caNm : caNm, start : start, end : end},
				success : function(data){
					//console.log(data);
					.resetData(data);
				} 
			});
		};

		//자재발주 List
		const materialOrderList = new Grid({
			el: document.getElementById('materialOrderList'), // Container element
			rowHeaders: ['rowNum'],
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
					sortable: true
				},
				{
					header: '발주완료일',
					name: 'moCpltDt'
				},
				{
					header: '업체코드',
					name: 'caNo'
				},
				{
					header: '업체명',
					name: 'caNm'
				}
			],
			bodyHeight: 420,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//발주목록 행 더블클릭 이벤트
		materialOrderList.on('dblclick', (e)=>{
			const rowDate = materialOrderList.getRow(e.rowKey);

			//Modal 안에 발주코드 readonly
			let rowDateMoCd = rowDate.moCd;		// 발주코드
			$("#modalMocd").val(rowDateMoCd);

			//모달창
			document.getElementById('orderDetailModal').style.display='block';
			//Modal Grid 빠르게 띄우는 방법
			setTimeout(()=> moModal.refreshLayout() , 0);

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
					editor: 'text'
				},
				{
					header: '현재재고',
					name: 'cmmInven'
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
							selectableRanges : [[getToday, getOneMonthLater]],
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

		$('#dateUpdateBtn').on('click',(e)=>{
			let rowDate2 = moModal.getData(e.rowKey);

			let moCd = $('#modalMocd').val();
			let moCnt = "";
			let moReqDt = "";
			let cmmCd = "";

			for(let i = 0 ; i < rowDate2.length ; i++){
				moCnt = rowDate2[i].moCnt;
				moReqDt = rowDate2[i].moReqDt;
				cmmCd = rowDate2[i].cmmCd;

				/*console.log(moCnt);
				console.log(moReqDt);
				console.log(cmmCd);*/

				$.ajax({
					url : "mtrlOrderDetailUpdate",
					method : "POST",
					dataType : "JSON",
					data : { moCd : moCd, moCnt : moCnt, moReqDt : moReqDt, cmmCd : cmmCd },
					success : function(result){
						console.log(result);
					}
				});
			}

		})

//---------------------------------------------------------------------------------------------------------------------
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


</script>
</main>