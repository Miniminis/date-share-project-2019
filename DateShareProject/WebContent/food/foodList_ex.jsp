<%@page import="dateShare.Model.Food"%>
<%@page import="dateShare.Dao.FoodListView"%>
<%@page import="dateShare.service.food.GetFoodListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String pageNumberStr = request.getParameter("page");

	int pageNumber = 1; // 논리적으로 0 페이지는 없으니까 1로 초기화함 ! 없을땐 1페이지 디폴트

	// 다른 문자열이 들어오면 익셉션 해줘야하는데 일단은 정상적으로 들어온다고 보구
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	// 핵심처리할 서비스 객체
	GetFoodListService service = GetFoodListService.getInstance();

	// 응답 데이터의 결과 
	FoodListView viewData = service.getFoodListView(pageNumber);
	
%>
<!-- 현재 로그인된 사용자, 임시로 넣어놨다 -->
	<% session.setAttribute("u_num",5);%>  
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
	.pic{
		width:250px;
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
				<h3>맛집 게시판</h3>
				<a href="writeForm.jsp">글쓰기</a>
				<hr>

				<%
					if (viewData.isEmpty()) {
				%>
				<h3>등록된 메시지가 없습니다!</h3>

				<%
					} else {

						for (Food food : viewData.getFoodList()) {
				%>
				<div>
					조회수 : <%=food.getF_hits()%><br>
					작성일시 : <%=food.getF_writedate()%><br> 
					경로 : <%=food.getF_path()%><br> 
					<img src="<%= food.getF_path()%>" class="pic"><br>
					제목 : 
					<a href="viewDetail.jsp?f_num=<%=food.getF_num()%>">
					<%=food.getF_title()%><br>
					</a>
					별점 : <%=food.getF_star()%><br> 
					<%-- 좋아요 : <%=food.getF_like()%><br> --%>
					 
				</div>
				<br>

				<%
					}
					}

					// [1][2][3]
					for (int i = 1; i < viewData.getPageTotalCount(); i++) {
				%>
				<a href="foodList.jsp?page=<%=i%>">[<%=i%>]</a>
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