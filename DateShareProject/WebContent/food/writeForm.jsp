<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<!-- 글쓰기를 눌렀을 때 현재 로그인 된 사용자, 임시로 넣었다 -->
	<% session.setAttribute("u_num",5);%> 
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
				<h3>글쓰기</h3>
<!-- 					<form action="writeFood.jsp" method="post"> -->
 				<form action="writeFood.jsp" method="post" enctype="multipart/form-data"> 
					<table>
						<!-- quill api 사용하면 좋겠다 -->
						<!-- 지도 api 사용하면 좋겠다 -->
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="f_title">
							</td>
						</tr>
						<tr>
							<td>사진</td>
							<td>
								<input type="file" name="f_path">
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<textarea rows="5" cols="30" name="f_content"></textarea>
							</td>
						</tr>
						<!-- 검색해보니 별점을 슬라이더 방식 말고 css로 그냥 구현하나보다. 일단 이렇게 하고 나중에 바꾸자 -->
						<tr>
							<td>별점</td>
							<td>
								<input type="range" name="f_star" max="10" step="1">
							</td>
						</tr>
						<!-- 할수있다면 지도 -->
						<tr>
							<td colspan="2">
								<input type="hidden" name="u_num" value="<%=session.getAttribute("u_num") %>"><!-- 유저번호 가져오기 -->
								<input type="submit" value="등록">
							</td>
						</tr>
					</table>
				</form>
				<hr>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>