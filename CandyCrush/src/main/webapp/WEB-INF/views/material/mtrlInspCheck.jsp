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
        margin-bottom: 5px;
	}
</style>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">자재입고검사조회</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재입고검사조회</li>
			</ol>
		</div>

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-action">자재입고검사조회</div>
						<div class="card-content">
							<div>
								<div id="floatBtn">
									<button type="button" class="cndSelBtn">조회</button>
									<button type="button" class="">엑셀</button>
								</div>
								<label>검사일자</label>
								<input type="date" style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;ㅡ&nbsp;<input type="date" style="width: 140px; border: 1px solid rgba(128, 128, 128, 0.61);">
								<br/>
								<label>업체명</label> 
								<input type="text" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<button type="button" id="bgnSearchBtn" class="cndSrchBtn">검색</button>
								<br/>
								<label>자재명</label>
								<input type="text" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<button type="button" class="cndSrchBtn">검색</button>
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
									<div id="mtrlInspCheck"></div>
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

		//자재목록
		const mtrlInspCheck = new Grid({
			el: document.getElementById('mtrlInspCheck'), // Container element
			rowHeaders: ['checkbox'],
			columns: [
				{
					header: '검사코드',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '검사일자',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
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
					header: '검사량',
					name: ''
				},
				{
					header: '합격량',
					name: ''
				},
				{
					header: '불량량',
					name: ''
				},
                {
					header: '비고',
					name: ''
				}
			],
			//data,
			bodyHeight: 420,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  		}
		});
</script>
</main>