<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script src="http://code.jquery.com/jquery-latest.js"></script> 
 

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

	<style>
		* {
			padding: 0;
			margin: 0;
		}

		html,
		body {
			height: 100%;
			background: #ffffff;
		}

		#container {
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
			height: 100%;
		}

		#loginBox {
			width: 300px;
			text-align: center;
			background-color: #ffffff;
		}

		.input-form-box {
			border: 0px solid #ff0000;
			display: flex;
			margin-bottom: 5px;
		}

		.input-form-box>span {
			display: block;
			text-align: left;
			padding-top: 5px;
			min-width: 65px;
		}

		.button-login-box {
			margin: 10px 0;
		}

		#loginBoxTitle {
			color: #000000;
			font-weight: bold;
			font-size: 32px;
			text-transform: uppercase;
			padding: 5px;
			margin-bottom: 20px;
			background: linear-gradient(to right, #270a09, #8ca6ce);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
		}

		#inputBox {
			margin: 10px;
		}

		#inputBox button {
			padding: 3px 5px;
		}
	</style>
	<main>
		<!--  html 전체 영역을 지정하는 container -->
		<div id="container" class="text-center">
			<!--  login 폼 영역을 : loginBox -->
			<div id="loginBox">
				<form action="${pageContext.request.contextPath}/login" id="loginForm" name="loginForm" method="post">
					<!-- 로그인 페이지 타이틀 -->
					<div id="loginBoxTitle">CandyCrush Login</div>
					<!-- 아이디, 비번, 버튼 박스 -->
					<div id="inputBox">
						<div class="input-form-box">
							<span>아이디 </span><input type="text" id="username" name="username" class="form-control">
						</div>
						<div class="input-form-box">
							<span>비밀번호 </span><input type="password" id="password" name="password" class="form-control">
						</div>
						<div class="button-login-box">
							<button type="submit" id="loginBtn" class="btn btn-primary btn-xs" style="width: 100%">로그인</button>
						</div>
					</div>
				</form>

			</div>
		</div>


	</main>
<!-- 	<script> -->
// 		$(function () {

// 			$('#loginBtn').on('click', function () {
// 				let user = $('#username').val();
// 				let pass = $('#password').val();
// 				let loginInfo = {
// 					user: user,
// 					pass: pass
// 				};
// 				$.ajax({
// 					url: 'mainHome',
// 					method: "POST",
// 					contentType: 'application/json',
// 					data: JSON.stringify(loginInfo),
// 					dataType: 'json',
// 					success: function (data) {
// 						loginForm.submit();
// 						console.log(data)
// 					}, error: function (err) {
// 					}
// 				});
// 			});
// 		})
<!-- 	</script> -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>