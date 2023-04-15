<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    label{
		width: 100px;
    }
    #floatBtn{
		float: right;
		margin-bottom: 5px;
	}
	.tui-grid-cell.cell-red {background-color: rgba(255, 121, 121, 0.432)}
	.tui-grid-cell.cell-green {background-color: rgba(255, 255, 255, 0.877)}
</style>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">자재재고조회</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재재고조회</li>
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
					<div class="card">
						<div class="card-action">자재재고조회</div>
						<div class="card-content">
							<div>
								<div id="floatBtn">
									<button type="button" class="cndSelBtn" onclick="search()">조회</button>
									<button type="button" id="excelBtn" class="cndInsBtn">EXCEL</button>
								</div>
								<label>업체명</label> 
								<input type="text" id="mtrlcaNm" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<button class="srchBtn" id="companySearch">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
								<br/>
								<label>자재명</label>
								<input type="text" id="mtrlName" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
							</div>
							<div style="clear:both"></div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">자재입고검사조회</div>
							<div class="card-content">
							<div>
								<div class="table-responsive">
									<div id="mtrlCheck"></div>
								</div>
							</div>
						</div>
					</div>
				</div> <!--END row-->
			</div>
		<!-- /. PAGE INNER  -->
		</div>
	</div>

	<script>
		const Grid = tui.Grid;

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


		$('#companySearch').on('click',(e)=>{
			document.getElementById('modal').style.display='block';
			//Modal Grid 빠르게 띄우는 방법
			//모달 안에 있는 그리드를 한번 리프레쉬하고
			//아작스를 통해 통신을 한다음데이터를 뿌려준다?
			setTimeout(()=> caModal.refreshLayout() , 0);
		}); 

		//자재목록
		const mtrlCheck = new Grid({
			el: document.getElementById('mtrlCheck'), // Container element
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
					header: '업체코드',
					name: 'caNo'
				},
				{
					header: '업체명',
					name: 'caNm'
				},
				{
					header: '입고수량',
					name: 'cmlInCnt'
				},
				{
					header: '출고수량',
					name: 'motCnt'
				},
				{
					header: '현재재고',
					name: 'cmmInven'
				},
				{
					header: '안전재고',
					name: 'cmmSafStc'
				},
        
			],
			//data,
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
					mtrlCheck.export('xlsx', options);
				} else {
					Swal.fire({
						title: '취소되었습니다',
						icon : 'success'
					});
				}
			});
		});

		const mtrlCntChk = (cmmNm = undefined, caNm = undefined) => {
			$.ajax({
				url : "mtrlSearch",
				method :"POST",
				dataType : "JSON",
				data : {cmmNm : cmmNm, caNm : caNm},
				success : function(data){
					mtrlCheck.resetData(data);
					mtrlCheck.getData().forEach(row => {
						// console.log(row.cmmInven);
						// console.log(row.cmmSafStc);

						let cmmInven = row.cmmInven;		//현재재고
						let cmmSafStc = row.cmmSafStc; 	//안전재고
						if(cmmInven < cmmSafStc){
							mtrlCheck.addRowClassName(row.rowKey, 'cell-red');
						} else {
							mtrlCheck.addRowClassName(row.rowKey, 'cell-green');
						}
					});
				} 
			});
		}
		mtrlCntChk();

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

		document.getElementById("modalCaNm").addEventListener("input", () => {
			modalAccountSearch();
		});

		document.getElementById("modalCaCd").addEventListener("input", () => {
			modalAccountSearch();
		});

		function search(){
			cmmNm = $('#mtrlName').val(); //원자재명
			caNm = $('#mtrlcaNm').val();//document.getElementById('companyName').value //업체명
			
			$.ajax({
				url : "mtrlSearch",
				method :"POST",
				dataType : "JSON",
				data : {cmmNm : cmmNm, caNm : caNm},
				success : function(data){
					mtrlCheck.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("search 통신오류");
				}
			});
		};

		document.getElementById("mtrlName").addEventListener("input", () => {
			search();
		});

		document.getElementById("mtrlcaNm").addEventListener("input", () => {
			search();
		});

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
				$("#mtrlcaNm").val(caNm);
				$("#modal").hide();	
			}
		});

		$(window).on("keydown", (e) => {
			let caModal = $("#modal");

			//e.keyCode === 27 : <ESC Key Code> , 해당 키코드의 키 값을 확인
			if (e.keyCode === 27 && caModal.css("display") === "block") {
				caModal.hide();
			};
		});


</script>
</main>