<%@page import="java.util.List"%>
<%@page import="dateShare.Model.Activity"%>
<%@page import="dateShare.Dao.ActivityListView"%>
<%@page import="dateShare.service.activity.GetActivityListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String pageNumberStr = request.getParameter("page");

	int pageNumber = 1;

	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	// 핵심처리할 서비스 객체
	GetActivityListService service = GetActivityListService.getInstance();

	// 응답 데이터의 결과 
	ActivityListView viewData = service.getActivityListView(pageNumber);

	//session.setAttribute("u_num", 2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE | ACTIVITY</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Eater|Josefin+Sans|Sunflower:300&display=swap" rel="stylesheet">
<style>
#mainName{
            width: 300px;
            height: 100px;
            background-color: pink;
            border-radius: 10px;
            border: 20px solid darksalmon;
            text-align: center;
            right: 10px;
            position: absolute;
            color: blue;
            font-size: 200%;
            font-weight: bold;
            font-family: 'Sunflower',sans-serif;
            animation-name:  changecolor;
            animation-duration: 0.5s;
            animation-direction: alternate;
            animation-iteration-count: infinite;
        }
        @keyframes changecolor {
            from {
                
            }
            to{ 
                background-color: skyblue;
                color: red;
                border-radius:30px;
            }
        }
 
body {
	background-color: transparent;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="mainName">
ACTIVITY
</div>
	<div id="wrap">
		<div id="main_wrap">
			<div id="header">
				<%@include file="../frame/my.jsp"%>	
				<%@include file="../frame/header.jsp"%>
			</div>
			<div id="nav">
				<%@include file="../frame/nav.jsp"%>
			</div>
			<div id="content" class="album py-5">
				<div id="contentList" class="container">
					<div class="row">
						<%
							if (viewData.isEmpty()) {
								out.println("등록된 게시글이 없습니다.");

							} else {

								for (Activity activity : viewData.getActivityList()) {
						%>
						<div class="col-md-4">
							<div class="card mb-4 shadow-sm">
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg"
									preserveAspectRatio="xMidYMid slice" focusable="false"
									role="img">
									<a href="viewDetail.jsp?a_num=<%=activity.getA_num()%>">
	            						<image xlink:href="<%=activity.getA_path()%>"
											width="100%" height="225">
											
									
									</a>
									</svg>
								<div class="card-body">
									<p class="card-text">
										<%
											for (int i = 0; i < activity.getA_star(); i++) {
										%>
										★
										<%
											}
										%>
										<%-- 	별점 : <%= food.getF_star() %> --%>
										<br> <!-- 제목 --><%=activity.getA_title()%><br>
										 	조회수 <%=activity.getA_hits()%>
										 		<span style="padding: 20px; font-size: 20px;">
										 	 ♥<%=activity.getA_like()%>
										</span> <br>

									</p>
									<div class="d-flex justify-content-between align-items-center">
										<div class="btn-group">
											<%-- 					                  <a href="vieDetail.jsp?f_num=<%= food.getF_num() %>">
					                  	<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
					                  </a> --%>


										</div>
										<small class="text-muted"><%=activity.getA_writedate()%></small>
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

				<a href="writeForm.jsp"><input type="button"
					class="btn btn-sm btn-outline-secondary" value="글 등록하기"></a>
			</div>
			<div id="footer">
				<%@ include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>

</body>
</html>