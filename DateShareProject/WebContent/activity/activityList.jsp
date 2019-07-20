<%@page import="java.util.List"%>
<%@page import="dateShare.Model.Activity"%>
<%@page import="dateShare.Dao.ActivityListView"%>
<%@page import="dateShare.service.activity.GetActivityListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String pageNumberStr = request.getParameter("page");

	int pageNumber = 1;

	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	// 핵심처리할 서비스 객체
	GetActivityListService service = GetActivityListService.getInstance();

	// 응답 데이터의 결과 
	ActivityListView viewData = service.getActivityListView(pageNumber);

	session.setAttribute("u_num", 2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
.pic {
	width: 250px;
}
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
				<h3>게시판</h3>
				<a href="writeForm.jsp">글쓰기</a>
				<hr>

				<%
					if (viewData.isEmpty()) {
				%>
				<h3>등록된 메시지가 없습니다!</h3>

				<%
					} else {

						for (Activity activity : viewData.getActivityList()) {
				%>
				<div>
					조회수 :
					<%=activity.getA_hits()%><br> 
					작성일시 :
					<%=activity.getA_writedate()%><br> 
					경로 :
					<%-- <image xlink:href="<%= activity.getA_path() %>" width="100%" height="225"> --%>
					<%=activity.getA_path()%><br> 
					<img src="<%=activity.getA_path()%>" class="pic"><br> 
					<a href="viewDetail.jsp?a_num=<%=activity.getA_num()%>"> <br>
					제목 : <%=activity.getA_title()%><br>
					별점 :<%=activity.getA_star()%><br>

					<%-- 좋아요 : <%=activity.getA_like()%><br> --%>

				</div>
				<br>

				<%
					}
					}

					// [1][2][3]
					for (int i = 1; i < viewData.getPageTotalCount(); i++) {
				%>
				<a href="activityList.jsp?page=<%=i%>">[<%=i%>]
				</a>
				<%
					}
				%>

			</div>
			<div id="footer">
				<%@ include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>