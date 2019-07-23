<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE : MESSAGE전송</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/content.css" rel="stylesheet" type="text/css">
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
           <div id="content_title">
               <h2>MESSAGE SEND</h2>
           </div>
           <div id="cform_wrap">
            <form action="writeMessage.jsp" method="post">
                <span><label>보내는 사람</label> <%= user.getU_name() %>(<%= user.getU_id() %>)
                <input name="u_num" type="hidden" value="<%= user.getU_num() %>"> </span><br>
            	<span><label for="to">받는사람</label></span><input id="to" class="c_input" type="text" name="m_to" required><br>
            	<span><label for="title">제목</label></span>
                <input id="title" class="c_input" type="text" name="m_title" required><br>
                <span><label for="text">내용</label></span>
                <textarea id="text" class="c_input_t" name="m_content" rows="5" required></textarea><br>
            	<input class="c_btn" type="submit" value="보내기">
            	<a id="c_btna" href="messageList.jsp">이전으로</a>
            </form>
            </div>
        </div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
</div>
</body>
</html>



