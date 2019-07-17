<%@page import="dateShare.Model.Movie"%>
<%@page import="dateShare.service.movie.GetArticleListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String artnum = request.getParameter("articleNum");
 	
	int articleNum = 1; 
 	
	if(artnum != null) {
		articleNum = Integer.parseInt(artnum);
	}
	
	GetArticleListService service = GetArticleListService.getInstance();
	Movie movieContent = service.getArticle(articleNum);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
	#container {
		margin: 20px auto;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
    <div id="main_wrap">
        <div id="header">
        	<%@include file="../frame/my.jsp" %>
            <%@include file="../frame/header.jsp" %>
        </div>
        <div id="nav">
            <%@include file="../frame/nav.jsp" %>
        </div>
        <div id="content">
            <div id="container">
            	<h2>파일경로 <%= movieContent.getM_path() %></h2>
            	<h1>제목 <%= movieContent.getM_title() %></h1>
            	<h3>작성자 <%= movieContent.getU_name() %> <br>
            		작성일시<%= movieContent.getM_writedate() %> <br> 
            		좋아요 <%= movieContent.getM_like() %> <br>
            		조회수<%= movieContent.getM_hits() %></h3>
            	<p>내용 <%= movieContent.getM_content() %></p>
            	<a href="confirmDelete.jsp?articleNum=<%= movieContent.getM_num() %>">
            		<input type="button" value="삭제하기">
            	</a>
            	<p>댓글</p>
            </div>
        </div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>