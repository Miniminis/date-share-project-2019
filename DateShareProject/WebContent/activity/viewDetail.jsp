<%@page import="dateShare.Model.Activity"%>
<%@page import="dateShare.service.activity.ViewActivityDetailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int a_num= Integer.parseInt(request.getParameter("a_num"));
	ViewActivityDetailService service = ViewActivityDetailService.getInstance();
	Activity activity = service.viewDetail(a_num);
%>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<!-- 빈으로 가져오기 -->
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
				<h3>
					상세보기 페이지<br>
					<br>
					글번호 : <%= activity.getA_num()%> <br>
					작성자번호 : <%= activity.getU_num()%> <br>
					작성일 : <%= activity.getA_writedate()%><br>
					조회수 : <%= activity.getA_hits()%> <br>
<%-- 					좋아요 : <%= activity.getA_like()%> <br> --%>
					글제목 : <%= activity.getA_title()%> <br>
					글내용 : <%= activity.getA_content()%> <br>
					평점 : <%= activity.getA_star()%> <br>
					사진경로 : <%= activity.getA_path()%> <br>
					<br>
					<a href="confirmDeletion.jsp?a_num=<%=activity.getA_num()%>">삭제하기 </a>
					<a href="confirmEdit.jsp?a_num=<%=activity.getA_num()%>">수정하기 </a>	
				</h3>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>