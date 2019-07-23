
<%@page import="dateShare.Dao.DateUserDao"%>
<%@page import="dateShare.service.user.DeleteMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>
<jsp:useBean id="user" class="dateShare.Model.DateUser"/>
<jsp:setProperty property="*" name="user"/>
<%
	DeleteMemberService service = DeleteMemberService.getInstance();
	int cnt = service.delete(user);
	
	session.invalidate();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>

	<script>	
	alert("탈퇴가 완료되었습니다.\n안녕히가세요")
	location.href="../index.jsp";   //로그인창으로 이동 
	</script>
	
</body>
</html>