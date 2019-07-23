<%@page import="dateShare.service.activity.NotMatchUserException"%>
<%@page import="dateShare.service.activity.ActivityNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dateShare.service.activity.DeleteActivityService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session = request.getSession(false);
	LoginInfo dongjun = (LoginInfo) session.getAttribute("userInfo");

	int u_num = dongjun.getU_num();
	int a_num = Integer.parseInt(request.getParameter("a_num"));
	/* 	int u_num = Integer.parseInt(request.getParameter("u_num")); */

	// 서비스 객체 생성 
	DeleteActivityService service = DeleteActivityService.getInstance();

	int resultCnt = 0; // 몇개행 되었나 체크하려고
	boolean chk = false; // 오류발생했는지 확인하려고 정상처리 되었나 오류발생했나
	String msg = ""; // 예외발생시 메시지 담아서 처리하고싶음.

	try {
		resultCnt = service.deleteMessage(a_num, u_num);
		chk = true; // 정상처리되었으면
	} catch (SQLException e) {
		msg = e.getMessage();
	} catch (ActivityNotFoundException e) {
		msg = e.getMessage();
	} catch (NotMatchUserException e) {
		msg = e.getMessage();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
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
				<h1>


					
					
					<%
						if (chk) {
					%>
					
					<script>
						alert('삭제되었습니다.');
						location.href = "activityList.jsp";
					</script>			

					<%
						} else {
					%>
					<script>
						alert('작성자가 아닙니다. \n삭제하실 수 없습니다.');
						location.href = "activityList.jsp";
					</script>

					<%
						}
					%>
				</h1>
				<a href="activityList.jsp">리스트</a>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>