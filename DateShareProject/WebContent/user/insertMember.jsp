<%@page import="dateShare.service.user.InsertMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user" class="dateShare.Model.DateUser"/>
<jsp:setProperty property="*" name="user"/>
<%
	InsertMemberService service = InsertMemberService.getInstance();
	service.insert(user);

	response.sendRedirect("../index.jsp");
%>