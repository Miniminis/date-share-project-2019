<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.service.activity.LikeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session = request.getSession(false);
	LoginInfo currentUser = (LoginInfo) session.getAttribute("userInfo");
	
	int a_num = Integer.parseInt(request.getParameter("a_num"));
	LikeService service = LikeService.getInstance();
	int likeCount = service.changeLike(currentUser.getU_num(), a_num);
	%>

<%= likeCount%>