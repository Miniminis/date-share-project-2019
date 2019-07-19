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
					<form action="user/loginPro.jsp" method="post">
						<div>
							ID<input class="input_t" type="text" name="u_id" required>
						</div>
						<div>
							PW<input class="input_t" type="password" name="u_pw" required>
						</div>
						<div>
							<input class="input_b" type="submit" value="로그인">
							<a href="user/insertForm.jsp" class="input_ba">회원가입</a>
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