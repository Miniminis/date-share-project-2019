<%@page import="dateShare.Model.DateUser"%>
<%@page import="dateShare.service.user.ReadMemberService"%>
<%@page import="dateShare.Model.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="dateShare.Model.DateUser"/>
<jsp:setProperty property="*" name="user"/>    
<%
   session = request.getSession(false);
	LoginInfo User = (LoginInfo)session.getAttribute("userInfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
</script>
</head>
<body>

</body>
</html>