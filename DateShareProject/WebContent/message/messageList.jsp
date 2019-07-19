<%@page import="java.awt.print.Printable"%>
<%@page import="dateShare.service.message.DeleteMessageService"%>
<%@page import="dateShare.Model.Message"%>
<%@page import="dateShare.Model.MessageListView"%>
<%@page import="dateShare.service.message.GetMessageListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageNumberstr = request.getParameter("page");

	//페이지 숫자
	int pageNumber = 1;

	if (pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}

	//핵심 처리할 서비스 객체
	GetMessageListService get_service = GetMessageListService.getInstance();

	//응답 데이터의 결과
	MessageListView viewData = get_service.getMessageList(pageNumber);
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
<script>
function deleteM(id) {
	
	if(confirm("정말로 삭제하시겠습니까?")) {
		
		$.ajax({
            url: 'deleteMessage.jsp',
            type: 'GET',
            data: {
            	m_num: id
            },
            success: function (data) {
            	alert(data+"번의 메세지가 삭제되었습니다.");
            	location.reload();
            }
        });
	}
	
}

</script>
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
					<h2>MESSAGE LIST</h2>
				</div>
				<p id="m">
					<a href="messageSend.jsp">쪽지보내기</a>
				</p>
				<div id="list_wrap">
					<table id="list_table">
						<tr>
							<td>No</td>
							<td>제목</td>
							<td>보낸사람</td>
							<td>날짜</td>
							<td></td>
						</tr>
						<%
							if (viewData.isEmpty()) {
						%>
						<tr>
							<td colspan="5">등록된 메세지가 없습니다.</td>
						</tr>

						<%
							} else {
								for (Message message : viewData.getMessageList()) {
						%>
						<tr>
							<td><%=message.getM_num()%></td>
							<td><a href="messageShow.jsp?m_num=<%= message.getM_num() %>"><%=message.getM_title()%></a></td>
							<td><%=message.getU_num()%></td>
							<td><%=message.getM_writedate()%></td>
							<td><a onclick="deleteM(<%= message.getM_num() %>)">삭제하기</a></td>
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