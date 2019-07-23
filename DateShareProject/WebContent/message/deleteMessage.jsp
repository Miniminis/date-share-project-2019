<%@page import="dateShare.exception.message.MessageNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dateShare.service.message.DeleteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>
<%
	String num = request.getParameter("m_num");

	if (num != null) {
		int m_num = Integer.parseInt(num);

		//성공여부 cnt
		int resultCnt = 0;
		//성공여부
		boolean chk = false;
		//예외가 발생했을때 띄울 메세지
		String msg = "";
		
		//서비스 객체 생성
		DeleteMessageService service = DeleteMessageService.getInstance();
		
		try {
			resultCnt = service.deleteMessage(m_num);
			chk=true;
			out.print(m_num);
		} catch (SQLException e) {
			msg = e.getMessage();
		} catch (MessageNotFoundException e) {
			msg = e.getMessage();
		}
	}
%>


