<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<main>
	<!--/. NAV TOP  -->
	<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">

				<li><a href="${pageContext.request.contextPath}/" class="waves-effect waves-dark"><i
						class="fa fa-dashboard"></i> Dashboard</a></li>
				<li><a href="${pageContext.request.contextPath}/ulElements" class="waves-effect waves-dark"><i
						class="fa fa-desktop"></i> UI Elements</a></li>
				<li><a href="${pageContext.request.contextPath}/chart"
					class="active-menu waves-effect waves-dark"><i
						class="fa fa-bar-chart-o"></i> Charts</a></li>
				<li><a href="${pageContext.request.contextPath}/tabpnel" class="waves-effect waves-dark"><i
						class="fa fa-qrcode"></i> Tabs & Panels</a></li>

				<li><a href="${pageContext.request.contextPath}/" class="waves-effect waves-dark"><i
						class="fa fa-table"></i> Responsive Tables</a></li>
				<li><a href="${pageContext.request.contextPath}/" class="waves-effect waves-dark"><i
						class="fa fa-edit"></i> Forms </a></li>


				<li><a href="#" class="waves-effect waves-dark"><i
						class="fa fa-sitemap"></i> Multi-Level Dropdown<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">Second Level Link</a></li>
						<li><a href="#">Second Level Link</a></li>
						<li><a href="#" class="waves-effect waves-dark">Second
								Level Link<span class="fa arrow"></span>
						</a>
							<ul class="nav nav-third-level">
								<li><a href="#">Third Level Link</a></li>
								<li><a href="#">Third Level Link</a></li>
								<li><a href="#">Third Level Link</a></li>

							</ul></li>
					</ul></li>
				<li><a href="empty.html" class="waves-effect waves-dark"><i
						class="fa fa-fw fa-file"></i> Empty Page</a></li>
			</ul>

		</div>

	</nav>
	<!-- /. NAV SIDE  -->
	<div id="page-wrapper">
		<div class="header">
			<h1 class="page-header">Charts</h1>
			<ol class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Charts</a></li>
				<li class="active">Data</li>
			</ol>

		</div>
		<div id="page-inner">

			<div class="row">


				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="card">
						<div class="card-action">Bar Chart</div>
						<div class="card-content">
							<div id="morris-bar-chart"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="card">
						<div class="card-action">Area Chart</div>
						<div class="card-content">
							<div id="morris-area-chart"></div>
						</div>
					</div>
				</div>

			</div>
			<!-- /. ROW  -->
			<div class="row">

				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="card">
						<div class="card-action">Line Chart</div>
						<div class="card-content">
							<div id="morris-line-chart"></div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-sm-12 col-xs-12">
					<div class="card">
						<div class="card-action">Donut Chart</div>
						<div class="card-content">
							<div id="morris-donut-chart"></div>
						</div>
					</div>
				</div>

			</div>
			<!-- /. ROW  -->
			<footer>
				<p>
					Shared by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">BootstrapThemes</a>
				</p>
			</footer>
		</div>
		<!-- /. PAGE INNER  -->
	</div>
</main>