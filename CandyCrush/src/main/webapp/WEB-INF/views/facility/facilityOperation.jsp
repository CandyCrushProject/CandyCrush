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
<c:forEach items="${opStatList }" var="stat">
<div id="${stat.facCd}Modal" class="w3-modal" style="z-index: 100;">
  <div class="w3-modal-content w3-animate-left">
    <div class="w3-container" style="height = 500px">
      <span onclick="document.getElementById('${stat.facCd}Modal').style.display='none'"  class="w3-button w3-display-topright">&times;</span>

			<c:choose>
			<c:when test="${stat.facRun eq 'Y'}">			<!-- 가동중인 설비 정지클릭시 정지양식 모달 호출 -->
				<h3>가동정지</h3>
	      		<form id="OperationStopForm" action="insertFacilityAbortOpertation" method="post" >
							<table>
								<tr>
									<td>
										<label for="facCd">설비코드</label>
									</td>
									<td>
										<input type="text" value="${stat.facCd }" name="facCd" style="display: inline; width: 70%;" readonly>
									</td>
								</tr>
								<tr>
									<td>
										<label for="facNm">설비명</label>
									</td>
									<td>
										<input type="text" value="${stat.facNm }" name="facNm" style="display: inline; width: 70%;" readonly>
									</td>
								</tr>
								<tr>
									<td>
										<label for="fdmMgr">담당자</label>
									</td>
									<td>
										<input type="text" name="fdmMgr" style="display: inline; width: 70%;" required>
									</td>
								</tr>
								<tr>
									<td>
										<label for="fdmStop">가동정지시간</label>
									</td>
									<td>
										<input class="fdmTimeInput" type="datetime-local" name="fdmStop" style="display: inline; width: 70%;" step="1" required>
									</td>
								</tr>
								<tr>
									<td>
										<label for="cfdCd">비가동코드</label>
									</td>
									<td>
									<select name="cfdCd" id="cfdCdSelect" style="display: inline; width: 70%;" required>
											<option value="">--Please choose an option--</option>
											<c:forEach items="${dwnList }" var="dwn">
											<option value="${dwn.cfdCd }">${dwn.cfdCd } | ${dwn.cfdTitle }</option>
										</c:forEach>
									</select>
									<input name="facRun" value="N" style="display:none" readOnly ></input>
								</td>
								</tr>
							</table>
							<button class="cndInsBtn" type="submit">등록</button>
							<button class="cndDelBtn" onclick="document.getElementById('${stat.facCd}Modal').style.display='none'">닫기</button>
						</form>
			</c:when>

			<c:otherwise>
								<!-- 비가동중인 설비 재가동시 재가동양식 모달출력 -->
			<h3>재가동</h3>
			<form id="OperationRestartForm" action="insertFacilityRestartOpertation" method="post" >
				<table>
					<tr>
						<td>
							<label for="fdmCd">비가동이력코드</label>
						</td>
						<td>
							 <input type="text" value="${stat.fdmCd }" name="fdmCd" style="display: inline; width: 70%;" readonly>
						</td>
						<td>
							<label for="facCd">설비코드</label>
						</td>
						<td>
							 <input type="text" value="${stat.facCd }" name="facCd" style="display: inline; width: 70%;" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label for="facNm">설비명</label>
						</td>
						<td>
							 <input type="text" value="${stat.facNm }" name="facNm" style="display: inline; width: 70%;" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label for="fdmMgr">담당자</label>
						</td>
						<td>
							 <input type="text" name="fdmMgr" value="${stat.fdmMgr}" style="display: inline; width: 70%;" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label for="fdmStop">가동정지시간</label>
						</td>
						<td>
							 <input type="datetime-local" name="fdmStop" value="<fmt:formatDate value="${stat.rctStp}"   pattern="yyyy-MM-dd HH:mm:ss"/>" style="display: inline; width: 70%;" readonly>
						</td>
					</tr>
					<tr>
						<td>
							<label for="fdmRun">재가동시간</label>
						</td>
						<td>
							 <input class="fdmTimeInput" type="datetime-local" name="fdmRun" style="display: inline; width: 70%;" step="1" required>
						</td>
					</tr>
					<tr>
						<td>
							<label for="cfdCd">비가동코드</label>
						</td>
						<td>
						<select name="cfdCd" id="cfdCdSelect" style="display: inline; width: 70%;">
								<c:forEach items="${dwnList }" var="dwn">
								<c:if test ="${stat.cfdCd eq dwn.cfdCd }">
									<option value="${dwn.cfdCd}" selected disabled="disabled">${dwn.cfdCd} | ${dwn.cfdTitle }</option>
								</c:if>
								</c:forEach>
						</select>
					</td>
					</tr>
				</table>
				<input name="facRun" value="Y" style="display:none" readOnly ></input>
				<button class="cndInsBtn" type="submit">등록</button>
				<button class="cndDelBtn" onclick="document.getElementById('${stat.facCd}Modal').style.display='none'">닫기</button>
			</form>
			</c:otherwise>
			</c:choose>
    </div>
  </div>
</div>
</c:forEach>
<!-- 모달끝 -->

<!-- The Modal -->
<c:forEach items="${opStatList }" var="stat">
<div id="${stat.facCd}Modal" class="w3-modal" style="z-index: 100;">
  <div class="w3-modal-content">
    <div class="w3-container">
      <span onclick="document.getElementById('${stat.facCd}Modal').style.display='none'"  class="w3-button w3-display-topright">&times;</span>
			<h3>${stat.facNm} 상세정보</h3>
      <table class="candyTab">
				<tbody>
						<tr><th>설비코드</th><td>${stat.facCd}</td></tr>
				</tbody>
			</table>
    </div>
  </div>
</div>
</c:forEach>
<!-- 모달끝 -->

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
										<c:forEach items="${opStatList }" var="stat">
											<tr class="Run${stat.facRun}">
											<td>${stat.facCd }</td>
											<td>${stat.facNm }</td>
											<td>${stat.facRun }</td>
											<td>
												<c:choose>
													<c:when test="${stat.facRun eq 'N'}">
														<button onclick="document.getElementById('${stat.facCd}Modal').style.display='block';init();" class="cndRstBtn ">
															<i class="fa-solid fa-clipboard"></i> 재가동시작
														</button>
													</c:when>
													<c:otherwise>
														<button  onclick="document.getElementById('${stat.facCd}Modal').style.display='block';init();" class="cndDelBtn ">
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
	//radio 클릭에따른 가동/비가동 필터링
		function div_OnOff(v){
		 // 라디오 버튼 value 값 조건 비교
		 if(v == "runAll"){
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunY")[i].style.display = ""
			}
			for(let i = 0; i < document.getElementsByClassName("RunN").length; i++){
		 		document.getElementsByClassName("RunN")[i].style.display = ""
			}
		 }
		 else if(v=="runRun"){
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunY")[i].style.display = ""
			}
			for(let i = 0; i < document.getElementsByClassName("RunN").length; i++){
		 		document.getElementsByClassName("RunN")[i].style.display = "None"
			}
		}
		 
		 else if(v=="runStop"){
			for(let i = 0; i < document.getElementsByClassName("RunY").length; i++){
		 		document.getElementsByClassName("RunY")[i].style.display = "None"
			}
			for(let i = 0; i < document.getElementsByClassName("RunN").length; i++){
		 		document.getElementsByClassName("RunN")[i].style.display = ""
			}

		 }
		};
		
	//모달시간 input에 현재시간 넣기
		init();
		function init(){
			setInterval(setTime, 1000);
		};

		function setTime(){
			let stopDtInput=document.getElementsByClassName("fdmTimeInput");
			for(let i = 0; i <stopDtInput.length; i++){
				stopDtInput[i].value=timestamp();
				console.log("Initializing");
			}
		}
	//현재시간 htmlinput format
		function timestamp(){
		    var today = new Date();
		    today.setHours(today.getHours() + 9);
		    return today.toISOString().replace('T', ' ').substring(0, 19);
		}
		
		
		
		
		const Grid = tui.Grid;
		let orderData = [
			<c:forEach items="${opList}" var="opStat">
				{
					fdmCd:'${opStat.fdmCd}',
					facCd:'${opStat.facCd}',
					facNm:'${opStat.facNm}',
					fdmMgr:'${opStat.fdmMgr}',
					fdmStop:"<fmt:formatDate value="${opStat.fdmStop}" pattern="yyyy-MM-dd"/>",
					fdmRun:"<fmt:formatDate value="${opStat.fdmRun}" pattern="yyyy-MM-dd"/>",
					cfdCd:'${opStat.cfdCd}',
					facRun:'${opStat.facRun}',
					facInfo:'${opStat.facInfo}',
					cfdTitle:'${opStat.cfdTitle}',
					cfdContent:'${opStat.cfdContent}',
				},
			</c:forEach>
		];
		console.log(orderData);
		
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
					name: 'cfdCd',
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