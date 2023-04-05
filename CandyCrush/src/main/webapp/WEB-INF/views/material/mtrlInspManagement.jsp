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
			<h1 class="page-header">자재입고검사관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">자재관리</a></li>
				<li class="active">자재입고검사관리</li>
			</ol>
		</div>
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<!-- 조회 테이블 -->
					<div class="card">
						<!--<div class="card-action">조회</div>-->
						<div class="card-content">
						<div>
							<h5><b>입고등록</b></h5>
							<div id="floatBtn">
                                <button type="button" class="cndInsBtn">저장</button>
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
								<label for="inspDate">검사일자</label>
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
				</div> <!--End 조회 테이블 -->
			</div> <!--END row-->
			<!--자재발주 테이블-->
			<div class="row">
				<div class="col-md-8">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">
							<button type="button" id="DelBtn" class="cndDelBtn">삭제</button>
						</div>
						<div style="clear:both"></div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="mtrlInspCheck"></div>
							</div>
						</div>
					</div>
				<!--End Advanced Tables -->
				</div>
				<div class="col-md-4">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">입고목록</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="mtrlInspCheckTwo"></div>
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

		//검사완료된 자재를 LOT를 부여하는 테이블
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

		//LOT번호가 부여된 자재를 입고DB Table에 등록되는 테이블
		const mtrlInspCheckTwo = new Grid({
			el: document.getElementById('mtrlInspCheckTwo'), // Container element
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
				}
			],
			bodyHeight: 405,
		});
</script>
</main>