<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<main>
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
							<div>
								<label>업체명</label>
								<input type="text" style="width: 315px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<br/>
								<label>발주신청일</label>
								<input type="date"
										style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;
								<input type="date" style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<button type="button" class="cndSrchBtn">검색</button>
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
							<!--<div>
								<label>업체명</label>
								<input type="text" style="width: 150px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<br/>
								<label>발주신청일</label>
								<input type="date" style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;<input type="date" style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<button type="button" class="cndSrchBtn">검색</button>
							</div>
							<div style="clear:both"></div>-->
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
			data,
			bodyHeight: 420,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  			}
		});
</script>
</main>