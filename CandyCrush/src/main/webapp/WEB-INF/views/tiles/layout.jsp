<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
			<!DOCTYPE html>

			<html xmlns="http://www.w3.org/1999/xhtml">

			<head>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<title>CandyCrushMES</title>
				<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
				<link rel="stylesheet" href="assets/materialize/css/materialize.min.css" media="screen,projection" />
				<!-- Bootstrap Styles-->
				<link href="assets/css/bootstrap.css" rel="stylesheet" />
				<!-- FontAwesome Styles-->
				<link href="assets/css/font-awesome.css" rel="stylesheet" />
				<!-- Morris Chart Styles-->
				<link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
				<!-- Custom Styles-->
				<link href="assets/css/custom-styles.css" rel="stylesheet" />
				<!-- CandyTab 우리 테이블 css -->
				<link href="assets/css/candyTab.css" rel="stylesheet" />
				<!-- Google Fonts-->
				<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
				<link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">
				<style>
					/*input checkbox css*/
					input[type="checkbox"]:not(:checked), 
					input[type="checkbox"]:checked {
						position: relative !important;
						left: 0 !important;
						opacity: 1 !important;
					}
				</style>
			</head>

			<body>

				<tiles:insertAttribute name="header" />
				<tiles:insertAttribute name="content" />

				<!-- jQuery Js -->
				<script src="assets/js/jquery-1.10.2.js"></script>

				<!-- Bootstrap Js -->
				<script src="assets/js/bootstrap.min.js"></script>

				<script src="assets/materialize/js/materialize.min.js"></script>

				<!-- Metis Menu Js -->
				<script src="assets/js/jquery.metisMenu.js"></script>
				<!-- Morris Chart Js -->
				<script src="assets/js/morris/raphael-2.1.0.min.js"></script>
				<script src="assets/js/morris/morris.js"></script>


				<script src="assets/js/easypiechart.js"></script>
				<script src="assets/js/easypiechart-data.js"></script>

				<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>

				<!-- Custom Js -->
				<script src="assets/js/custom-scripts.js"></script>
			</body>

			</html>