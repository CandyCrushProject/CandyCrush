<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
	label{
		width: 70px;
		margin-left: 10px;
		color : black;
		background-color: ;
	}
	#eunae{
		margin-left: 10px;
	}
	#eunae2{
		float: right;
		margin-bottom: 20px;
	}
	#companyName{
		cursor:pointer;
	}
	.srchBtn{
		float: right;
		height: 100px;
		position: relative;
		bottom: 40px;
	}
	input[type="text"]{
		width: 90%;
	}
</style>
<main>
	<!-- The Modal -->
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
	</div><!-- End Modal -->

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
							<div id="eunae">
							<label for="mtrlName">원자재명</label>
							<input type="text" id="mtrlName" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							<label for="companyName">업체명</label>
							<input type="text" id="companyName"
										style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							<button id="search" class="cndSrchBtn" onclick="search()">검색</button>
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
						<div class="card-action">자재발주</div>
						<div class="card-content">
							<div id="eunae2">
								<button id="orderDelete" class="cndDelBtn">삭제</button>
								<button id="drderInsert" class="cndInsBtn">등록</button>
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

	<script>
		//Tost Ui Grid 선언
		const Grid = tui.Grid;
		//Toast Ui Grid theme
		Grid.applyTheme('clean');

		//Modal Grid 빠르게 띄우는 방법
		$('#companyName').click(function(){
				document.getElementById('modal').style.display='block';
				setTimeout(()=> caModal.refreshLayout() , 0);
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

		let getMtrlOrder
//-----------------------------------Ajax
		let cmmNm = null;
		let caNm = null;

		let modalCaNm = null;
		let modalCaCd = null;
		
		const metarialGetData = (cmmNm = undefined, caNm = undefined) => {
			$.ajax({
				url : "mtrlSearch",
				method :"POST",
				dataType : "JSON",
				data : {cmmNm : cmmNm, caNm : caNm},
				success : function(data){
					material.resetData(data);
				} 
			});
		}
		metarialGetData();

		document.getElementById("mtrlName").addEventListener("input", () => {
			search();
		});
		
		//자재검색
		function search(){
			cmmNm = document.getElementById('mtrlName').value; //원자재명
			caNm = document.getElementById('companyName').value //업체명
			
			$.ajax({
				url : "mtrlSearch",
				method :"POST",
				dataType : "JSON",
				data : {cmmNm : cmmNm, caNm : caNm},
				success : function(data){
					material.resetData(data);
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
					//console.log(data);
					caModal.resetData(data);
				} 
			});
		}

		//modal account search Btn event
		$("#modalBtn").on('click',(e)=>{
			modalAccountSearch();
		})

		document.getElementById("modalCaNm").addEventListener("input", () => {
			modalAccountSearch();
		});
		//발주
		
//---------------------------------------
		//업체명 input onclick event modal
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

		//자재목록
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
					name: 'minCnt'
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
						let cmmInven = rowdata.row.cmmInven;		//현재재고
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

		//자재발주
		const materialOrder = new Grid({
			el: document.getElementById('materialOrder'),
			rowHeaders: ["checkbox"],
			columns: [
				{
					header: '발주코드',
					name: 'moCd',
					sortingType: 'asc',
					sortable: true,
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
					header: '자재코드',
					name: 'cmmCd',
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
					header: '납기일',
					name: 'moDlvDt',
					sortingType: 'asc',
					sortable: true,
					editor: {
						type: 'datePicker',
						options: {
							format: 'yyyy-MM-dd',
							language: 'ko'
						}
					},
					formatter: function (e) {
						return dateChange(e.value);
					},
				}
			],
			bodyHeight: 400,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//날짜변환 함수
		function dateChange(data) {
      let newData = new Date(data);
      let result =
				newData.getFullYear() +
        "-" +
        (newData.getMonth() < 10
          ? "0" + (newData.getMonth() + 1)
          : newData.getMonth() + 1) +
        "-" +
        (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
      return result;
    }

//-----------------------------------Ajax
		let cmmCd = null;
		let myObj = null;

		//자재목록 tr 클릭하면 자재발주목록 뜨는 dbclick event
		material.on("dblclick", (e) => {
			cmmCd = material.getData()[e.rowKey].cmmCd;
			$.ajax({
				url : "mtrlOrderOneCheck",
				method :"POST",
				dataType : "JSON",
				data : {cmmCd : cmmCd},
				success : function(data){
					materialOrder.resetData(Object(data));
				},
				error : function(reject){
					console.log(reject);
				}
			});
		});
//---------------------------------------

</script>
</main>