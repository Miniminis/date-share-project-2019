<%@page import="dateShare.service.movie.GetLikeService"%>
<%@page import="java.util.List"%>
<%@page import="dateShare.Model.Movie"%>
<%@page import="dateShare.service.movie.GetArticleListService"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//핵심처리할 서비스 객체 
	GetArticleListService service = GetArticleListService.getInstance();
	
	//응답 데이터의 결과 
	List<Movie> movieList = service.getArticleList();
	
	
	//좋아요 개수
	int likeOriginCnt = 0;
	
	GetLikeService likeservice = GetLikeService.getInstance(); 
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE | MOVIE</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/movie.css" rel="stylesheet" type="text/css">

<script src="https://kit.fontawesome.com/744ccfa256.js"></script>
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
		
        <div id="content" class ="album py-5">
        
            <div id="contentList" class="container">  
            	<div class="row">   
            	<%
            		if(movieList.isEmpty()) {
            			%>
            			<h4 class="center">등록된 게시글이 없습니다.</h4>
            			<%           			
            		} else {
            			for(Movie movie : movieList) {            			
            			%>                				
            				<div class="col-md-4">
            				<a href="movieContentView.jsp?articleNum=<%= movie.getM_num() %>"> 
            				<div class="card mb-4 shadow-sm">
	            				<svg class="bd-placeholder-img card-img-top" width="100%" height="200" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
	            					<image xlink:href="<%= movie.getM_path() %>" width="100%" height="225">
	            				</svg> 
	            				<div class="card-body">
	            				 <p class="card-text">
	            				 	제목 <%= movie.getM_title() %><br>
	            				 	작성자 <%= movie.getU_name() %><br>
	           						조회수 <%= movie.getM_hits() %> 
	           						좋아요 <i class="fas fa-heart"></i>
	           						<%= likeOriginCnt = likeservice.getLikeOrigin(movie.getM_num()) %>	           	
	            				  </p> 
	            				 <div class="d-flex justify-content-between align-items-center">
	            				 	<div>
	            				 		<i class="fas fa-star"></i>
	            				 		<%= movie.getM_star() %>
	            				 	</div> 	
					                <small class="text-muted"><%= movie.getM_writedate() %></small>
					            </div>        				            			
		            			</div>
            				</div>
            				</a>
            				</div>
            				
            			<%
            			}
            		}
            	%>
            	</div>
            	
            	<a href="movieWrite.jsp" class="btn btn-md btn-outline-secondary btn-center">새 콘텐츠 등록하기</a> 
            	
            </div>         
        </div>
        <div id="footer">
            <%@ include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>

