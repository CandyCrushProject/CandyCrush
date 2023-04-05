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
			<h1 class="page-header">자재입고관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재입고관리</li>
			</ol>

		</div>

		<div id="page-inner">
			<!--자재발주 테이블-->
			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
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
                            <button type="button" id="bgnSearchBtn" class="">검색</button>
							<br/>
							<label>자재명</label>
                            <input type="text" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
                            <button type="button" class="mtrlSearchBtn">검색</button>
						</div>
						<div style="clear:both"></div>
							<div class="table-responsive">
								<div id="mtrlInspCheck"></div>
							</div>
						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div> <!--END row-->
		</div>
		<!-- /. PAGE INNER  -->
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
					name: 'miCd'
				},
				{
					header: '검사일자',
					name: 'miDt'
				},
				{
					header: '자재코드',
					name: ''
				},
				{
					header: '자재명',
					name: ''
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
					name: 'miCnt'
				},
				{
					header: '합격량',
					name: 'miBadCnt'
				},
				{
					header: '불량량',
					name: 'miPassCnt'
				},
                {
					header: '비고',
					name: 'miNote'
				}
			],
			//data,
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  		}
		});
</script>
</main>