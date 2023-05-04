<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/AllCont.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/AllCont.js"></script><!--※js파일 맞는걸로 수정 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<section id="section1">
	<div id="searchWrap">
	<div id="logoWarp">
		<div id="logo"></div>
		<div id="name">StayWhale</div>
	</div>
		<div id="searchBarWrap">
			<input id="searchBar" type="text" placeholder="검색">
			<div id="searchBtn">
				<div></div>
			</div>
		</div>
		<div id="searchOp">
			<ul>
				<li data-target = "to">전체</li>
				<li data-target = "se">서울경기</li>
				<li data-target = "ka">강원</li>
				<li data-target = "ch">충청</li>
				<li data-target = "ky">경상</li>
				<li data-target ="ju">전라</li>
				<li data-target ="je">제주</li>
				<li>여행일수</li>
			</ul>
		</div>
	</div>
</section>


<section id="section2">	
	<div id="diaryCont">
		<%
			for(int i=0 ; i< 16; i++){  // 초기 16개의 데이터 
				out.println("<ul>");
				out.println("<li>");
					out.println("<div style ='background-image: url(image/jeju.jpg)'></div>");
					out.println("<div>");
						out.println("<div class ='circle' style ='background-image: url(image/jejuper.jpg)'></div>");
						out.println("<div class = 'diaryText'>");
							out.println("<ul>");
								out.println("<li>jejulady</li>");
								out.println("<li>제주도 한달살기's</li>");
								out.println("<li>세비야는 작은 도시지만 걸어서 돌아보기엔 다리가 아프고 트램이나 지하철은 애매하다. 좁고 미로같은 골목으로 유명한 세비야에서 자동차는 금물! 자전거 도로가 따로 있는데다 자전거 대여도 해주니 세비야에선 최고의 교통편이다.</li>");
							out.println("</ul>");
						out.println("</div>");
					out.println("</div>");
				out.println("</li>");
			out.println("</ul>");
				
			}
			
		%>
			
	</div>
	

</section>
<div id="nextEle"></div>

















</body>
</html>