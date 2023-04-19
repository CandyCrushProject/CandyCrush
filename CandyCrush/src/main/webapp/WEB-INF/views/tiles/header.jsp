<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
		<header>
			<div id="wrapper">
				<nav class="navbar navbar-default top-navbar" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse"
							data-target=".sidebar-collapse">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand waves-effect waves-dark" href="index.html"><i
								class="large material-icons">track_changes</i> <strong>Candy Crush</strong></a>

						<div id="sideNav" href="">
							<i class="material-icons dp48">toc</i>
						</div>
					</div>

					<ul class="nav navbar-top-links navbar-right">
						<li>
							<sec:authorize access="isAuthenticated()">
								<form action="${pageContext.request.contextPath}/logout" method="post">
									<a class="waves-effect waves-dark" href="${pageContext.request.contextPath}/logout"
										style="color: black; position: relative; bottom: 23px; text-decoration-line: none;">
										<i class="fa fa-sign-out fa-fw"></i>
										<b>로그아웃</b>
									</a>
								</form>
							</sec:authorize>
						</li>
						<li>
							<a class="waves-effect waves-dark" href="#!">
								<i class="fa fa-user fa-fw"></i> <b>관리자</b></a>
						</li>
					</ul>
				</nav>
				<!-- /. NAV SIDE  -->
				<nav class="navbar-default navbar-side" role="navigation">
					<div class="sidebar-collapse">
						<ul class="nav" id="main-menu">

							<!-- <li><a href="${pageContext.request.contextPath}/dashboard" class="waves-effect waves-dark"><i
									class="fa fa-dashboard"></i>
								Dashboard</a></li>
						<li><a href="${pageContext.request.contextPath}/ulElements" class="waves-effect waves-dark"><i
									class="fa fa-desktop"></i>
								UI Elements</a></li>
						<li><a href="${pageContext.request.contextPath}/chart" class="waves-effect waves-effect waves-dark"><i
									class="fa fa-bar-chart-o"></i> Charts</a></li>
						<li><a href="${pageContext.request.contextPath}/tabpnel" class="waves-effect waves-effect waves-dark"><i
									class="fa fa-qrcode"></i> Tabs & Panels</a></li>

						<li><a href="${pageContext.request.contextPath}/table" class="waves-effect waves-dark"><i
									class="fa fa-table"></i>
								Responsive Tables</a></li>
						<li><a href="${pageContext.request.contextPath}/form" class="waves-effect waves-dark"><i
									class="fa fa-edit"></i>
								Forms </a></li>


						<li><a href="#" class="waves-effect waves-dark"> <i class="fa fa-sitemap"></i> Multi-Level Dropdown <span
									class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="#" class="waves-effect waves-dark"> Second
										Level Link </a></li>
								<li><a href="#" class="waves-effect waves-dark">Second
										Level Link</a></li>
								<li><a href="#" class="waves-effect waves-dark">Second
										Level Link<span class="fa arrow"></span>
									</a>
									<ul class="nav nav-third-level">
										<li><a href="#">Third Level Link</a></li>
										<li><a href="#">Third Level Link</a></li>
										<li><a href="#">Third Level Link</a></li>

									</ul>
								</li>
							</ul>
						</li>
						<li><a href="${pageContext.request.contextPath}/empty" class="waves-effect waves-dark"> <i
									class="fa fa-fw fa-file"></i>
								Empty Page
							</a></li> -->
							<li>
								<a href="#" class="waves-effect waves-dark">
									<i class="fa fa-sitemap"></i>
									공통관리
									<span class="fa arrow"></span>
								</a>
								<ul class="nav nav-second-level">
									<li>
										<a href="${pageContext.request.contextPath}/bomCheck" class="waves-effect waves-dark">
											BOM조회
										</a>
									</li>
									<!-- <li>
									<a href="${pageContext.request.contextPath}/ProcOrder" class="waves-effect waves-dark">
										생산지시관리
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/ProdProcManagement" class="waves-effect waves-dark">
										생산공정관리
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/ProcResult" class="waves-effect waves-dark">
										생산실적관리
									</a>
								</li> -->




























								</ul>
							</li>

							<li>
								<a href="#" class="waves-effect waves-dark">
									<i class="fa fa-sitemap"></i>
									영업관리
									<span class="fa arrow"></span>
								</a>
								<ul class="nav nav-second-level">
									<li>
										<a href="${pageContext.request.contextPath}/ordrMngntPage" class="waves-effect waves-dark">
											주문서관리
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/prodInputMngmnt" class="waves-effect waves-dark">
											제품입고관리
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/outputMngntPage" class="waves-effect waves-dark">
											제품출고관리
										</a>
									</li>












								</ul>
							</li>

							<li>
								<a href="#" class="waves-effect waves-dark">
									<i class="fa fa-sitemap"></i>
									생산관리
									<span class="fa arrow"></span>
								</a>
								<ul class="nav nav-second-level">
									<li>
										<a href="${pageContext.request.contextPath}/ProcManagement" class="waves-effect waves-dark">
											생산계획관리
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/ProcOrder" class="waves-effect waves-dark">
											생산지시관리
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/ProdProcManagement" class="waves-effect waves-dark">
											생산공정관리
										</a>
									</li>



















								</ul>
							</li>

							<li><a href="#" class="waves-effect waves-dark"> <i class="fa fa-sitemap"></i> 자재관리<span
										class="fa arrow"></span></a>
								<ul class="nav nav-second-level">
									<li>
										<a href="${pageContext.request.contextPath}/mtrlCnt" class="waves-effect waves-dark">
											자재재고조회
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/mtrlOrder" class="waves-effect waves-dark">
											자재발주관리
										</a>
									</li>
									<!-- <li>
									<a href="${pageContext.request.contextPath}/mtrlOrderList" class="waves-effect waves-dark">
										자재발주조회
									</a>
								</li> -->
									<!-- <li>
									<a href="${pageContext.request.contextPath}/mtrlInspCheck" class="waves-effect waves-dark">
										자재입고검사조회
									</a>
								</li> -->
									<!-- <li>
									<a href="${pageContext.request.contextPath}/mtrlInspManagement" class="waves-effect waves-dark">
										자재입고검사관리(품질로빼기)
									</a>
								</li> -->
									<li>
										<a href="${pageContext.request.contextPath}/mtrlInputManagement" class="waves-effect waves-dark">
											자재입고관리
										</a>
									</li>
									<!-- <li>
									<a href="${pageContext.request.contextPath}/mtrlOutputManagement" class="waves-effect waves-dark">
										자재출고관리
									</a>
								</li> -->


























								</ul>
							</li>

							<li>
								<a href="#" class="waves-effect waves-dark">
									<i class="fa fa-sitemap"></i>
									품질관리
									<span class="fa arrow"></span>
								</a>
								<ul class="nav nav-second-level">
									<li>
										<a href="${pageContext.request.contextPath}/QualityMat" class="waves-effect waves-dark">
											자재품질관리
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/QualityProduct" class="waves-effect waves-dark">
											제품품질관리
										</a>
									</li>
									<!-- <li>
									<a href="${pageContext.request.contextPath}/ProdProcManagement" class="waves-effect waves-dark">
										???빈칸
									</a>
								</li>-->
								</ul>
							</li>



















							<li>
								<a href="#" class="waves-effect waves-dark">
									<i class="fa fa-sitemap"></i>
									설비관리
									<span class="fa arrow"></span>
								</a>
								<ul class="nav nav-second-level">
									<li>
										<a href="${pageContext.request.contextPath}/facilityMain" class="waves-effect waves-dark">
											설비조회
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/facilityMaintenance" class="waves-effect waves-dark">
											설비정비
										</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/facilityOperation" class="waves-effect waves-dark">
											설비 비가동 관리
										</a>
									</li>
								</ul>
							</li>























						</ul>

						</ul>
					</div>

				</nav>
			</div>
		</header>