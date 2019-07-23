<%@page import="dateShare.Model.Activity"%>
<%@page import="dateShare.service.activity.ViewActivityDetailService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>




<%
	session = request.getSession(false);
	LoginInfo dongjun = (LoginInfo) session.getAttribute("userInfo");

	int a_num = Integer.parseInt(request.getParameter("a_num"));

	ViewActivityDetailService service = ViewActivityDetailService.getInstance();
	Activity activity = service.viewDetail(a_num);
%>
<html>
<head>


<meta charset="UTF-8">
<title>DATE SHARE</title>
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
            font-size: 320%;
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
.like {
	
	display: inline;
	float:right;	
	font-size: 20px;

}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<!-- 빈으로 가져오기 -->
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
			<div id="wName"style="font-weight: bolder; font-size: 30px;">
				<%=activity.getU_name()%>
				's story
			</div>
			<br>
			<div style="font-weight: bolder; font-size: 20px;"><%=activity.getA_title()%></div>
			<div>
				<p class="card-text">
					<%
						for (int i = 0; i < activity.getA_star(); i++) {
					%>
					★
					<%
						}
					%>

				</p>
				<p class="like" id="likeCount"><%=activity.getA_like()%></p>
				<form class="like" id="likeForm">
					<input class="like" type="button" onclick="like(<%=activity.getA_num()%>)"
						value="Like♥">
				</form>
			</div>

			<hr>
			
			<div id="content">
				<br>
				<img style="width: 1024px; height: 700px;"
					src="<%=activity.getA_path()%>">
					<div style="float: right;"><%=activity.getA_writedate()%></div>
					<br> <br> <a class="a_btn"
					href="javascript:deleteCheck();">삭제</a>
				<script language="JavaScript">
					
					//좋아요
					function like(a_num) {
						
						
						$.ajax ({
							url: 'likeProcess.jsp?a_num='+a_num,
							type: 'post',
							data : {
								a_num : a_num
							},
							success: function(data){
								$('#likeCount').html(data);
							}
							});
						
					}
					
					
						function deleteCheck() {
						if (confirm("삭제 하시겠습니까?")) {
					
							location.href="deleteActivity.jsp?a_num=<%=activity.getA_num()%>"	
							
						} else {
							alert("삭제 취소 되었습니다.");
								return;
							}
								}

						</script>



				<a class="a_btn" href="editActivityChk.jsp?a_num=<%=activity.getA_num()%>">수정
				</a> <br> <br>
				<div style="font-size: 20px;">
				<%=activity.getA_content()%>
				</div>
			</div>


			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>