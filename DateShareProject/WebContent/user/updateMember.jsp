<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.service.user.UpdateMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="user" class="dateShare.Model.DateUser"/>
<jsp:setProperty property="*" name="user"/>
<%
	UpdateMemberService service = UpdateMemberService.getInstance();
	int cnt = service.update(user);
	
	session.setAttribute("userInfo", user.toLoginInfo());
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
	
	
	alert("회원정보가 수정되었습니다.")
	location.href="../main.jsp";
	</script>
	
</body>
</html>