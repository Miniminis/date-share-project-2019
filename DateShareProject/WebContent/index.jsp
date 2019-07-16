<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>
</head>
<link href="css/index.css" rel="stylesheet" type="text/css">
<style></style>
<body>
	<div id="wrap">
		<div id="main_wrap">
			<div id="header">
				<%@include file="frame/header.jsp" %>
			</div>
			<div id="content">
				<div id="login_form_wrap">
					<h1>LOGIN</h1>
					<form>
						<div>
							ID<input class="input_t" type="text">
						</div>
						<div>
							PW<input class="input_t" type="password">
						</div>
						<div>
							<input class="input_b" type="submit" value="로그인">
							<input class="input_b" type="submit" value="회원가입">
						</div>
					</form>
				</div>
			</div>
			<div id="footer">
				<%@include file="frame/footer.jsp" %>
			</div>
		</div>
	</div>
</body>
</html>