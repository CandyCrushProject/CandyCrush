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
	#DelBtn,#AddBtn{
		float: right;
		margin-right: 10px;
	}
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

									<label for="outNote">&nbsp;&nbsp;&nbsp;상세정보</label>
									<input type="text" id="outNote" style="width: 150px; border: 1px solid rgba(128, 128, 128, 0.61);">

									<label for="outType">&nbsp;&nbsp;&nbsp;출고유형</label>
									<select style="display: inline; width: 100px;">
										<option value="부서">부서</option>
										<option value="협력업체">협력업체</option>
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
						<div class="card-action">
							<button type="button" id="AddBtn" class="cndInsBtn">추가</button>
							<button type="button" id="DelBtn" class="cndDelBtn">삭제</button>
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
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">출고목록</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="materialOutCheck"></div>
							</div>
						</div>
					</div> <!--End 출고목록 테이블 -->
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

		//출고등록
		const materialOutAdd = new Grid({
			el: document.getElementById('materialOutAdd'), // Container element
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
					header: 'LOT번호',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: 'LOT재고',
					name: ''
				},
				{
					header: '출고량',
					name: ''
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

		//출고목록
		const materialOutCheck = new Grid({
			el: document.getElementById('materialOutCheck'), // Container element
			columns: [
				{
					header: '출고번호',
					name: '',
				},
				{
					header: '출고일자',
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