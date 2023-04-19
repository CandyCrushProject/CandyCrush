<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style>
	label{
		width: 100px;
	}
	#floatBtn{
		float: right;
		position: relative;
		bottom: 25px;
	}
	#inputGuide{
		margin-left: 10px !important;
		width:300px !important;
		margin-bottom: 30px !important;
		margin-top:10px !important;
	}
	.tui-grid-cell.cell-green {background-color: rgba(146, 238, 146, 0.575)}
</style>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">

		<div class="header">
			<h1 class="page-header">자재출고관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재출고관리</li>
			</ol>
		</div>

		<!-- 출고목록 상세 모달 -->
		<div id="outDetailModal" class="w3-modal" style="z-index: 101;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('outDetailModal').style.display='none'">&times;</span>
					<h3>출고상세목록</h3>
					<div style="clear:both"></div>
					<div id="rigth">
						<button type="button" id="excelBtn" class="cndInsBtn">EXCEL</button>
						<!--<button type="button" id="dateUpdateBtn" class="cndUdtBtn">수정</button>-->
					</div>
					<label for="modalMotCd">출고코드</label>
					<input type="text" id="modalMotCd" style="width: 300px;" readonly>
					<div id="outModal"></div>
				</div>
			</div>
		</div><!-- End 출고목록 상세 모달 -->

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div>
								<h5><b>출고등록</b></h5>
								<div id="floatBtn">
									<button type="button" class="cndInsBtn">저장</button>
									<button type="button" class="cndRstBtn">초기화</button>
								</div>
								<div>
									<label for="outDt">출고일자</label>
									<input type="date" id="outDt"
											style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<!--<input type="text" id="outNote" style="width: 150px; border: 1px solid rgba(128, 128, 128, 0.61);">-->
									<label for="outType">&nbsp;&nbsp;&nbsp;출고유형</label>
									<select id="motTyp" style="display: inline; width: 100px; border: 1px solid rgba(128, 128, 128, 0.61);">
										<option value="부서">부서</option>
										<option value="협력업체">협력업체</option>
									</select>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label for="outNote">&nbsp;&nbsp;&nbsp;상세정보</label>
									<select id="motTyp" style="display: inline; width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
										<option value="0">---선택하세요---</option>
										<option value="생산팀으로 출고">생산팀으로 출고</option>
										<option value="협력업체로 출고">협력업체로 출고</option>
									</select>
									
								</div>
							</div>
							<div style="clear:both"></div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-8">
					<!-- 출고DB Table 등록 테이블 -->
					<div class="card">
						<div>
							<div class="card-action">▶출고등록</div>
							<div style="clear:both"></div>
							<!--<button type="button" class="cndInsBtn mtrlInputMngFloatBtn" id="mtrlInputSaveBtn">저장</button>
							<button type="button" class="cndDelBtn mtrlInputMngFloatBtn">삭제</button>-->
							<!--<div id="inputReset" style="padding-left: 5px;">
								<label for="mtrlInput" style="margin-left: 10px; width: 80px;">출고일자</label>
								<input type="date" id="mtrlInput" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							</div>-->
						</div>
						<div style="clear:both"></div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="materialOutAdd"></div>
							</div>
						</div>
					</div>
				</div><!-- End 출고DB Table 등록 테이블 -->
				<!-- 출고목록 테이블 -->
				<div class="col-md-4">
					<div class="card">
						<div class="card-action">▶출고목록</div>
						<!--<div style="padding-left: 5px; margin-bottom: 20px">
							<label for="inputGuide" id="inputGuide"> >> 기준 : 7일이내 기준</label>
						</div>-->
						<div class="card-content">
							<div class="table-responsive">
								<div id="materialOutCheck"></div>
							</div>
						</div>
					</div> 
				</div><!-- End 출고목록 테이블 -->
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
	</div>

	<script>
		const Grid = tui.Grid;

		Grid.applyTheme('default', {
			cell: {
				normal: {
					background: '#fff',
					border: '#e0e0e0',
					showVerticalBorder: true,
					showHorizontalBorder: true
				},
				header: {
					background: '#dcdcdc',
					border: '#e0e0e0'
				},
				selectedHeader: {
					background: '#e0e0e0'
				}
			}
		});

		//input에 오늘날짜 부여하기
		$('#outDt').val(new Date().toISOString().substring(0, 10));

		//출고등록 DATA
		const mtrlOutList = () => {
			$.ajax({
				url : "mtrlOutList",
				method :"POST",
				dataType : "JSON",
				success : function(data){					
					materialOutAdd.resetData(data);
					materialOutAdd.getData().forEach(row=>{
						materialOutAdd.addCellClassName(row.rowKey, 'motCntCheck', 'cell-green')
					});
					
				}
			});
		};
		
		//출고목록 DATA
		const mtrlOut7DayList = () => {
			$.ajax({
				url: "mtrlOut7DayList",
				method: "POST",
				dataType: "JSON",
				contentType: "application/json",
				success: (data) => {
					materialOutCheck.resetData(data);
				}
			});
		};

		//ajax호출
		mtrlOutList();
		mtrlOut7DayList();

		//출고등록
		const materialOutAdd = new Grid({
			el: document.getElementById('materialOutAdd'), // Container element
			rowHeaders: ['checkbox'],
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
				/*{
					header: '유형',
					name: 'cmmTyp'
				},*/
				{
					header: 'LOT번호',
					name: 'cmlNm',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: 'LOT재고',
					name: 'cmlInCnt'
				},
				{
					header: '현재출고수량',
					name: 'motCnt',
					/*editor: 'text',
					validation: {
						dataType: 'number'
					}*/
				},
				{
					header: '출고가능수량',
					name: 'motCntCheck',
					/*editor: 'text',
					validation: {
						dataType: 'number'
					}*/
					formatter: function(value) {
						let cmlInCnt = value.row.cmlInCnt;
						let motCnt = value.row.motCnt;
						return cmlInCnt - motCnt;
					}
				},
				{
					header: '추가출고수량',
					name: 'motCntPlus',
					editor: 'text',
					validation: {
						dataType: 'number'
					}
				}
			],
			bodyHeight: 420,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		let outCmlInCnt = 0;
		let outMotCnt = 0;
		let outMotCntCheck = 0;
		let outMotCntPlus = 0;

		materialOutAdd.on('editingStart',(e)=>{
			let outCmlInCnt = materialOutAdd.getRow(e.rowKey).cmlInCnt;		//LOT수량
			let outMotCnt = materialOutAdd.getRow(e.rowKey).motCnt;				//현재출고수량
			let outMotCntCheck = materialOutAdd.getRow(e.rowKey).motCntCheck;//출고가능수량
			let outMotCntPlus = materialOutAdd.getRow(e.rowKey).motCntPlus;//출고추가수량
		});

		materialOutAdd.on('editingFinish',(e)=>{
			let rowData = materialOutAdd.getRow(e.rowKey);
			let plus = Number(rowData.motCntPlus);
			if(isNaN(plus)){
				setTimeout(() => {
					Swal.fire({
						icon : 'error',
						title : '경고',
						text: '숫자만 입력 가능합니다',
					});
					materialOutAdd.setValue(e.rowKey, 'motCntPlus', outMotCntPlus);
					return;
				}, 10);
			} else {
				let rowDatas = materialOutAdd.getRow(e.rowKey);

				let testCmlInCnt = Number(rowDatas.cmlInCnt);	//LOT수량
				let testMotCnt = Number(rowDatas.motCnt);	//현재출고수량
				let testMotCntCheck = Number(rowDatas.motCntCheck);	//출고가능수량
				let testMotCntPlus = Number(rowDatas.motCntPlus);	//출고추가수량

				console.log("LOT수량 : " ,testCmlInCnt);
				console.log("현재출고수량 : ", testMotCnt);
				console.log("출고가능수량 : ", testMotCntCheck);
				console.log("입력값 : " , testMotCntPlus);
			};

		})

		//출고목록
		const materialOutCheck = new Grid({
			el: document.getElementById('materialOutCheck'), // Container element
			columns: [
				{
					header: '출고번호',
					name: 'motCd',
				},
				{
					header: '출고일자',
					name: 'motDt',
					formatter: function (e) {
						let newData = new Date(e.value);
						let result = newData.getFullYear() + "-" +
									(newData.getMonth() < 10 ? "0" + (newData.getMonth() + 1) : newData.getMonth() + 1)
									+ "-" + (newData.getDate() < 10 ? "0" + newData.getDate() : newData.getDate());
							return result;
					}
				},
				{
					header: '건수',
					name: 'motCdCnt'
				}
				
			],
			bodyHeight: 420,
		});

		const outModal = new Grid({
			el: document.getElementById('outModal'), // Container element
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '출고일자',
					name: 'motDt',
					sortingType: 'asc',
					sortable: true,
				},
				{
					header: '출고유형',
					name: 'motTyp'
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
					header : '출고수량',
					name : 'motCnt',
					validation: {
						dataType: 'number'
					}
				},
				{
					header : '상세정보',
					name : 'motNote'
				}
			],
			bodyHeight: 520,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//상세모달
		materialOutCheck.on('dblclick',(e)=>{
			let motCdData = materialOutCheck.getRow(e.rowKey).motCd;
			$('#modalMotCd').val(motCdData);

			document.getElementById('outDetailModal').style.display='block';
			setTimeout(()=> outModal.refreshLayout() , 0);

			$.ajax({
				url : "mtrlOutDetail",
				method : "POST",
				dataType : "JSON",
				data : {motCd : motCdData},
				success : function(data){
					outModal.resetData(data);
				}
			});
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
					outModal.export('xlsx', options);
				} else {
					Swal.fire({
						title: '취소되었습니다'
					});
				}
			});
		});


</script>
</main>