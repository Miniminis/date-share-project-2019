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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">

<style>
	body {
		background-color: transparent;
	}
	
	#wrap {
		background-color: transparent;
	}
	#content {
		background-color: transparent;
	}
	.carousel {
	  margin-top: 20px;
	}
	
		

</style>
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
		          <img src="https://images.pexels.com/photos/1377054/pexels-photo-1377054.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=940" class="d-block w-100" alt="first slide">
		          <div class="carousel-caption">
		            <h2>이번 주말에는 익선동 맛집 데이트</h2>
		            <p>
		            	리모델링한 한옥 특유의 독특한 구조와 분위기를 자랑하는 ‘동남아’. 현지 느낌이 물씬 나는 태국 요리 전문점인 만큼 이국적인 장식과 소품들로 개성을 더했어요. 볶음 쌀국수인 ‘팟타이’ ‘파인애플 볶음밥’ 등은 누구나 좋아할 만한 대중적인 맛으로 인기가 무척 많습니다. 풍부한 향신료도 문제없는 분이라면 태국식 고기 국수인 ‘꾸어이 띠어우’를 추천해요.
		            </p>
		            <a class="btn btn-light" href="${ pageContext.request.contextPath }/food/foodList.jsp">커플 맛집탐색 바로가기</a>
		          </div>
		        </div>
		        <div class="carousel-item">
		          <img src="https://post-phinf.pstatic.net/MjAxOTAyMjFfMTA5/MDAxNTUwNzE5MjQ0MzE2.H0R6cf62JILDMVMXrKpP_LfR2bn46LcrAn67yULdQoEg.cpKmsCCp8P1vrZ0G-inszVWY-8BpWYZAxC4I8OatLsog.JPEG/%ED%8F%AC%EC%8B%9C%EC%A6%8C%EC%8A%A4_%EB%A6%AC%EC%A1%B0%ED%8A%B8_%EB%A7%88%EC%9A%B0%EC%9D%B4_%EC%95%B3_%EC%99%80%EC%9D%BC%EB%A0%88%EC%95%845.jpg?type=w1200" class="d-block w-100" alt="second slide">
		          <div class="carousel-caption">
		            <h2>매일 지겨운 데이트가 실증난다면, 액티비티 체험 어떠세요?</h2>
		            <p> 그랜드 와일레아, 어 월도프 아스토리아 리조트는 마우이 섬의 남쪽 해변에 위치한 럭셔리 리조트로 아름다운 시설과 석양으로 허니무너들의 많은 선택을 받고 있는 곳이다. 20년의 역사가 돋보이는 고풍스러운 건축물과 인테리어가 돋보이며 실내 정원 및 조경 시설도 뛰어난 편. 정원, 바다 전망의 780개 객실을 보유하고 있으며 가장 작은 객실도 57 제곱미터로 넓은 공간으로 편안하게 휴식을 가질 수 있다. 9개의 수영장 시설 또한 이곳의 큰 매력! 아이부터 성인까지 다양한 풀 수심으로 여유롭게 즐길 수 있다. 12세 이상의 투숙객 중, 스쿠버 다이빙이 처음인 이들에게는 리조트에서 무료 강습도 제공하고 있으니 참고하자.
		            </p>
		            <a class="btn btn-light" href="${ pageContext.request.contextPath }/activity/activityList.jsp">커플 액티비티 바로가기</a>
		          </div>
		        </div>
		        <div class="carousel-item">
		          <img src="https://images.pexels.com/photos/1457692/pexels-photo-1457692.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=400&w=940" class="d-block w-100" alt="third slide">
		          <div class="carousel-caption">
		            <h2>라이온킹 대개봉! 지금 남자친구랑 보러가기</h2>
		            <p> Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
		              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
		               reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
		                pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culp
		                 qui officia deserunt mollit anim id est laborum.
		            </p>
		            <a class="btn btn-light" href="${ pageContext.request.contextPath }/movie/movieMain.jsp">커플 영화 추천 바로가기</a>
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