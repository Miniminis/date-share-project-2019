<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE</title>
</head>
<link href="css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
    <div id="main_wrap">
        <div id="header">
        	<%@include file="frame/my.jsp" %>
            <%@include file="frame/header.jsp" %>
        </div>
        <div id="nav">
            <%@include file="frame/nav.jsp" %>
        </div>
        <div id="content">
        	<div id="carouselExampleIndicators" class="carousel slide"
		      data-ride="carousel">
		      <ol class="carousel-indicators">
		        <li data-target="#carouselExampleIndicators" data-slide-to="0"
		          class="active"></li>
		        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		      </ol>
		      <div class="carousel-inner">
		        <div class="carousel-item active">
		          <img src="https://images.pexels.com/photos/1377054/pexels-photo-1377054.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="d-block w-100" alt="first slide">
		          <div class="carousel-caption">
		            <h2>이번 주말에는 익선동 맛집 데이트</h2>
		            <p> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
		              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
		               reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
		                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culp
		                 qui officia deserunt mollit anim id est laborum.
		            </p>
		            <a class="btn btn-light" href="#">커플 맛집탐색 바로가기</a>
		          </div>
		        </div>
		        <div class="carousel-item">
		          <img src="https://images.pexels.com/photos/630831/pexels-photo-630831.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="d-block w-100" alt="second slide">
		          <div class="carousel-caption">
		            <h2>매일 지겨운 데이트가 실증난다면, 액티비티 체험 어떠세요?</h2>
		            <p> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
		              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
		               reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
		                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culp
		                 qui officia deserunt mollit anim id est laborum.
		            </p>
		            <a class="btn btn-light" href="#">커플 액티비티 바로가기</a>
		          </div>
		        </div>
		        <div class="carousel-item">
		          <img src="https://images.pexels.com/photos/1457692/pexels-photo-1457692.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" class="d-block w-100" alt="third slide">
		          <div class="carousel-caption">
		            <h2>라이온킹 대개봉! 지금 남자친구랑 보러가기</h2>
		            <p> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
		              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
		               reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
		                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culp
		                 qui officia deserunt mollit anim id est laborum.
		            </p>
		            <a class="btn btn-light" href="#">커플 영화 추천 바로가기</a>
		          </div>
		        </div>
		      </div>
		      <a class="carousel-control-prev" href="#carouselExampleIndicators"
		        role="button" data-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a class="carousel-control-next" href="#carouselExampleIndicators"
		        role="button" data-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		      </a>
		    </div>
        </div>	
        <div id="footer">
            <%@include file="frame/footer.jsp" %>
        </div>
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>