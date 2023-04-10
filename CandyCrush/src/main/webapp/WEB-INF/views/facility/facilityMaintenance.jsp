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
<div id="mtnInsertModal" class="w3-modal" style="z-index: 100;">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('mtnInsertModal').style.display='none'"      class="w3-button w3-display-topright">&times;</span>
			<h3>점검일지 기록</h3>
			<form id="mtnInsertForm" action="insertFacilityMaintenance" method="post" >
				<table>
					<tr>
						<td>
							<label for="facMgr">담당자</label>
						</td>
						<td>
							 <input type="text" name="facMgr" style="display: inline; width: 70%;" required required>
						</td>
					</tr>
					<tr>
						<td>
							<label for="facCd">설비</label>
						</td>
						<td>
						<select name="facCd" id="facCdSelect" form="mtnInsertForm" style="display: inline; width: 70%;" required>
								<option value="">--Please choose an option--</option>
								<c:forEach items="${statList }" var="stat">
								<option value="${stat.facCd }">${stat.facCd } | ${stat.facNm }</option>
							</c:forEach>
						</select>
					</td>
					</tr>
					<tr>
						<td>
							<label for="facRtn">분류</label>
						</td>
						<td><select name="facRtn" style="display: inline; width: 70%;" required>
								<option value="">--Please choose an option--</option>
								<option value="정기">정기</option>
								<option value="비정기">비정기</option>
						</td>
							
						</select>
					</tr>
					<tr>
						<td><label for="facMtnDt">점검일</label>
						</td>
						<td>
						 <input type="date" name="facMtnDt" style="display: inline; width: 70%;" required>
						</td>
					</tr>
					<tr>
					<td>
						<label for="facRslt">점검결과</label>
					</td>
					<td>
						<select name="facRslt" style="display: inline; width: 70%;" required>
								<option value="">--Please choose an option--</option>
								<option value="합격">합격</option>
								<option value="불합격">불합격</option>
						</select>
					</td>
					</tr>
					<tr>
						<td>
							<label for="facAct" required>점검내역</label>
						</td>
						<td>
						 <input type="text" name="facAct" style="display: inline; width: 70%;" required>
						</td>
					</tr>
					<tr>
						<td><label for="facActDtl" >점검내역 상세</label>
						</td>
						<td>
						 <input type="text" name="facActDtl" style="display: inline; width: 70%;" required>
						</td>
					</tr>
				</table>
				<button class="cndInsBtn" type="submit">등록</button>
				<button class="cndDelBtn" onclick="document.getElementById('mtnInsertModal').style.display='none'">닫기</button>
			</form>
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
						<button onclick="document.getElementById('mtnInsertModal').style.display='block'" style="display: inline;" class="cndInsBtn">점검내역입력</button>
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
					sortable: true,
					filter: {
				        type: 'select'
				      }
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
					 options: {
					        format: 'yyyy-MM-dd'						        
					      }
					
				},
				{
					header: '점검결과',
					name: 'facRslt',
					sortable: true,
					filter: {
				        type: 'select'
				      }
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
						,
						filter: {
					        type: 'select'
					      }
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