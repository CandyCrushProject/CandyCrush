<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<style>
	button {
    width: 100px;
    text-decoration: none;
    border: 1px solid black;
    font-size: 16px;
    background-color: rgb(255, 255, 255);
    color: #000000;
    border-radius: 5px;
    box-shadow: 7px 6px 28px 1px rgba(0, 0, 0, 0.24);
    cursor: pointer;
    outline: none;
    transition: 0.2s all;
	}

	button:active {
			transform: scale(0.98);
			box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
	}

	label{
		margin-right: 10px;
	}
	#eunae{
		text-align: center;
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
			<h1 class="page-header">자재발주</h1>
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
						<div class="card-action">자재목록</div>
						<div id="eunae">
							<label for="mtrlName">원자재명<input type="text" id="mtrlName"></label> 
							<label for="companyName">업체명<input type="text" id="companyName"></label>
							<button id="search">검색</button>
						</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="material"></div>
								<!--<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>자재코드</th>
											<th>자재명</th>
											<th>업체코드</th>
											<th>업체명</th>
											<th>현재재고</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center">4</td>
											<td class="center">X</td>
										</tr>
									</tbody>
								</table>-->
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
							<button id="orderDelete">삭제</button>
							<button id="drderInsert">등록</button>
						</div>
						<div style="clear:both"></div>
							<div class="table-responsive">
								<div id="materialOrder"></div>
								<!--<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>자재코드</th>
											<th>자재명</th>
											<th>업체코드</th>
											<th>업체명</th>
											<th>발주코드</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center">4</td>
											<td class="center">X</td>
										</tr>
									</tbody>
								</table> -->
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
		const material = new Grid({
			el: document.getElementById('material'), // Container element
			columns: [
				{
					header: '자재코드',
					name: 'cmmCd'
				},
				{
					header: '자재명',
					name: 'cmmNm'
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
			data: [
				{
					name: 'Beautiful Lies',
					artist: 'Birdy',
					release: '2016.03.26',
					genre: 'Pop'
				}
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  		}
		});

		material.resetData(newData); // Call API of instance's public method
		
		//자재발주
		const materialOrder = new Grid({
			el: document.getElementById('materialOrder'), // Container element
			columns: [
				{
					header: '발주코드',
					name: 'moCd'
				},
				{
					header: '발주명',
					name: 'moTitle'
				},
				{
					header: '발주신청일',
					name: 'moReoDt'
				},
				{
					header: '자재코드',
					name: 'cmmCd'
				},
				{
					header: '납기일',
					name: 'moDlvDt'
				}
			],
			data: [
				{
					name: 'Beautiful Lies',
					artist: 'Birdy',
					release: '2016.03.26',
					genre: 'Pop'
				}
			],
			bodyHeight: 300,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  		}
		});

		materialOrder.resetData(newData); // Call API of instance's public method

		Grid.applyTheme('striped'); // Call API of static method
	</script>
</main>