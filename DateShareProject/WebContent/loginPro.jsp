<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.service.user.LoginService"%>
<%@page import="dateShare.Model.DateUser"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");

	LoginService service = LoginService.getInstance();

	DateUser dUser = service.login(u_id);

	if (dUser == null) {
		out.print("<script> alert(\'아이디랑 패스워드를 확인하세요.\'); history.go(-1); </script>");
	} else if (dUser.getU_id() != null && dUser.getU_id().equals(u_id) && dUser.getU_pw() != null
			&& dUser.getU_pw().equals(u_pw)) {

		session.setAttribute("userInfo", dUser.toLoginInfo());
		response.sendRedirect("main.jsp");

	} else {
		out.print("<script> alert(\'아이디랑 패스워드를 확인하세요.\'); history.go(-1); </script>");
	}
%>
