<%@page import="dateShare.Model.Food"%>
<%@page import="dateShare.Dao.FoodListView"%>
<%@page import="dateShare.service.food.GetFoodListService"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE | FOOD</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/8653072c68.js"></script>
<style>
body {
	background-color: transparent;
}

#content_title h2, #content_title p {
	display: inline-block;
}

.red {
	color: #FF7B7B;
}

#card_title {
	font-size: 16px;
}

.yellow {
	color: #FBAB00;
}

.gray {
	color: #dddddd;
}

#f_l {
	width: 50%;
}

#f_r {
	width: 40%;
	float: right;
}

#d{
	clear: both;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<div id="wrap">
		<div id="main_wrap">
			<div id="header">
				<%@ include file="../frame/my.jsp"%>
				<%@ include file="../frame/header.jsp"%>
			</div>
			<div id="nav">
				<%@ include file="../frame/nav.jsp"%>
			</div>
			<div id="content" class="album py-5">

				<div id="content_title">
					<h2>맛집 공유 게시판</h2>
					<p id="writeBtn">
						<a href="writeForm.jsp"><input type="button" class="btn btn-sm btn-outline-secondary" value="글 등록하기"></a>
					<p>
				</div>

				<div id="contentList" class="container">
					<div class="row">
						<%
							if (viewData.isEmpty()) {
								out.println("등록된 게시글이 없습니다.");

							} else {
								for (Food food : viewData.getFoodList()) {
						%>
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img">
	            					<a href="viewDetail.jsp?f_num=<%=food.getF_num()%>">
	            						<image xlink:href="<%=food.getF_path()%>" width="100%" height="225">
	            					
									
									</a>
	            				</svg>
								<div class="card-body">
									<p class="card-text">


										<%-- 	별점 : <%= food.getF_star() %> --%>
										<br>
										<!-- 제목 -->
									<p id="card_title"><%=food.getF_title()%>
									<div>
									
									<div id="f_l">
										<!-- 조회수 -->
										<i class="far fa-eye"></i>
										<%=food.getF_hits()%>
										<!-- 좋아요 -->
										<i class="fas fa-heart red"></i>
										<%=food.getF_like()%>
									</div>
									<div id="f_r">
										<%
											//
											int yellowStar = food.getF_star()/2;
											int grayStar = food.getF_star()%2;
											for (int i = 0; i < yellowStar ; i++) {
										%>
										<i class="fas fa-star yellow"></i>
										<%
											}
											if(grayStar>0){
											%>
										<i class="fas fa-star gray"></i>
										<%	
											}
										%>
									</div>
									
									</div>
									<div id="d" class="d-flex justify-content-between align-items-center">
										<div class="btn-group"></div>
										<small class="text-muted"><%=food.getF_writedate()%></small>
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

			</div>
			<div id="footer">
				<%@ include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>