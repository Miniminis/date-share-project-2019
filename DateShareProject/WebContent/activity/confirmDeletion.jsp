<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
	<% int u_num = (int)session.getAttribute("u_num");%>
<body>
	<div id="wrap">
		<div id="main_wrap">
			<div id="header">
				<%@include file="../frame/my.jsp"%>
				<%@include file="../frame/header.jsp"%>
			</div>
			<div id="nav">
				<%@include file="../frame/nav.jsp"%>
			</div>
			<div id="content">
				<h3>삭제 확인</h3>
				<form action="deleteActivity.jsp" method="post">
					게시글을 삭제하시겠습니까?<br>
					<input type="hidden" name="a_num" value="<%= request.getParameter("a_num")%>">
					<!-- 현재 세션에 로그인되어있는 사용자, 나중에 hidden으로 바꾸자 -->
					<input type="text" name="u_num" value="<%= u_num%>">
					<input type="submit" value="네">
				</form>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>