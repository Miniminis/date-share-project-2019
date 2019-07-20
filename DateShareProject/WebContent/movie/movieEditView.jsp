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
	
	//수정 폼에 기존의 데이터를 넣어주기 위해 getArticle();
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
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script></script>
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
        <h1>영화 글 수정 페이지</h1>
            <form action="movieEditChk.jsp" method="post" enctype="multipart/form-data">
            	<div id="container" class="center">
	            	<div>
	            		<h1><input type="text" id="mTitle" name="m_title" class="transparent mr-30" value="<%= movieContent.getM_title() %>"></h1>
	            	</div>
	            	<div>
	            		<input type="file" id="mFile" name="m_path" value="<%= movieContent.getM_path() %>">
	            	</div>
	            	<div>
	            		<input type="number" id="mStar" name="m_star" value="<%= movieContent.getM_star() %>">
	            	</div>
	            	<div class="mr-30">
	            		<textarea name="m_content" class="transparent" rows="50" cols="100" value="<%= movieContent.getM_content() %>"></textarea>
	            	</div>
	            	<input type="hidden" name="articleNum" value="<%= movieContent.getM_num() %>">
	            	<input type="submit" value="글 수정하기">
            	</div>
            </form> 
        </div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>