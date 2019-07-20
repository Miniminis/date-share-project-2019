<%@page import="dateShare.service.user.IdCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
	String u_id = request.getParameter("u_id");
	
	if(u_id != null && !u_id.equals("")) {
		IdCheckService service = IdCheckService.getInstance();

		int check = service.idCheck(u_id);

		if (check == 1) {
			out.print("N");
			
		} else if(check == 0) {
			out.print("Y");
		}
	}else {
		out.print("필수");
	}
	
%>