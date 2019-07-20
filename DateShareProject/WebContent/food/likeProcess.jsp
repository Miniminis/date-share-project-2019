<%@page import="dateShare.service.food.LikeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int u_num = (int)session.getAttribute("u_num");
	int f_num = Integer.parseInt(request.getParameter("f_num")); 
	LikeService service = LikeService.getInstance();
	int cnt = service.changeLike(u_num, f_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	이건 라이크 프로세스 페이지
<% response.sendRedirect("viewDetail.jsp?f_num="+f_num);%>	

</body>

</html>