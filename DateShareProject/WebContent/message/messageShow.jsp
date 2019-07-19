<%@page import="dateShare.Model.Message"%>
<%@page import="dateShare.service.message.ShowMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("m_num");
	
	int m_num = Integer.parseInt(num);

	
	ShowMessageService mService = ShowMessageService.getInstance();
	
	Message m = mService.show(m_num);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE : MESSAGE</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/content.css" rel="stylesheet" type="text/css">
<style>
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="main_wrap">
			<div id="header">
				<%@include file="../frame/my.jsp"%>
				<%@include file="../frame/header.jsp"%>
			</div>
			<div id="nav">
				<%@include file="../frame/nav.jsp"%>
			</div>
			<div id="content">
				<div id="content_title">
					<h2>MESSAGE SHOW</h2>
				</div>
				<div id="m_show">
					<div><%= m.getM_date() %></div>
					<div>
						보낸사람 <span><%= m.getU_num() %></span>
					</div>
					<div>
						제목 <span><%= m.getM_title() %></span>
					</div>
					<div>
						내용
						<p><%= m.getM_content() %></p>
					</div>
				</div>
				<a class="m_btn2" href="messageList.jsp">MESSAGE LIST</a> <a
					class="m_btn2" href="messageSend.jsp">MESSAGE SEND</a>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>