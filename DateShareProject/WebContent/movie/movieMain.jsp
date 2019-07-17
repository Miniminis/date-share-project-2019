<%@page import="dateShare.Model.Movie"%>
<%@page import="dateShare.Model.MovieListView"%>
<%@page import="dateShare.service.movie.GetArticleListService"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//핵심처리할 서비스 객체 
	GetArticleListService service = GetArticleListService.getInstance();
	
	//응답 데이터의 결과 
	MovieListView viewData = service.getArticleList(); 	
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
            <h1>movie main page</h1>      
            <div id="contentList" >      
            	<%
            		if(viewData.isEmpty()) {
            			out.println("등록된 메시지가 없습니다.");
            			
            		} else {
            			for(Movie movie : viewData.getMovieList()) {            			
            			%>          				
            				<div>
            					<h1>게시글리스트</h1>
	            				<a href="movieContentView.jsp?articleNum=<%= movie.getM_num() %>">	            				
	            					<div>사진<%= movie.getM_path() %></div>
	            					<div>
	            						제목 <%= movie.getM_title() %><br>
	            						작성일시 <%= movie.getM_writedate() %>
	            						조회수 <%= movie.getM_hits() %>
	            						좋아요 <%= movie.getM_like() %>
	            					</div>
	            				</a>
            				</div>
            			<%
            			}
            		}
            	%>
            </div>

            <a href="movieWrite.jsp"><input type="button" value="콘텐츠 등록하기"></a> 
        </div>
        <div id="footer">
            <%@ include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>