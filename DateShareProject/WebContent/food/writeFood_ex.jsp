<%@ page import="dateShare.service.food.WriteFoodService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="food" class="dateShare.Model.Food" />
<jsp:setProperty property="*" name="food" />
<%
	WriteFoodService service = WriteFoodService.getInstance();
	int cnt = service.write(food);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<%= cnt > 0 ? "게시글을 작성하였습니다" : "게시글 작성 실패"%>
	</h1>
	<a href="foodList.jsp">목록보기</a>
</body>
</html>