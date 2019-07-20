<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
        <h1>회원정보 수정</h1>
	<form action=updateMember.jsp method="post">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name=u_id></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name=u_pw></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name=u_name></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type=submit value=등록>
				</td>
				</tr>
		</table>
	</form>    
</div>
        
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>
				
