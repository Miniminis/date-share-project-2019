<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
    <div id="main_wrap">
        <div id="header">
        	<%@include file="../frame/my.jsp" %>
            <%@include file="../frame/header.jsp" %>
        </div>
        <div id="nav">
            <%@include file="../frame/nav.jsp" %>
        </div>
        <div id="content">
            
            
		<h3>회원탈퇴 페이지</h3>
		<hr>
		<form action="deleteMember.jsp" method="post">
		<table>
			<tr>
			<td>아이디</td>
			<td><input type="text" name="u_id"></td>   <!-- value값 넣기 -->
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="u_pw"></td>
			</tr>
		</table><br>
		
		<input type="submit" value="회원탈퇴">
		<input type="button" value="취소" onclick="location.href='../main.jsp'">
		</form>
            
        </div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>














