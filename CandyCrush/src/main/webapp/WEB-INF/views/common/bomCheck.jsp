<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    label{
		width: 100px;
    }
    #floatBtn{
		float: right;
		margin-bottom: 5px;
	}
	.tui-grid-cell.cell-red {background-color: rgba(255, 121, 121, 0.432)}
	.tui-grid-cell.cell-green {background-color: rgba(255, 255, 255, 0.877)}
    #prodExcelBtn, #procExcelBtn{
        margin-left: 15px;
    }
</style>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">BOM관리</h1>
			<ol class="breadcrumb">
				<li><a href="#">candy</a></li>
				<li><a href="#">공통관리</a></li>
				<li class="active">BOM관리</li>
			</ol>
		</div>

		<!-- 업체명 검색 모달 -->
		<div id="modal" class="w3-modal" style="z-index: 100;">
			<div class="w3-modal-content">
				<div class="w3-container">
					<span class="w3-button w3-display-topright" onclick="document.getElementById('modal').style.display='none'">&times;</span>
					<h3>업체검색</h3>
					<div>
						<input type="text" id="modalCaNm" placeholder="업체명" style="width: 100%;" autocomplete="off">
						<br/>
						<input type="text" id="modalCaCd" placeholder="업체코드" style="width: 100%;" autocomplete="off">
					</div>
					<div id="caModal"></div>
				</div>
			</div>
		</div><!-- End 업체명 검색 모달 -->

		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-content">
							<div>
								<label>제품명</label> 
								<input type="text" id="mtrlcaNm" style="width: 300px; border: 1px solid rgba(128, 128, 128, 0.61);">&nbsp;&nbsp;&nbsp;
								<!--<button class="srchBtn" id="companySearch">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>-->
                                <button type="button" class="cndSelBtn">조회</button>
                                <div id="floatBtn"> 
                                    <button type="button" id="resetBtn" class="cndRstBtn">초기화</button>
                                </div>
							</div>
						</div>
					</div>
				</div>
			</div> <!--END row-->
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<div class="card-action">제품리스트</div>
                        <button type="button" id="prodExcelBtn" class="cndInsBtn">EXCEL</button>
                        <div class="mtrlOrderRightBtn">
                            <button id="bomInAndUp" class="cndInsBtn">저장</button>
                            <button id="bomInsert" class="cndUdtBtn">추가</button>
                            <button id="bomDelete" class="cndDelBtn">삭제</button>
                        </div>
                        <div class="card-content">
                            <div style="clear:both"></div>
                            <div class="table-responsive">
                                <!-- 제품리스트 -->
                                <div id="prodList"></div>
                            </div>
						</div>
					</div>
				</div> <!--END row-->
                <div class="col-md-8">
					<div class="card">
						<div class="card-action">공정리스트</div>
                        <button type="button" id="procExcelBtn" class="cndInsBtn">EXCEL</button>
                        <div class="mtrlOrderRightBtn">
                            <button id="bomInAndUp" class="cndInsBtn">저장</button>
                            <button id="bomInsert" class="cndUdtBtn">추가</button>
                            <button id="bomDelete" class="cndDelBtn">삭제</button>
                        </div>
                        <div class="card-content">
                            <div style="clear:both"></div>
                            <div class="table-responsive">
                                <div id="procList"></div>
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
        //제품리스트
        const prodList = new Grid({
			el: document.getElementById('prodList'),
            rowHeaders: ['rowNum', 'checkbox'],
            scrollX: false,
			columns: [
				{
					header: '제품코드',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '제품명',
					name: ''
				},
				{
					header: 'BOM등록일',
					name: ''
				}
			],
			bodyHeight: 400,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

        //공정리스트
        const procList = new Grid({
			el: document.getElementById('procList'),
            rowHeaders: ['rowNum', 'checkbox'],
            scrollX: false,
			columns: [
				{
					header: '공정코드',
					name: '',
					sortingType: 'asc',
					sortable: true
				},
				{
					header: '공정명',
					name: ''
				},
				{
					header: '공정순번',
					name: ''
				},
				{
					header: '자재명',
					name: ''
				},
				{
					header: '자재소요량',
					name: ''
				},
				{
					header: '공정',
					name: ''
				}
			],
			bodyHeight: 400,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
			}
		});

        //초기화버튼
		$('#resetBtn').on('click', () => {
			prodList.clear();		//제품리스트 Grid 초기화
			procList.clear();		//공정리스트 Grid 초기화
		});
    </script>
</main>