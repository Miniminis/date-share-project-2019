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
	
	//세션에서 회원정보 받아오기
	session = request.getSession(false);
	LoginInfo curuser = (LoginInfo) session.getAttribute("userInfo");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/movie.css" rel="stylesheet" type="text/css">

<style>
	
	#emptyLike {
		cursor: pointer;
	}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://kit.fontawesome.com/744ccfa256.js"></script>
<script>
	
	//게시글 삭제하기
	function deleteArticle(artnum) {
		
		if(confirm('삭제된 글을 다시 복구가 불가합니다. 정말로 삭제하시겠습니까?')){
			$.ajax ({
				url: 'deleteArticle.jsp',
				type: 'get',
				data : {
					m_num : artnum
				},
				success: function(data){
					alert(data);
					location.href="movieMain.jsp";
				}
			});
		};
	}
	
	
	//게시글 수정권한확인 --> 결과에 따라 분기처리
	function editArticle(artnum) {
		if(confirm('게시글을 수정하시겠습니까? ')) {
			$.ajax({
				url: 'editAuthorityChk.jsp',
				type: 'get',
				data : {
					m_num : artnum
				},
				success : function(data){
					if(data == 0) {
						alert('작성자 본인만 수정 가능합니다!');
					} else if(data == 1) {
						alert('수정페이지로 이동합니다.');
						window.location.href = "movieEditView.jsp?articleNum=" + artnum;
						//location.href="movieEditView.jsp";
					} 
				}
			});
		}
		
	}
	
	
	
	
	//게시글 좋아요
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
            	
            	<div class="row justify-content-md-center">
            	<div class="col-md-8 border-gray">
	            	<h2 class="center"><%= movieContent.getM_title() %></h2>
	            	<div class="noOverflow">	            	
		            	<p class="align-left">
		            		<strong>작성자   </strong><%= movieContent.getU_name() %><br>
		            		<strong>작성일시   </strong><%= movieContent.getM_writedate() %>
		            	</p>
		            	<p class="align-right">
		            		<br>
		            		<strong>조회수   </strong><%= movieContent.getM_hits() %>
		            	</p>
	            	</div>	
	            	<hr>
	            	<image src="<%= movieContent.getM_path() %>" width="100%" height="400" class="pd-10">
	            	<p class="pd-10"><%= movieContent.getM_content() %></p>
	            	<hr>                      	
	            	<div class="btn-group">
	            		<strong>좋아요</strong><a id="emptyLike"><i class="far fa-heart"></i></a>
	           					<a id="fullLike"><i class="fas fa-heart"></i></a>
	           					<input id="likeCnt" value="<%= likeOriginCnt %>" class="transparent" disabled>
		                <a id="deleteBtn" onclick="deleteArticle(<%= movieContent.getM_num() %>)">
		                	<button type="button" class="btn btn-sm btn-outline-secondary">DELETE</button>
		                </a>
		                <a id="editBtn" onclick="editArticle(<%= movieContent.getM_num() %>)">
		                	<button type="button" class="btn btn-sm btn-outline-secondary">EDIT</button>
		                </a>
	                </div><br>
	                <a href="movieMain.jsp">
	           			<button type="button" class="btn btn-md btn-outline-secondary btn-block">MAIN</button>
	           	    </a>
            	</div>
            	</div>
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