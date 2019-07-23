<%@page import="dateShare.Model.Movie"%>
<%@page import="dateShare.service.movie.GetArticleListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String artnum = request.getParameter("articleNum"); 
	
	//out.println(artnum);

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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/movie.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

	$(document).ready(function () {
	   $('.starRev span').click(function(){

	        $(this).parent().children('span').removeClass('on');   
	        $(this).addClass('on').prevAll('span').addClass('on'); //prevAll('span') : 해당 요소 전까지 모든 자매들을 같이 처리
	        $('#mStar').val($(this).text());   
	        
	        return false;
	      });
	});
	
</script>
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
	     	<div class="row justify-content-md-center">
	   			<div class="col-md-8 border-gray">
	   			<form action="movieEditChk.jsp" method="post" enctype="multipart/form-data"> 
	    			<input type="text" id="mTitle" name="m_title" class="transparent title" value="<%= movieContent.getM_title() %>">	
			       	<div class="noOverflow">	            	
			        	<div class="align-left">
			        		<strong>사진   </strong><input type="file" id="mFile" name="m_path" value="<%= movieContent.getM_path() %>" class="mr-5">
			        		<br>
			        		<strong class="align-left mr-3">추천별점     </strong>
			            		<div class="starRev align-left">
								  <span class="starR1 on">1</span>
								  <span class="starR2">2</span>
								  <span class="starR1">3</span>
								  <span class="starR2">4</span>
								  <span class="starR1">5</span>
								  <span class="starR2">6</span>
								  <span class="starR1">7</span>
								  <span class="starR2">8</span>
								  <span class="starR1">9</span>
								  <span class="starR2">10</span>
								</div>
		            		<input type="hidden" id="mStar" name="m_star" class="mr-5" value="<%= movieContent.getM_star() %>">
			        	</div>			           
			       	</div>
			       	<hr>
			       	<div class="mr-30">
	            		<textarea name="m_content" class="transparent pd-10" rows="15" cols="75">
	            			<%= movieContent.getM_content() %>
	            		</textarea>
	            	</div>
			     	<hr>
			     	<input type="hidden" name="articleNum" value="<%= movieContent.getM_num() %>">           	
			       	<input type="submit" value="글 수정하기" class="btn btn-md btn-outline-secondary btn-block">
			    </form>
		     	</div>
		     </div>
		     </div> 
        </div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>