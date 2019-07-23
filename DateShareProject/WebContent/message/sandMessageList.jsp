<%@page import="java.awt.print.Printable"%>
<%@page import="dateShare.service.message.DeleteMessageService"%>
<%@page import="dateShare.Model.Message"%>
<%@page import="dateShare.Model.MessageListView"%>
<%@page import="dateShare.service.message.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageNumberstr = request.getParameter("page");

	//페이지 숫자
	int pageNumber = 1;

	if (pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}

	//핵심 처리할 서비스 객체
	GetMessageListService service = GetMessageListService.getInstance();
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
<script></script>
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
					<h2>SAND MESSAGE LIST</h2>
				</div>
				<p id="m">
					<a class="m_btn" href="messageList.jsp">받은메세지함</a>
					<a class="m_btn" href="messageSend.jsp">쪽지보내기</a>
				</p>
				<div id="list_wrap">
					<table id="list_table">
						<tr>
							<td>No</td>
							<td>제목</td>
							<td>받는사람</td>
							<td>보낸날짜</td>
							<td></td>
						</tr>
						<%
							//응답 데이터의 결과
							MessageListView viewData = service.getSendMessageList(pageNumber, user.getU_num());
						
							if (viewData.isEmpty()) {
						%>
						<tr>
							<td colspan="5">보낸 메세지가 없습니다.</td>
						</tr>

						<%
							} else {
								for (Message message : viewData.getMessageList()) {
						%>
						<tr>
							<td><%=message.getRownum()%></td>
							<td><a href="messageShow.jsp?m_num=<%= message.getM_num() %>"><%=message.getM_title()%></a></td>
							<td><%=message.getM_to()%></td>
							<td><%=message.getM_writedate()%></td>
							<td></td>
						</tr>
						<%
						}
					}
					%>
					</table>
					<%
						//[1],[2],[3] 페이지 번호
						for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
					%>
					<a href="messageList.jsp?page=<%=i%>"> [ <%=i%> ]</a>
					<%
						}
				%>
				</div>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>