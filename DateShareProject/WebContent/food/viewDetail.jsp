<%@page import="dateShare.Model.Food"%>
<%@page import="dateShare.service.food.ViewFoodDetailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 클릭한 글의 글번호를 가져옴 - 디테일 뷰 메서드 실행
	int f_num = Integer.parseInt(request.getParameter("f_num"));
	ViewFoodDetailService service = ViewFoodDetailService.getInstance();
	Food food = service.viewDetail(f_num);

	// 로그인한 사용자 정보 가져옴
	session = request.getSession(false);
	LoginInfo currentUser = (LoginInfo) session.getAttribute("userInfo");
%>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>

<link href="../css/index.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/8653072c68.js"></script>
<style>
#detail_wrap {
	width: 900px;
	margin: 0 auto;
	padding: 50px 20px;
	margin: 20px;
	background-color: rgba(255, 255, 255, 0.3);
	/* box-shadow: 3px 3px 1px rgba(0,0,0,0.1); */
}

.red {
	color: #FF7B7B;
}

#heart:hover {
	color: #FF5B5B;
}

.yellow {
	color: #FBAB00;
}

#nameDate, #editArea {
	text-align: right;
	color: #777;
	font-size: 14px;
	margin: 15px 0;
}

#content img {
	text-align: center;
	width: 800px;
}

#content_text {
	padding-top: 15px;
	font-size: 20px;
}

.gray {
	color: #dddddd;
}

#like_wrap p {
	display: inline;
	height: 20px;
}

#like_wrap {
	text-align: right;
	font-size: 20px;
}

#likeCount {
	font-size: 20px;
	line-height: 20px;
}

a:hover {
	cursor: pointer;
	font-weight: bold;
}

.cursor {
	cursor: pointer;
}

#starArea {
	margin-bottom: 15px;
}

textarea {
	background-color: rgba(255, 255, 255, 0);
	border: 0;
	width: 600px;
	height: 100px;
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	padding-top: 15px;
}

#h_title {
	padding: 20px 0;
	font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


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
				<div id="content_title">
					<div id="h_title">
						<i class="fas fa-utensils"></i> 맛집 공유 게시판
					</div>
				</div>
				<div id="detail_wrap">


					<!-- 제목 -->
					<center>
						<h1><%=food.getF_title()%></h1>
					</center>
					<div id="nameDate">
						<%=food.getU_name()%>
						|
						<%=food.getF_writedate()%></div>

					<center>
						<p id="starArea">
							<%
								int yellowStar = food.getF_star() / 2;
								int grayStar = food.getF_star() % 2;
								for (int i = 0; i < yellowStar; i++) {
							%>
							<i class="fas fa-star fa-2x yellow"></i>
							<%
								}
								if (grayStar > 0) {
							%>
							<i class="fas fa-star fa-2x gray"></i>
							<%
								}
							%>
						</p>



						<br> <img src="<%=food.getF_path()%>">
						<p id="content_text">
							<textarea name="f_content" disabled="disabled"><%=food.getF_content()%></textarea>
						</p>
					</center>

					<div id="like_wrap">
						<p>
							<!-- 조회수 -->
							<i class="far fa-eye"></i>
							<%=food.getF_hits()%> 
							<i id="heart" class="fas fa-heart red cursor" onclick="like(<%=food.getF_num()%>)"></i>
						<p id="likeCount"><%=food.getF_like()%></p>

					</div>


					<br>

					<%
						if (currentUser.getU_num() == food.getU_num()) {
					%>
					<div id="editArea">
						<a onclick="editFood(<%=food.getF_num()%>, <%=currentUser.getU_num()%>, <%=food.getU_num()%>)">수정</a> | <a onclick="deleteFood(<%=food.getF_num()%>, <%=currentUser.getU_num()%>, <%=food.getU_num()%>)">삭제</a>
					</div>
					<%
						}
					%>


				</div>

			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>

<script>


	
	// 좋아요 버튼을 누르면 처리
	function like(f_num) {
		$.ajax ({
			url: 'likeProcess.jsp?f_num='+f_num,
			type: 'post',
			data : {
				f_num : f_num
			},
			success: function(data){
				$('#likeCount').html(data);
			}
			});
		
	}

	// 게시글 수정
	function editFood(f_num, currentUser_num, writeUser_num) {
		var answer =  confirm("게시글을 수정하시겠습니까?");
		if (!answer){
			// alert("취소하였습니다.");
		} else if(currentUser_num == writeUser_num){
			// [로그인한 사용자 == 글을 작성한 사용자] 의 경우
				$.ajax ({
				url: 'editFoodForm.jsp',
				type: 'post',
				data : {
					f_num : f_num,
					u_num : currentUser_num
				},
				success: function(data){
					//alert($.trim(data));
					location.href='editFoodForm.jsp?f_num='+f_num;
				}
			}); 
		} else{
			alert('자신이 작성한 글만 수정 가능합니다!');
		}
	}

	
	// 게시글 삭제
	function deleteFood(f_num, currentUser_num, writeUser_num) {
		var answer =  confirm("정말 삭제하시겠습니까?");
		if (!answer){
			//alert("취소하였습니다.");
		} else if(currentUser_num == writeUser_num){
			//alert("같음! 현재로그인유저번호:"+currentUser_num+"\n 글쓴유저번호:"+writeUser_num);
 			$.ajax ({
				url: 'deleteFood.jsp',
				type: 'post',
				data : {
					f_num : f_num,
					u_num : currentUser_num
				},
				success: function(data){
					alert($.trim(data));
					location.href="foodList.jsp";
				}
			}); 
		} else{
			alert('자신이 작성한 글만 삭제 가능합니다!');
		}
	}
	
</script>
</html>