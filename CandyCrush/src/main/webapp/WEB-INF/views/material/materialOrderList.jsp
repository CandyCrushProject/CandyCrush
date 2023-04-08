<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#caNmModal{
		cursor:pointer;
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
								<input type="text" id="caNmModal" style="width: 315px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<br/>
								<label>발주신청일</label>
								<input type="date" id="startDate"
									style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;
								<input type="date" id="endDate"
									style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<button type="button" class="cndSrchBtn">검색</button>
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
		$('#caNmModal').on('click',(e)=>{
			document.getElementById('modal').style.display='block';
			//Modal Grid 빠르게 띄우는 방법
			setTimeout(()=> caModal.refreshLayout() , 0);
		})


//----------------------------------------Grid 부분
		//자재목록
		const materialOrderList = new Grid({
			el: document.getElementById('materialOrderList'), // Container element
			rowHeaders: ['checkbox'],
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
					name: 'moCpltDt',
					sortingType: 'asc',
					sortable: true
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
</script>
</main>