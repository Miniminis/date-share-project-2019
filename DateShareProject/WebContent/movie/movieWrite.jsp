<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE | MOVIE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
	.center {
		margin: 20 auto;
		text-align: center;
	}
	.transparent {
		border-color: transparent; 
		background-color: transparent;
	}
	.mr-30 {
		margin: 30px 0;
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
        <div id="content">
        <h1>영화 글쓰기 페이지</h1>
            <form action="movieWriteChk.jsp" method="post" enctype="multipart/form-data">
            	<div id="container" class="center">
	            	<div>
	            		<h1><input type="text" id="mTitle" name="m_title" class="transparent mr-30" required placeholder="제목을 입력하세요"></h1>
	            	</div>
	            	<div>
	            		<input type="file" id="mFile" name="m_path">
	            	</div>
	            	<div>
	            		<input type="number" id="mStar" name="m_star">
	            	</div>
	            	<div class="mr-30">
	            		<textarea name="m_content" class="transparent" rows="50" cols="100"></textarea>
	            	</div>
	            	<input type="submit" value="글 등록하기">
            	</div>
            </form> 
        </div>
        <div id="footer">
            <%@ include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>