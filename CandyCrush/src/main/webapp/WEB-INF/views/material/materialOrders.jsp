<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style>
	label{
		width: 70px;
		margin-left: 10px;
	}
	#eunae{
		margin-left: 10px;
	}
	#eunae2{
		float: right;
		margin-bottom: 20px;
	}
</style>
<main>
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
							<label>원자재명</label>
							<input type="text" id="mtrlName" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							
							<label>업체명</label>
							<input type="text" id="companyName" style="width: 200px; border: 1px solid rgba(128, 128, 128, 0.61);">
							<button id="search" class="cndSrchBtn">검색</button>
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
								<!-- <button id="orderDelete" class="cndDelBtn">삭제</button> -->
								<button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" aria-expanded="false">
									Action 
									<span class="caret"></span>
								</button>
								
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
		const Grid = tui.Grid;

		const data = [
			{
				cmmCd: '10012',
				cmmNm: 'Seoul',
				cmmTyp: 'South Korea',
				cmmSpec: 'South Korea',
				cmmUnit: 'South Korea',
				cmmSafStc: 60,
			}
		];


		const data2=[
			{
				moCd : '3wfwef',
				moTitle : '발주명',
				moReoDt : '2023-04-05',
				cmmCd : '001a',
				moDlvDt : '2023-05-30'
			}
		];


		//자재목록
		const material = new Grid({
			el: document.getElementById('material'), // Container element
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
					header: '안전재고',
					name: 'cmmSafStc'
				}
			],
			data,
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//자재발주
		const materialOrder = new Grid({
			el: document.getElementById('materialOrder'), // Container element
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
					sortable: true
				},
				{
					header: '자재코드',
					name: 'cmmCd',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '납기일',
					name: 'moDlvDt',
					sortingType: 'asc',
					sortable: true
				}
			],
			data : data2,
			bodyHeight: 400,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

		//Grid.applyTheme('striped'); // Call API of static method

</script>
</main>