<%@page import="dateShare.Model.Food"%>
<%@page import="dateShare.Dao.FoodListView"%>
<%@page import="dateShare.service.food.GetFoodListService"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<% session.setAttribute("u_num",5);%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE | FOOD</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
	body {
		background-color: transparent;
	}
</style>
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
            		if(viewData.isEmpty()) {
            			out.println("등록된 게시글이 없습니다.");
            			
            		} else {
            			for(Food food : viewData.getFoodList()) {            			
            			%>          				
            				<div class="col-md-4">
            				<div class="card mb-4 shadow-sm">
	            				<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
	            					<a href="viewDetail.jsp?f_num=<%= food.getF_num() %>">
	            						<image xlink:href="<%= food.getF_path() %>" width="100%" height="225">
	            					</a>
	            				</svg> 
	            				<div class="card-body">
	            				 <p class="card-text">
	            				 <% for(int i=0; i<food.getF_star();i++){
	           						%>
	           						★
	           						<%
	           						} %>
	           					<%-- 	별점 : <%= food.getF_star() %> --%>
	           						<br>
	            				 	<!-- 제목 --><%= food.getF_title() %><br>
	           						조회수 <%= food.getF_hits() %>
 	           						좋아요  <%= food.getF_like() %> 

	           						<br>
	           						
	            				 </p> 
	            				 <div class="d-flex justify-content-between align-items-center">
					                <div class="btn-group">
<%-- 					                  <a href="vieDetail.jsp?f_num=<%= food.getF_num() %>">
					                  	<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
					                  </a> --%>

					                
					                </div>
					                <small class="text-muted"><%= food.getF_writedate() %></small>
					              </div>        				            			
		            			</div>
            				</div>
            				</div>
            			<%
            			}
            		}
            	%>
            	</div>
            </div>

            <a href="writeForm.jsp"><input type="button" class="btn btn-sm btn-outline-secondary" value="글 등록하기"></a> 
        </div>
        <div id="footer">
            <%@ include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>