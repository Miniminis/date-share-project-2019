<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE | MOVIE</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/movie.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

	$(document).ready(function () {
	   $('.starRev span').click(function(){

	        $(this).parent().children('span').removeClass('on');   //이전의 체크된 별점을 없에고 
	        $(this).addClass('on').prevAll('span').addClass('on'); //현재 클릭한 span 위치까지만 on 클래스 적용 
	        //alert($(this).text());														//prevAll('span') : 해당 요소 전까지 모든 자매들을 같이 처리
	        $('#mStar').val($(this).text());   //체크된 span에 있는 text 요소를 출력 --> hidden input으로 같이 전달 
	        
	        return false;
	      });
	});
	
</script>
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
        	<div id="container">                   	
            	<div class="row justify-content-md-center">
          			<div class="col-md-8 border-gray">
          			<form action="movieWriteChk.jsp" method="post" enctype="multipart/form-data"> 
	          			<input type="text" id="mTitle" name="m_title" class="transparent title" required placeholder="제목을 입력해주세요">	
		            	<div class="noOverflow">	            	
			            	<div class="align-left">
			            		<strong>사진   </strong><input type="file" id="mFile" name="m_path" class="mr-5"><br>
			            		<strong class="align-left mr-3">추천별점     </strong>
				            		<div class="starRev align-left">
									  <span class="starR1 on">1</span>
									  <span class="starR2 on">2</span>
									  <span class="starR1 on">3</span>
									  <span class="starR2 on">4</span>
									  <span class="starR1 on">5</span>
									  <span class="starR2 on">6</span>
									  <span class="starR1 on">7</span>
									  <span class="starR2 on">8</span>
									  <span class="starR1 on">9</span>
									  <span class="starR2 on">10</span>
									</div>
			            		<input type="hidden" id="mStar" name="m_star" class="mr-5">
			            	</div>			           
			           	</div>
			           	<hr>
			           	<textarea name="m_content" class="transparent pd-10" rows="15" cols="85" placeholder="내용을 입력해주세요"></textarea>
	           			<hr>
		            	<input type="submit" value="글 등록하기" class="btn btn-md btn-outline-secondary btn-block">
            		</form>
            		</div>
            	</div>
            </div> 
        </div>
        <div id="footer">
            <%@ include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>