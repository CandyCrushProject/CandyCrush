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
											<th>상세정보</th>
										</tr>
									</thead>
									<tbody>
											<c:forEach items="${statList }" var="stat">
										<tr class="Run${stat.facRun}">
											<td>${stat.facCd }</td>
											<td>${stat.facNm }</td>
											<td>${stat.facRun }</td>
											
											<td>
												<button onclick="document.getElementById('${stat.facCd}Modal').style.display='block'">
												<i class="fa-solid fa-clipboard"></i> 상세정보
												</button> 
												</td>
										
										</tr>
										</c:forEach>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--End Advanced Tables -->
				</div>
			</div>
			<!-- /. ROW  -->
			<div class="row">
				<div class="col-md-6">
					<!--   Kitchen Sink -->
					<div class="card">
						<div class="card-action">Kitchen Sink</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Username</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- End  Kitchen Sink -->
				</div>
				<div class="col-md-6">
					<!--   Basic Table  -->
					<div class="card">
						<div class="card-action">Basic Table</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Username</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- End  Basic Table  -->
				</div>
			</div>
			<!-- /. ROW  -->
			<div class="row">
				<div class="col-md-6">
					<!--    Striped Rows Table  -->
					<div class="card">
						<div class="card-action">Striped Rows Table</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Username</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--  End  Striped Rows Table  -->
				</div>
				<div class="col-md-6">
					<!--    Bordered Table  -->
					<div class="card">
						<div class="card-action">Bordered Table</div>
						<!-- /.panel-heading -->
						<div class="card-content">
							<div class="table-responsive table-bordered">
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Username</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--  End  Bordered Table  -->
				</div>
			</div>
			<!-- /. ROW  -->
			<div class="row">
				<div class="col-md-6">
					<!--    Hover Rows  -->
					<div class="card">
						<div class="card-action">Hover Rows</div>
						<div class="card-content">
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Username</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
										<tr>
											<td>2</td>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
										</tr>
										<tr>
											<td>3</td>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- End  Hover Rows  -->
				</div>
				<div class="col-md-6">
					<!--    Context Classes  -->
					<div class="card">

						<div class="card-action">Context Classes</div>

						<div class="card-content">
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Username</th>
										</tr>
									</thead>
									<tbody>
										<tr class="success">
											<td>1</td>
											<td>Mark</td>
											<td>Otto</td>
											<td>@mdo</td>
										</tr>
										<tr class="info">
											<td>2</td>
											<td>Jacob</td>
											<td>Thornton</td>
											<td>@fat</td>
										</tr>
										<tr class="warning">
											<td>3</td>
											<td>Larry</td>
											<td>the Bird</td>
											<td>@twitter</td>
										</tr>
										<tr class="danger">
											<td>4</td>
											<td>John</td>
											<td>Smith</td>
											<td>@jsmith</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--  end  Context Classes  -->
				</div>
			</div>
			<!-- /. ROW  -->

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
	</script>
</main>