<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<main>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">설비조회</h1>
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Tables</a></li>
				<li class="active">Data</li>
			</ol>

		</div>

		<div id="page-inner">
<!-- 모달 -->
<!-- The Modal -->
<!-- <c:forEach items="${statList }" var="stat">
<div id="${stat.facCd}Modal" class="w3-modal">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('${stat.facCd}Modal').style.display='none'"      class="w3-button w3-display-topright">&times;</span>
			<h3>${stat.facNm} 상세정보</h3>
      <table class="candyTab">
				<tbody>
						<tr><th>설비코드</th><td>${stat.facCd}</td></tr>
						<tr><th>설비명</th><td>${stat.facNm}</td></tr>
						<tr><th>도입일자</th><td><fmt:formatDate value="${stat.facDt}" pattern="yyyy-MM-dd"/></td></tr>
						<tr><th>점검주기</th><td>${stat.facCy}일</td></tr>
						<tr><th>최근 점검일</th><td><fmt:formatDate value="${stat.facRctMtn}" pattern="yyyy-MM-dd"/></td></tr>
						<tr><th>점검예정일</th><td><fmt:formatDate value="${stat.mtnPlanned}" pattern="yyyy-MM-dd"/></td></tr>
						<tr><th>현재 가동정보</th> <td>${stat.facRun}</td></tr>
				</tbody>
			</table>
    </div>
  </div>
</div>
</c:forEach> -->
<!-- 모달 -->

<!-- 모달 -->
<!-- The Modal -->
<div id="mtnInsertModal" class="w3-modal">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('mtnInsertModal').style.display='none'"      class="w3-button w3-display-topright">&times;</span>
			<h3>점검일지 기록</h3>
			<ul>
				<li><label for="facCd">설비코드</label> <input type="설비코드" name="facCd"></li>
			</ul>
    </div>
  </div>
</div>
<!-- 모달끝 -->


<!-- 데이터 전달용 -->
<span id="statInfo" style="display: none;">
	<c:forEach items="${statList }" var="stat">
		{
		"facCd": "${stat.facCd}",
		"facNm": "${stat.facNm}",
		"facDt": "<fmt:formatDate value="${stat.facDt}" pattern="yyyy-MM-dd"/>",
		"facCy": "${stat.facCy}일",
		"facRctMtn": "<fmt:formatDate value="${stat.facRctMtn}" pattern="yyyy-MM-dd"/>",
		"mtnPlanned": "<fmt:formatDate value="${stat.mtnPlanned}" pattern="yyyy-MM-dd"/>",
		"facRun": "${stat.facRun}" 
	},
	</c:forEach>
</span>
<span id="mtnInfo" style="display: none;">
	<c:forEach items="${mtnList }" var="mtn">
		{
		"facMtn": "${mtn.facMtn}",
		"facCd": "${mtn.facCd}",
		"facRtn": "${mtn.facRtn}",
		"facMtnDt": "<fmt:formatDate value="${mtn.facMtnDt}" pattern="yyyy-MM-dd"/>",
		"facRslt": "${mtn.facRslt}",
		"facAct": "${mtn.facAct}",
		"facActDtl": "${mtn.facActDtl}",
		"facMgr": "${mtn.facMgr}" 
	},
	</c:forEach>
</span>
	<!-- 데이터전달용 끝 -->





			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">점검예정이 가까운장비<br>
						</div>
						<div class="card-content">
							<div id="statListGrid"></div>
						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>
			<!-- /. ROW  -->
			<div class="row">
				<div class="col-md-12">
					<!--   Kitchen Sink -->
					<div class="card">
						<div class="card-action">점검이력</div>
						<button onclick="document.getElementById('mtnInsertModal').style.display='block'"class="candyBtn">상세정보</button>
						<div class="card-content">
							<div class="table-responsive">
								<div id="mtnListGrid"></div>
							</div>
						</div>
						</div>
					</div>
					<!-- End  Kitchen Sink -->
				</div>
			</div>
			<!-- /. ROW  -->
			<div class="row">
				<div class="col-md-6">

				</div>
			</div>
			<!-- /. ROW  -->

		</div>
		<!-- /. PAGE INNER  -->
	</div>

	<script>
		const Grid = tui.Grid;


		// 설비점검예정일----------------------------------------------------------------
		let statList=document.getElementById("statInfo").innerHTML
		let statJsonString='['+statList.trim().slice(0,-1)+']'
		let statJsonPharsed=JSON.parse(statJsonString);
		let data = statJsonPharsed;
		const statListGrid = new Grid({
			el: document.getElementById('statListGrid'), // Container element
			//rowHeaders: ['checkbox'],
			columns: [
				{
					header: '설비코드',
					name: 'facCd',
					sortable: true
				},
				{
					header: '설비명',
					name: 'facNm',
					sortable: true
				},
				{
					header: '최근점검일',
					name: 'facRctMtn'
				},
				{
					header: '점검예정일',
					name: 'mtnPlanned',
					sortable: true,
					sortingType: 'desc',
					
				},
				{
					header: '도입일',
					name: 'facDt',
					sortable: true
				},
				{
					header: '점검주기',
					name: 'facCy',
					sortable: true
				},
				
				{
					header: '현재가동정보',
					name: 'facRun'
				}
			],
			data,
			bodyHeight: 200,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  		}
		});
	
		// 설비점검기록----------------------------------------------------------------
		let mtnList=document.getElementById("mtnInfo").innerHTML
		let mtnJsonString='['+mtnList.trim().slice(0,-1)+']'
		let mtnJsonPharsed=JSON.parse(mtnJsonString);
		data=mtnJsonPharsed;
		const mtnListGrid = new Grid({
			el: document.getElementById('mtnListGrid'), // Container element
			//rowHeaders: ['checkbox'],
			columns: [
				{
					header: '점검코드',
					name: 'facMtn',
					sortable: true
				},
				{
					header: '설비코드',
					name: 'facCd',
					sortable: true
				},
				{
					header: '점검구분',
					name: 'facRtn'
				},
				{
					header: '점검일',
					name: 'facMtnDt',
					sortable: true,
					sortingType: 'desc',
					
				},
				{
					header: '점검결과',
					name: 'facRslt',
					sortable: true
				},
				{
					header: '점검명',
					name: 'facAct',
					sortable: true
				},
				
				{
					header: '점검상세',
					name: 'facActDtl'
				},
				{
					header: '담당자',
					name: 'facMgr'
				}
			],
			data,
			bodyHeight: 200,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  		}
		});
	</script>
</main>