<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.service.food.LikeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session = request.getSession(false);
	LoginInfo currentUser = (LoginInfo) session.getAttribute("userInfo");

	int f_num = Integer.parseInt(request.getParameter("f_num"));
	LikeService service = LikeService.getInstance();
	int likeCount = service.changeLike(currentUser.getU_num(), f_num);

%>

<%= likeCount%>
