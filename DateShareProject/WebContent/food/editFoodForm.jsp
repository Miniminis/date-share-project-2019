
<%@page import="dateShare.Model.Food"%>
<%@page import="dateShare.service.food.ViewFoodDetailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ViewFoodDetailService service = ViewFoodDetailService.getInstance();
	int f_num = Integer.parseInt(request.getParameter("f_num"));
	Food food = service.viewDetail(f_num);

	session = request.getSession(false);
	LoginInfo currentUser = (LoginInfo) session.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
.starR1 {
	background: url('../images/star.png') no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background: url('../images/star.png') no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}

.starRev {
	margin: 0 auto;
	width: 150px;
}

#input_title {
	height: 43px;
	width: 440px;
}

#input_title input {
	height: 43px;
	width: 440px;
	font-size: 18px;
	background-color: rgba(255, 255, 255, 0);
	border: 0;
	border-bottom: 1px solid gray;
	font-weight: bold;
}

input {
	background-color: rgba(255, 255, 255, 0);
	border: 0;
}

#star {
	width: 20px;
}

textarea {
	background-color: rgba(255, 255, 255, 0);
	border: 1px solid #888;
	width: 400px;
	height: 200px;
	font-size: 18px;
	padding: 20px;
}
#input_submit{
	background-color: rgba(255, 255, 255, 0);
	border: 1px solid #888;
	width: 440px;
	height: 50px;
	margin-bottom: 30px 0;
	font-size: 16px;
}

#input_submit:hover{
	background-color : rgba(0, 0, 0, 0.1);
}

#h_title{
	padding: 20px 0;
	font-weight: bold;
}

#content img {
	text-align: center;
	width: 800px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(document).ready(function() {
		$('.starRev span').click(function() {

			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			$('#star').val($(this).text());
			return false;
		});
	});
</script>
</head>
<body>
	<div id="wrap">
		<div id="main_wrap">
			<div id="header">
				<%@include file="../frame/my.jsp"%>
				<%@include file="../frame/header.jsp"%>
			</div>
			<div id="nav">
				<%@include file="../frame/nav.jsp"%>
			</div>
			<div id="content">
				<h3>맛집 공유 게시판 | 글 수정</h3>
				<form action="editFood.jsp" method="post" enctype="multipart/form-data" name="editForm" id="editForm">
				
				
				
						<!-- 제목 -->
						<center>
							<p id="input_title">
								<input type="text" name="f_title" value="<%=food.getF_title()%>">
							</p>
							<br>

							<div class="starRev">
								<span class="starR1 on">1</span> <span class="starR2">2</span> <span class="starR1">3</span> <span class="starR2">4</span> <span class="starR1">5</span> <span class="starR2">6</span> <span class="starR1">7</span> <span class="starR2">8</span> <span class="starR1">9</span> <span class="starR2">10</span> <span>
								<input type="text" id="star" name="f_star" value="<%=food.getF_star()%>">
				
								<span>
							</div>

							<br>
							
							<p><img src="<%=food.getF_path()%>"></p>
							<p>
								<input type="file" name="f_path">
							</p>
							<br>
							<!-- 내용 -->
							<div>
								<textarea rows="5" cols="30" name="f_content"><%=food.getF_content()%></textarea>
							</div>
							<br> 
							<input type="hidden" name="f_num" value="<%=f_num%>">
							<input type="hidden" name="u_num" value="<%=currentUser.getU_num()%>"> 
							<input id = "input_submit" type="submit" value="등록">
						</center>

				</form>

				<hr>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
<script>

/*  // 폼에서 넘겨서 
function formSubmit() {
	var params = $('editForm').serialize();
	$.ajax ({
		url: 'editFood.jsp',
		type: 'post',
		data : params,
		success: function(cnt){
			alert($.trim(cnt));
			location.href='foodList.jsp';
		}
	})
}  */
			
	
</script>
</html>