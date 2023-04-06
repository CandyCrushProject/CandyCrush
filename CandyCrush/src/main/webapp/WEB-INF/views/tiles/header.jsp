<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<header>
		<div id="wrapper">
			<nav class="navbar navbar-default top-navbar" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle waves-effect waves-dark" data-toggle="collapse"
						data-target=".sidebar-collapse">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand waves-effect waves-dark" href="index.html"><i
							class="large material-icons">track_changes</i> <strong>Candy Crush</strong></a>

					<div id="sideNav" href="">
						<i class="material-icons dp48">toc</i>
					</div>
				</div>

				<ul class="nav navbar-top-links navbar-right">
					<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown4"><i
								class="fa fa-envelope fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
					<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown3"><i
								class="fa fa-tasks fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
					<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown2"><i
								class="fa fa-bell fa-fw"></i> <i class="material-icons right">arrow_drop_down</i></a></li>
					<li><a class="dropdown-button waves-effect waves-dark" href="#!" data-activates="dropdown1"><i
								class="fa fa-user fa-fw"></i> <b>John Doe</b> <i class="material-icons right">arrow_drop_down</i></a>
					</li>
				</ul>
			</nav>
			<!-- Dropdown Structure -->
			<ul id="dropdown1" class="dropdown-content">
				<li><a href="#"><i class="fa fa-user fa-fw"></i> My Profile</a>
				</li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
				<li>
					<form action="logout" method="post">
						<i class="fa fa-sign-out fa-fw"></i> Logout
					</form>
				</li>
			</ul>
			<ul id="dropdown2" class="dropdown-content w250">
				<li>
					<div>
						<a href="#"> <i class="fa fa-comment fa-fw"></i> New Comment <span class="pull-right text-muted small">4
								min</span>
						</a>
					</div>
				</li>
				<li class="divider"></li>
				<li>
					<div>
						<a href="#"> <i class="fa fa-twitter fa-fw"></i> 3 New
							Followers <span class="pull-right text-muted small">12 min</span>
						</a>
					</div>
				</li>
				<li class="divider"></li>
				<li>
					<div>
						<a href="#"> <i class="fa fa-envelope fa-fw"></i> Message Sent
							<span class="pull-right text-muted small">4 min</span>
						</a>
					</div>
				</li>
				<li class="divider"></li>
				<li>
					<div>
						<a href="#"> <i class="fa fa-tasks fa-fw"></i> New Task <span class="pull-right text-muted small">4
								min</span>
						</a>
					</div>
				</li>
				<li class="divider"></li>
				<li>
					<div>
						<a href="#"> <i class="fa fa-upload fa-fw"></i> Server Rebooted
							<span class="pull-right text-muted small">4 min</span>
						</a>
					</div>
				</li>
				<li class="divider"></li>
				<li><a class="text-center" href="#"> <strong>See
							All Alerts</strong> <i class="fa fa-angle-right"></i>
					</a></li>
			</ul>
			<ul id="dropdown3" class="dropdown-content dropdown-tasks w250">
				<li><a href="#">
						<div>
							<p>
								<strong>Task 1</strong> <span class="pull-right text-muted">60%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (success)</span>
								</div>
							</div>
						</div>
					</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 2</strong> <span class="pull-right text-muted">28%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0"
									aria-valuemax="100" style="width: 28%">
									<span class="sr-only">28% Complete</span>
								</div>
							</div>
						</div>
					</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 3</strong> <span class="pull-right text-muted">60%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 60%">
									<span class="sr-only">60% Complete (warning)</span>
								</div>
							</div>
						</div>
					</a></li>
				<li class="divider"></li>
				<li><a href="#">
						<div>
							<p>
								<strong>Task 4</strong> <span class="pull-right text-muted">85%
									Complete</span>
							</p>
							<div class="progress progress-striped active">
								<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="85" aria-valuemin="0"
									aria-valuemax="100" style="width: 85%">
									<span class="sr-only">85% Complete (danger)</span>
								</div>
							</div>
						</div>
					</a></li>
				<li class="divider"></li>
				<li>
			</ul>
			<!-- /. NAV SIDE  -->
			<nav class="navbar-default navbar-side" role="navigation">
				<div class="sidebar-collapse">
					<ul class="nav" id="main-menu">

						<li><a href="${pageContext.request.contextPath}/dashboard" class="waves-effect waves-dark"><i
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
							</a></li>
						<li>
							<a href="#" class="waves-effect waves-dark">
								<i class="fa fa-sitemap"></i>
								공통관리
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

						<li>
							<a href="#" class="waves-effect waves-dark">
								<i class="fa fa-sitemap"></i>
								영업관리
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a href="${pageContext.request.contextPath}/OrdrShtList" class="waves-effect waves-dark">
										주문서관리
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/" class="waves-effect waves-dark">
										???관리
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/" class="waves-effect waves-dark">
										???관리
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
									<a href="${pageContext.request.contextPath}/mtrlOrder" class="waves-effect waves-dark">
										자재발주관리
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/mtrlOrderList" class="waves-effect waves-dark">
										자재발주조회
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/mtrlInspCheck" class="waves-effect waves-dark">
										자재입고검사조회<!-- <span class="fa arrow"></span> -->
									</a>
									<!-- <ul class="nav nav-third-level">
										<li><a href="#">Third Level Link</a></li>
										<li><a href="#">Third Level Link</a></li>
										<li><a href="#">Third Level Link</a></li>
									</ul> -->
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/mtrlInspManagement" class="waves-effect waves-dark">
										자재입고검사관리(품질로빼기)
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/mtrlInputManagement" class="waves-effect waves-dark">
										자재입고관리
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/mtrlOutputManagement" class="waves-effect waves-dark">
										자재출고관리
									</a>
								</li>


























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



















						<li>
							<a href="#" class="waves-effect waves-dark">
								<i class="fa fa-sitemap"></i>
								설비관리
								<span class="fa arrow"></span>
							</a>
							<ul class="nav nav-second-level">
								<li>
									<a href="${pageContext.request.contextPath}/ProcManagement" class="waves-effect waves-dark">
										설비관리
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/ProcOrder" class="waves-effect waves-dark">
										설비정비
									</a>
								</li>
								<li>
									<a href="${pageContext.request.contextPath}/ProdProcManagement" class="waves-effect waves-dark">
										설비뭐시깽이
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