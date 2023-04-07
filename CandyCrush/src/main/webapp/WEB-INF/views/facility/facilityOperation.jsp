<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
<c:forEach items="${statList }" var="stat">
<div id="${stat.facCd}Modal" class="w3-modal" style="z-index: 100;">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('${stat.facCd}Modal').style.display='none'"  class="w3-button w3-display-topright">&times;</span>
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
</c:forEach>
<!-- 모달 -->

<!-- The Modal -->
<c:forEach items="${statList }" var="stat">
<div id="${stat.facCd}Modal" class="w3-modal" style="z-index: 100;">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('${stat.facCd}Modal').style.display='none'"  class="w3-button w3-display-topright">&times;</span>
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
</c:forEach>
<!-- 모달 -->

			<div class="row">
				<div class="col-md-12">
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">가동 설비 조회<br>
							<input type="radio" name="runFilter" id="runAll" value="runAll" onclick="div_OnOff(this.value);"/><label for="runAll" >전체</label>
							<input type="radio" name="runFilter" id="runRun" value="runRun" onclick="div_OnOff(this.value);"/><label for="runRun" >가동</label>
							<input type="radio" name="runFilter" id="runStop" value="runStop" onclick="div_OnOff(this.value);"/><label for="runStop" >비가동</label>
						</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover candyTab"
									id="dataTables-example">
									<thead>
										<tr>
											<th>설비코드</th>
											<th>설비명</th>
											<th>설비가동여부</th>
											<th>가동관리</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach items="${statList }" var="stat">
										<tr class="Run${stat.facRun}">
											<td>${stat.facCd }</td>
											<td>${stat.facNm }</td>
											<td>${stat.facRun }</td>
											
											<td>
												<c:choose>
													<c:when test="${stat.facRun eq 'N'}">
														<button onclick="document.getElementById('${stat.facCd}Modal').style.display='block'">
															<i class="fa-solid fa-clipboard"></i> 재가동시작
														</button>
													</c:when>
													<c:otherwise>
														<button  onclick="document.getElementById('${stat.facCd}Modal').style.display='block'">
														<i class="fa-solid fa-clipboard"></i> 가동중지
														</button>
													</c:otherwise>
												</c:choose>

												</td>
										
										</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--End Advanced Tables -->
					<!-- Advanced Tables -->
					<div class="card">
						<div class="card-action">비가동 내역<br>
							
						</div>
						<div class="card-content">
							<div class="table-responsive">
								<div id="operationList"></div>
							</div>
						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>

		</div>
		<!-- /. PAGE INNER  -->
	</div>

	<script>
		function div_OnOff(v){
		 // 라디오 버튼 value 값 조건 비교
		 if(v == "runAll"){
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunY")[i].style.display = ""
			}
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunN")[i].style.display = ""
			}
		 }
		 else if(v=="runRun"){
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunY")[i].style.display = ""
			}
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunN")[i].style.display = "None"
			}
		}
		 
		 else if(v=="runStop"){
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunY")[i].style.display = "None"
			}
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunN")[i].style.display = ""
			}

		 }
		}
		
		
		
		
		
		const Grid = tui.Grid;
		let orderData = [
			<c:forEach items="${opList}" var="opStat">
				{
					fdmCd:'${opStat.fdmCd}',
					facCd:'${opStat.facCd}',
					facNm:'${opStat.facNm}',
					fdmMgr:'${opStat.fdmMgr}',
					fdmStop:'${opStat.fdmStop}',
					fdmRun:'${opStat.fdmRun}',
					cfdCd:'${opStat.cfdCd}',
					facRun:'${opStat.facRun}',
					facInfo:'${opStat.facInfo}',
					cfdTitle:'${opStat.cfdTitle}',
					cfdContent:'${opStat.cfdContent}',
				},
			</c:forEach>
		];
		
		
		const opList = new Grid({
			el: document.getElementById('operationList'), // Container element
			data: orderData,
			columns: [
				{
					header: '비가동번호',
					name: 'fdmCd',
					sortingType: 'asc',
					sortable: true
				},
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
					header: '담당자',
					name: 'fdmMgr',
					sortable: true
				},
				{
					header: '비가동일시',
					name: 'fdmStop',
					sortable: true
				},
				{
					header: '가동일시',
					name: 'fdmRun',
					sortable: true
				},
				{
					header: '비가동코드',
					name: 'facInfo',
					sortable: true
				},
				{
					header: '비가동명',
					name: 'cfdTitle',
					sortable: true
				},
				
			],
			bodyHeight: 500,
			pageOptions: {
				useClient: true,
				type: 'scroll',
				perPage: 30
  			}
		});
	</script>
</main>