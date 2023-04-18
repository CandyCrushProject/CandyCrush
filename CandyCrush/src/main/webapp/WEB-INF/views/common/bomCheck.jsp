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
	.tui-grid-cell.cell-green {background-color: rgba(118, 228, 118, 0.575)}
	#prodExcelBtn, #procDetailExcelBtn{
        margin-left: 15px;
    }
	#prodCprNm{
		cursor:pointer;
	}
</style>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">BOM관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">공통관리</a></li>
				<li class="active">BOM관리</li>
			</ol>
		</div>

		<!-- 제품명 검색 모달 -->
		<div id="modal" class="w3-modal" style="z-index: 100;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('modal').style.display='none'">&times;</span>
					<h3>제품검색</h3>
					<div>
						<input type="text" id="modalprodCd" placeholder="제품코드" style="width: 100%;" autocomplete="off">
						<br/>
						<input type="text" id="modalprodNm" placeholder="제품명" style="width: 100%;" autocomplete="off">
					</div>
					<div id="prodModal"></div>
				</div>
			</div>
		</div><!-- End 업체명 검색 모달 -->

		<!-- 공정코드 검색 모달 -->
		<div id="cmModal" class="w3-modal" style="z-index: 100;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('cmModal').style.display='none'">&times;</span>
					<h3>공정코드 검색</h3>
					<!-- <div>
						<input type="text" id="modalprodCd" placeholder="제품코드" style="width: 100%;" autocomplete="off">
						<br/>
						<input type="text" id="modalprodNm" placeholder="제품명" style="width: 100%;" autocomplete="off">
					</div> -->
					<div id="cmModalGrid"></div>
				</div>
			</div>
		</div><!-- End 공정코드 검색 모달 -->

		<!-- 공정코드 검색 모달 -->
		<div id="cmmModal" class="w3-modal" style="z-index: 100;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('cmmModal').style.display='none'">&times;</span>
					<h3>자재코드 검색</h3>
					<!-- <div>
						<input type="text" id="modalprodCd" placeholder="제품코드" style="width: 100%;" autocomplete="off">
						<br/>
						<input type="text" id="modalprodNm" placeholder="제품명" style="width: 100%;" autocomplete="off">
					</div> -->
					<div id="cmmModalGrid"></div>
				</div>
			</div>
		</div><!-- End 공정코드 검색 모달 -->

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-content">
							<div>
								<label>제품명</label> 
								<input type="text" id="prodCprNm" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<!--<button class="srchBtn" id="companySearch">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>-->
								<div id="floatBtn" style="bottom: 20px; position: relative;"> 
									<button type="button" class="cndSelBtn" id="prodSearch">조회</button>
									<button type="button" id="resetBtn" class="cndRstBtn">초기화</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-5">
					<div class="card">
						<div class="card-action">제품리스트</div>
					<button type="button" id="prodExcelBtn" class="cndInsBtn">EXCEL</button>
					<div class="mtrlOrderRightBtn">
							<button id="bomInAndUp" class="cndInsBtn">저장</button>
							<button id="bomInsert" class="cndUdtBtn">추가</button>
							<button id="bomDelete" class="cndDelBtn">삭제</button>
					</div>
							<div class="card-content">
							<div style="clear:both"></div>
							<div class="table-responsive">
									<!-- 제품리스트 -->
									<div id="prodList"></div>
							</div>
						</div>
					</div>
				</div> <!--END row-->
				<div class="col-md-7">
					<div class="card">
						<div class="card-action">공정리스트</div>
							<button type="button" id="procDetailExcelBtn" class="cndInsBtn">EXCEL</button>
						<div class="mtrlOrderRightBtn">
								<button id="bomDetailInAndUp" class="cndInsBtn">저장</button>
								<button id="bomDetailInsert" class="cndUdtBtn">추가</button>
								<button id="bomDetailDelete" class="cndDelBtn">삭제</button>
						</div>
						<div class="card-content">
								<div style="clear:both"></div>
								<div class="table-responsive">
									<div id="procList"></div>
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
		let cprNm = "";
		let cprCd = "";
		let changecprNm = "";

		let cmModalList = [
												<c:forEach items="${cmModalList}" var="sheet">
												{
													cmCd : '${sheet.cmCd}',
													cmNm : '${sheet.cmNm}',
													cmContent : '${sheet.cmContent}'
												},
												</c:forEach>
											];
		let cmmModalList = [
												<c:forEach items="${cmmModalList}" var="item">
												{
													cmmCd : '${item.cmmCd}',
													cmmNm : '${item.cmmNm}',
													cmmTyp : '${item.cmmTyp}',
													cmmUnit : '${item.cmmUnit}'
												},
												</c:forEach>
											];

		//날짜 가공
		const date = new Date();
		const years = date.getFullYear();
		const month = String(date.getMonth() + 1).padStart(2, "0");
		const month2 = String(date.getMonth() + 2).padStart(2, "0");
		const day = String(date.getDate()).padStart(2, "0");
		const getStartToday = years+ "-" + month + "-" + day;

		//제품 검색 모달
		const prodGetData = (cprNm = undefined, cprCd = undefined) => {
			$.ajax({
				url : "bomProdSearch",
				method :"POST",
				dataType : "JSON",
				data : {cprNm : cprNm, cprCd : cprCd},
				success : function(data){
					prodModal.resetData(data);
				} 
			});
		};
		prodGetData();
		
		//input event(제품검색 모달)
		document.getElementById("modalprodNm").addEventListener("input", () => {
			search();
		});

		document.getElementById("modalprodCd").addEventListener("input", () => {
			search();
		});

		//JSON.stringify()
		function search(){
			let cprCd2 = document.getElementById('modalprodCd').value; 	//제품코드
			let cprNm2 = document.getElementById('modalprodNm').value;	//제품명
			
			const requestData = {
				cprCd: cprCd2,
				cprNm: cprNm2
			}
			$.ajax({
				url : "bomProdSearch",
				method :"POST",
				dataType : "JSON",
				data : {cprCd : cprCd2, cprNm : cprNm2},
				success : function(data){
					//console.log(data);
					prodModal.resetData(data);
				},
				error : function(reject){
					console.log(reject);
					console.log("search 통신오류");
				}
			});
		};

		//공정 모달
		const cmmModalGrid = new Grid({
			el: document.getElementById('cmmModalGrid'),
            rowHeaders: ['rowNum', 'checkbox'],
            scrollX: false,
			columns: [
				{
					header: '제품코드',
					name: 'cmmCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품명',
					name: 'cmmNm'
				},
				{
					header: '제품유형',
					name: 'cmmTyp',
				},
				{
					header: '제품단위',
					name: 'cmmUnit',
				}
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 15
			}
		});

		cmmModalGrid.resetData(cmmModalList);

		//공정 모달
		const cmModalGrid = new Grid({
			el: document.getElementById('cmModalGrid'),
            rowHeaders: ['rowNum', 'checkbox'],
            scrollX: false,
			columns: [
				{
					header: '공정코드',
					name: 'cmCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '공정명',
					name: 'cmNm'
				},
				{
					header: '공정상세',
					name: 'cmContent',
				}
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 15
			}
		});

		cmModalGrid.resetData(cmModalList);

		//제품리스트
		const prodList = new Grid({
			el: document.getElementById('prodList'),
            rowHeaders: ['rowNum', 'checkbox'],
            scrollX: false,
			columns: [
				/*{
					header: 'BOM코드',
					name: 'bomCd',
					sortingType: 'asc',
					sortable: true
				},*/
				{
					header: '제품코드',
					name: 'cprCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품명',
					name: 'cprNm'
				},
				{
					header: 'BOM등록일',
					name: 'bomStartDt',
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

		//공정리스트
		const procList = new Grid({
			el: document.getElementById('procList'),
            rowHeaders: ['rowNum', 'checkbox'],
            scrollX: false,
			columns: [
				{
					header: '공정코드',
					name: 'cmCd',				//공통/공정코드
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '공정명',
					name: 'cmNm'				//공통/공정코드
				},
				{
					header: '공정순번',
					name: 'cmSq',				//BOM공정
					editor: 'text',
					validation: {
						dataType: 'number'
					}
				},
				{
					header: '자재명',
					name: 'cmmNm',				//자재관리
					
				},
				{
					header: '자재소요량',
					name: 'cbmtCnsm',			//BOM자재
					editor: 'text',
					validation: {
						dataType: 'number'
					}
				},
				{
					header: '자재단위',
					name: 'cbmtMs'				//BOM자재
				}
			],
			bodyHeight: 400,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		
		$('#bomInsert').on('click',()=>{
			document.getElementById('modal').style.display='block';
			changecprNm = "bomInsert";
			setTimeout(()=> prodModal.refreshLayout() , 0);
			prodList.sort("cprCd", true);			//정렬 안해주면 그리드 고장남
		});

		procList.on('dblclick',(e)=>{
			//공정코드 검색 모달
			if(e.columnName === "cmCd"){
				document.getElementById('cmModal').style.display='block';
				setTimeout(()=> cmModalGrid.refreshLayout(), 0);
			};

			if(e.columnName === "cmmNm"){
				document.getElementById('cmmModal').style.display='block';
				setTimeout(()=> cmmModalGrid.refreshLayout(), 0);
			};

		});

		$('#bomDetailInsert').on('click',(e)=>{
			procList.appendRow();
			
			procList.getData().forEach(row => {
				procList.addCellClassName(row.rowKey, 'cmCd', 'cell-green');
				procList.addCellClassName(row.rowKey, 'cmmNm', 'cell-green');
			});

		});

        //초기화버튼
		$('#resetBtn').on('click', () => {
			//prodList.clear();		//제품리스트 Grid 초기화
			//procList.clear();		//공정리스트 Grid 초기화
			$('#prodCprNm').val("");
		});

		//제품명 input click
		$('#prodCprNm').on('click',()=>{
			document.getElementById('modal').style.display='block';
			changecprNm = "prodCprNm";
			setTimeout(()=> prodModal.refreshLayout() , 0);
		});

		//제품명 input onclick event modal Grid
		const prodModal = new Grid({
			el: document.getElementById('prodModal'),
			columns: [
				{
					header: '제품코드',
					name: 'cprCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품명',
					name: 'cprNm'
				},
				{
					header: '단위',
					name: 'cprUnit'
				},
				{
					header: '규격',
					name: 'cprSpec'
				},
				{
					header: '유형',
					name: 'cprTyp'
				}
			],
			bodyHeight: 200,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//모달창에서 tr 선택하면 input으로 값 들어가는 부분
		prodModal.on('click', (e)=>{
			let rowData = prodModal.getRow(e.rowKey);

			let prodSelect = prodModal.getData()[e.rowKey].cprNm;
			
			if(e.targetType !== "columnHeader"){
				Swal.fire({
					icon: 'success',
					title: '제품명 선택완료',
					text: '제품명 : ' + prodSelect,
				});

				if(changecprNm === "prodCprNm"){
					$("#prodCprNm").val(prodSelect);
				} else{
					if (prodList.getRow(e.rowKey) === null) {
						rowData.cprNm = rowData.cprNm;
						rowData.cprCd = rowData.cprCd;
						rowData.bomStartDt = getStartToday;
						prodList.appendRow(rowData);
					} else {
						Swal.fire({
							icon: 'warning',
							title: '경고',
							text: "(" + rowData.cprCd + ")" + rowData.cprNm + "은(는) 이미 있습니다.",
						});
						return;
					};
				};
				
			};
			$("#modal").hide();
		});

		//제품 검색 모달
		const bomGetList = (cprNm = undefined) => {
			$.ajax({
				url : "bomListSearch",
				method :"POST",
				dataType : "JSON",
				success : function(data){
					prodList.resetData(data);
					
				} 
			});
		};
		bomGetList();

		//제품 검색 모달
		/*const bomDetailGetList = (cprNm = undefined) => {
			$.ajax({
				url : "bomDetailList",
				method :"POST",
				dataType : "JSON",
				success : function(data){
					procList.resetData(data);
				} 
			});
		};
		bomDetailGetList();*/

		function bomSearch(){
			let cprNm2 = document.getElementById('prodCprNm').value;	//제품명
			
			$.ajax({
				url : "bomListSearch",
				method :"POST",
				dataType : "JSON",
				data : {cprNm : cprNm2},
				success : function(data){
					prodList.resetData(data);
					let getRowData = prodList.getData(data.rowKey);

					$.ajax({
						url : "bomDetailList",
						method :"POST",
						dataType : "JSON",
						data : {cprNm : cprNm2},
						success : function(data){
							procList.resetData(data);
							procList.getData().forEach(row => {
								procList.addCellClassName(row.rowKey, 'cmCd', 'cell-green');
								procList.addCellClassName(row.rowKey, 'cmmNm', 'cell-green');
							})
						} 
					});
				},
				error : function(reject){	
					console.log(reject);
					console.log("bomSearch 통신오류");
				}
			});
		};

		$('#prodSearch').on('click',(e)=>{
			bomSearch();
		});

		prodList.on('dblclick',(e)=>{
			const rowData = prodList.getRow(e.rowKey);
			let getCprNm = rowData.cprNm;

			$.ajax({
				url : "bomDetailList",
				method :"POST",
				data : {cprNm : getCprNm},
				success : function(data){
					procList.resetData(data);
					procList.getData().forEach(row => {
						procList.addCellClassName(row.rowKey, 'cmCd', 'cell-green');
						procList.addCellClassName(row.rowKey, 'cmmNm', 'cell-green');
					});
					
					if(data.length === 0){
						console.log(prodList.getData());
					}
				} 
			});
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

		//엑셀버튼 클릭 이벤트
		const options = {
			includeHiddenColumns: true,
			onlySelected: true,
			fileName: 'mtrlExport',
		};

		//엑셀버튼을 누르면 해당되는 발주상세목록을 엑셀로 만들어준다
		$("#prodExcelBtn").on('click', function(){
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
					prodList.export('xlsx', options);		//제품리스트\
				} else {
					Swal.fire({
						title: '취소되었습니다',
						icon : 'success'
					});
				}
			});
		});

		//엑셀버튼을 누르면 해당되는 발주상세목록을 엑셀로 만들어준다
		$("#procDetailExcelBtn").on('click', function(){
			if(procList.getData().length === 0){
				Swal.fire({
						title: '다운로드 받을 자료가 없습니다',
						icon : 'error'
					});
					return;
			} else {
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
						procList.export('xlsx', options);		//공정리스트
					} else {
						Swal.fire({
							title: '취소되었습니다',
							icon : 'success'
						});
					}
				});
			};
		});

		cmModalGrid.on('click',(e)=>{
			let cmCd = cmModalGrid.getData()[e.rowKey].cmCd;
			let cmNm = cmModalGrid.getData()[e.rowKey].cmNm;
			console.log(e);
			if(e.targetType !== "columnHeader") {
				Swal.fire({
					icon: 'success',
					title: '코드 선택완료',
					text: '공정코드 : ' + cmCd,
				});
			};

			$("#cmModal").hide();
			procList.setValue(e.rowKey, 'cmCd', cmCd);
			procList.setValue(e.rowKey, 'cmNm', cmNm);
		});		
	
		cmmModalGrid.on('click',(e)=>{
			let cmmNm = cmmModalGrid.getData()[e.rowKey].cmmNm;
			let cmmUnit = cmmModalGrid.getData()[e.rowKey].cmmUnit;

			if(e.targetType !== "columnHeader") {
				Swal.fire({
					icon: 'success',
					title: '자재명 선택완료',
					text: '자재명 : ' + cmmNm,
				});
			};

			$("#cmmModal").hide();

			procList.setValue(e.rowKey, 'cmmNm', cmmNm);
			procList.setValue(e.rowKey, 'cbmtMs', cmmUnit);
		});

    </script>
</main>