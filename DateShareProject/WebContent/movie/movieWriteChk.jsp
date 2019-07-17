<%@page import="dateShare.service.movie.WriteMovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");	
%>

<jsp:useBean id="movietext" class="dateShare.Model.Movie" scope="request"/>
<jsp:setProperty property="*" name="movietext"/>

<%
	WriteMovieService service = WriteMovieService.getInstance();
	int resultCnt = service.write(movietext);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE | MOVIE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
    <div id="main_wrap">
        <div id="header">
        	<%@ include file="../frame/my.jsp" %>
            <%@ include file="../frame/header.jsp" %>
        </div>
        <div id="nav">
            <%@ include file="../frame/nav.jsp" %>
        </div>
        <div id="content">
            <h1><%= resultCnt>0? "게시물이 성공적으로 출력되었습니다" : "게시물이 출력안됨" %></h1>      
            <a href="movieMain.jsp"><input type="button" value="다른 콘텐츠 보기"></a> 
        </div>
        <div id="footer">
            <%@ include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>