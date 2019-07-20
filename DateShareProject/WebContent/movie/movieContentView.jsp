<%@page import="dateShare.Model.Movie"%>
<%@page import="dateShare.service.movie.GetLikeService"%>
<%@page import="dateShare.service.movie.GetArticleListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String artnum = request.getParameter("articleNum");
 	
	int articleNum = 1; 
 	
	if(artnum != null) {
		articleNum = Integer.parseInt(artnum);
	}
	
	GetArticleListService service = GetArticleListService.getInstance();
	Movie movieContent = service.getArticle(articleNum);
	
	
	//좋아요 개수
	int likeOriginCnt = 0;
	
	GetLikeService likeservice = GetLikeService.getInstance();
	likeOriginCnt = likeservice.getLikeOrigin(articleNum); 
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
	#container {
		margin: 20px auto;
	}
	#emptyLike {
		cursor: pointer;
	}
	.transparent {
		border-color: transparent; 
		background-color: transparent;
		display: inline;
	}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://kit.fontawesome.com/744ccfa256.js"></script>
<script>
	
	function deleteArticle(artnum) {
		if(confirm('정말로 삭제하시겠습니까? ')){
			$.ajax ({
				url: 'deleteArticle.jsp',
				type: 'get',
				data : {
					m_num : artnum
				},
				success: function(data){
					alert(data+"번의 메세지가 삭제되었습니다.");
					location.href="movieMain.jsp";
				}
			});
		};
	}
	
	
	//$('#emptyLike').hide();
	//$('#fullLike').show();
	
	$(document).ready(function(){
		//alert($("#m_num").val());
		//$('#fullLike').hide();
		
		$('#emptyLike').click(function(){
			//alert('좋아요');
			
			$.ajax({
				url : 'getLike.jsp',  
				data : {
					m_num : $('#m_num').val(),
					u_num : $('#u_num').val()
				},
				success : function(data){
					//alert(data);
					$('#likeCnt').val(data);
					//$('#emptyLike').hide();
					//$('#fullLike').show();
				}				
			});
			
		});
		
	});
		
	
</script>
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
            <div id="container">
            	<input id="m_num" type="hidden" value="<%= movieContent.getM_num() %>">
            	<input id="u_num" type="hidden" value="<%= user.getU_num() %>">
            	
            	<image src="<%= movieContent.getM_path() %>" width="100%" height="225">
            	
            	<h1>제목 <%= movieContent.getM_title() %></h1>
            	<h3>작성자 <%= movieContent.getU_name() %> <br>
            		작성일시<%= movieContent.getM_writedate() %> <br> 
            		좋아요 <a id="emptyLike"><i class="far fa-heart"></i></a>
            			<a id="fullLike"><i class="fas fa-heart"></i></a>
            		<input type="text" id="likeCnt" value="<%= likeOriginCnt %>" class="transparent">
            		<br>
            		조회수<%= movieContent.getM_hits() %></h3>
            	<p>내용 <%= movieContent.getM_content() %></p>
           
            	<input type="button" value="삭제하기" id="deleteBtn" onclick="deleteArticle(<%= movieContent.getM_num() %>)">
            	<br>
            	
            	<a href="movieMain.jsp">
            		<input type="button" value="목록보기">
            	</a>
            	
            	<p>댓글</p>
            </div>
        </div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>

<!-- 
	0. 좋아요 테이블 생성 
	- u_num : foreignkey 
	- m_num: foreign key 
	-> cascade 이용 글 지워지면 같이 삭제 

1. 뷰 페이지 
- 바디 : 좋아요 버튼 클릭
- 스크립트 : ajax 클릭이벤트 -> loginChk.jsp
success -> 
(1) data == y, getLikeCnt(); + cngHeart();
(2) data == n : alert() 로그인 정보를 확인 해주세요 
history.go(-1);
 
2. loginChk.jsp (ajax 통해서 연결되는 페이지) 
- 세션 - 회원아이디 통해서 로그인 여부 검사 
- return : y or n

3. getLikeCnt() 
- .ajax 좋아요 개수 받아오기 
data: 회원번호, 글번호 -> getLike.jsp 
- success() 
     data = 1, 

4. cngHeart()- 하트 모양 바꾸기 
(1) 빈 하트면 -> 채움 
(2) 채움이면 -> 빈하트 

5. getLike.jsp
- parameter : 회원번호, 글번호
- getLikeService - getLike(회원번호, 글번호)
- return int likeCnt; 

6. getLikeService 클래스 
- getLike(회원번호, 글번호)
- Map<String, String> likeMap = HashMap<String, String>();
likeMap.put(회원번호, 글번호);

- DAO : 
(1) 동일 게시글에 대해 이전 추천 여부 확인 
- likeCheck(conn, likeMap) 
- return int totalCnt 

(2) totalCnt == 0 이전 추천이 없다면 
- likeUpdate(conn, likeMap)
- likeCnt = likeCnt(conn)
totalCnt !=0 이전 추천이 있다면 
- likeDelete(conn, likeMap)  
- likeCnt = likeCnt(conn)

- return int likeCnt; 

7. DAO 
(1) 동일게시글 좋아요 여부
- likeCheck(conn, likeMap)  
- select * from m_like where u_num=? and m_num?; 
- ?: likeMap.getName 
- ?: likeMap.getValue

(2) 총 좋아요 수 추가 
likeUpdate(conn, likeMap)
- insert into m_like values(likeMap.name, likeMap.value);

(3) 전체 좋아요 수 
likeCnt(conn, m_num)
- select count(*) from m_like where m_num = m_num;

(4) 좋아요 삭제 
likeDelete(conn, likeMap)  
- delete from m_like where u_num = likeMap.name and m_num=likeMap.value; 
 -->