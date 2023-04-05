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
	}
	#DelBtn{
		float: right;
	}
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

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<!--<div class="card-action">자재발주조회</div>-->
						<div class="card-content">
							<div>
								<h5><b>입고등록</b></h5>
								<div id="floatBtn">
									<button type="button" class="cndInsBtn">저장</button>
									<button type="button" class="cndDelBtn">삭제</button>
									<button type="reset" class="">초기화</button>
								</div>
								<div>
									<label for="mtrlInput">입고일자</label>
									<input type="date" id="mtrlInput" style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">
									<label for="mtrInputType">&nbsp;&nbsp;&nbsp;입고유형</label>
									<input type="text" id="mtrInputType" style="width: 150px; border: 1px solid rgba(128, 128, 128, 0.61);">
								</div>
	
								<h5><b>검사자료 조회</b></h5>
								<div>
									<label>업체명</label> 
									<input type="text" style="width: 315px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
									<button type="button" id="bgnSearchBtn" class="cndSrchBtn">검색</button>
									<br/>
									<label for="inspDate">검사자료</label>
									<input type="date" id="inspDate"
											style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;
									<input type="date" style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
									<button type="button" id="inspSearchBtn" class="">가져오기</button>
									<br/>
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
						<div class="card-action">
							<button type="button" id="DelBtn" class="cndDelBtn">삭제</button>
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
					<!-- Advanced Tables -->
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
		const data = [
			{
				moCd: '34aea324',
				moTitle: '발주명test',
				moReoDt: '2023-03-31',
				moCpltDt: '2023-04-05',
				caNo: 'eklhf32',
				caNm: '머시기'
			}
		];

		//자재목록
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
			data,
			bodyHeight: 420,
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
			bodyHeight: 420,
		});
</script>
</main>