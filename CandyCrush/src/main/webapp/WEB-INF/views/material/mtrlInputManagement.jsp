<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
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
						<input type="text" id="modalCaNm" placeholder="업체명" style="width: 90%;" autocomplete="off">
						<br/>
						<input type="text" id="modalCaCd" placeholder="업체코드" style="width: 90%;" autocomplete="off">
						<button class="srchBtn" id="modalBtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
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
								<h5><b>▶ 입고등록</b></h5>

								<div>
									<div style="clear:both"></div>
									<button type="button" class="cndInsBtn mtrlInputMngFloatBtn">저장</button>
									<button type="button" class="cndDelBtn mtrlInputMngFloatBtn">삭제</button>
									<button type="reset" id="restBtn" class="cndRstBtn mtrlInputMngFloatBtn">초기화</button>
									<div id="inputReset">
										<label for="mtrlInput">입고일자</label>
										<input type="date" id="mtrlInput" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<label for="mtrInputType">입고유형</label>
										<select id="mtrInputType" name="cmmType" style="display: inline; width: 200px;">
											<option value="0">--선택해주세요--</option>
											<option value="원자재">원자재</option>
											<option value="부자재">부자재</option>
										</select>
									</div>
								</div>
	
								<h5><b>▶ 검사자료 조회</b></h5>
								<div>
									<label for="caNmInput">업체명</label> 
									<input type="text" id="caNmInput" style="width: 315px; border: 1px solid rgba(128, 128, 128, 0.61);" readonly>&nbsp;
									<button class="srchBtn" id="companySearch"><i class="fa-solid fa-magnifying-glass"></i></button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label for="inspDate">검사자료</label>
									<input type="date" id="inspDate"
											style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;
									<input type="date" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
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
						<button type="button" id="mtrlInputMngDelBtn" class="cndDelBtn" style="margin: 10px 20px 0px 0px !important;">삭제</button>
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
						<div class="card-action">입고목록</div>
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

		//리셋버튼 누르면 input value 초기화해준다.
		$('#restBtn').on('click', ()=>{
			$('#inputReset').find('input').each(function(){
				$(this).val('');
			});
		});

		//업체명 input 클릭하면 업체명 모달창 뛰우기
		$('#companySearch').on('click',(e)=>{
			document.getElementById('modal').style.display='block';
			//Modal Grid 빠르게 띄우는 방법
			//모달 안에 있는 그리드를 한번 리프레쉬하고
			//아작스를 통해 통신을 한다음데이터를 뿌려준다?
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
//--------------------------------------------------------------Grud
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

		
		const materialLotSave = new Grid({
			el: document.getElementById('materialLotSave'), // Container element
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '자재코드',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '자재명',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '규격',
					name: ''
				},
				{
					header: '단위',
					name: ''
				},
				{
					header: '유형',
					name: ''
				},
				{
					header: '발주번호',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '입고수량',
					name: ''
				},
				{
					header: '유통기한',
					name: '',
					sortingType: 'asc',
					sortable: true
				}
				
			],
			bodyHeight: 520,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		const mtrlInputList = new Grid({
			el: document.getElementById('mtrlInputList'), // Container element
			columns: [
				{
					header: '입고코드',
					name: '',
				},
				{
					header: '입고일자',
					name: ''
				},
				{
					header: '건수',
					name: ''
				}
			],
			bodyHeight: 510,
		});
</script>
</main>