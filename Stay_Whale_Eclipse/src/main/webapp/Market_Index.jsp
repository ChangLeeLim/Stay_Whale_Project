<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Market</title>
	<link rel="stylesheet" type="text/css" href="css/market_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/market_index.js"></script>
	
	
	
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("id");
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id%>"/>
		</jsp:include>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>
	<div class="section_wrap"></div>
<div id="all">
<!-- <section id="category">
	<nav>
		<ul>
			<li>전체(All)</li>
			<li>신상품</li>
			<li>추천상품</li>
			<li>구매후기</li>
			<li>카테고리 목록</li>
		</ul>
	</nav>
</section> -->

<div id="main_right">
<section id="main_market_section1">
	<!-- <div class="search-bar">
  <input class="search-input" type="search" placeholder="찾으시는 상품이 있으신가요?" onclick="showCategories()">
  <button class="search-button"><svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 24 24" style="background-color: skyblue;">
  <path fill="#fff" d="M21.7 20.3l-5.6-5.6c1-1.3 1.6-3 1.6-4.7 0-4.4-3.6-8-8-8s-8 3.6-8 8 3.6 8 8 8c1.7 0 3.4-0.5 4.7-1.6l5.6 5.6c0.4 0.4 1 0.4 1.4 0s0.4-1 0-1.4zM4 10c0-3.3 2.7-6 6-6s6 2.7 6 6-2.7 6-6 6-6-2.7-6-6z"></path>
</svg></button> 
<div class="category-options" style="display: none;">
    <input type="checkbox" id="option1" name="option1" value="option1">
    <label for="option1">Option 1</label><br>
    <input type="checkbox" id="option2" name="option2" value="option2">
    <label for="option2">Option 2</label><br>
    <input type="checkbox" id="option3" name="option3" value="option3">
    <label for="option3">Option 3</label><br>  
  </div>
</div>-->
	<h1> </h1>
	<div class="wrap">
   <div class="search">
      <input type="text" class="searchTerm" placeholder="찾으시는 상품을 검색해주세요.">
      <button type="submit" class="searchButton">
        <i class="fa fa-search"></i>
        <svg xmlns="http://www.w3.org/2000/svg" width="34" height="34" viewBox="0 0 24 24">
  <path fill="#fff" d="M21.7 20.3l-5.6-5.6c1-1.3 1.6-3 1.6-4.7 0-4.4-3.6-8-8-8s-8 3.6-8 8 3.6 8 8 8c1.7 0 3.4-0.5 4.7-1.6l5.6 5.6c0.4 0.4 1 0.4 1.4 0s0.4-1 0-1.4zM4 10c0-3.3 2.7-6 6-6s6 2.7 6 6-2.7 6-6 6-6-2.7-6-6z"></path>
</svg>
     </button>
   </div>
</div>
	<div id="main_banner">
		<ul>
			<li><img src="image\event_banner005.png" style="width: 1280px; height: 500px"></li>
			<li><img src="image\event_banner006.png" style="width: 1280px; height: 500px"></li>
			<li><img src="image\event_banner007.png" style="width: 1280px; height: 500px"></li>
			<li><img src="image\event_banner008.png" style="width: 1280px; height: 500px"></li>
		</ul>
		<p class="arrow left">
  <svg width="60px" height="80px" viewBox="0 0 50 80" xml:space="preserve">
    <polyline fill="none" stroke="#FFFFFF" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" points="
	45.63,75.8 0.375,38.087 45.63,0.375 "/>
  </svg>  
</p>
	<p class="arrow right">
  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="60px" height="80px" viewBox="0 0 50 80" xml:space="preserve">
    <polyline fill="none" stroke="#FFFFFF" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" points="
	0.375,0.375 45.63,38.087 0.375,75.8 "/>
  </svg>
</p>
	</div>
	
</section>

<div id="main_category">
<ul>
<li><div><img src="image/category_pension.jpg"><div class="window"></div><p>펜션</p></div></li>
<li><div><img src="image/category_homestay.jpg"><div class="window"></div><p>홈스테이</p></div></li>
<li><div><img src="image/category_camping.jpg"><div class="window"></div><p>캠핑/글램핑</p></div></li>
</ul>
</div>


<section id="main_market_section3">
	<div id="new_item">
		<h1>New Item!</h1>
	</div>
	<br>
	<div id="new_item_image">
		<ul>
			<li><img src="image\new_item001.png"></li>
			<li><img src="image\new_item002.png"></li>
		</ul>
	</div>
</section>

<section id="main_market_section2">
	<nav id="best_nav1">
		<h1>Best 상품</h1><br>
		<ul>
			<li><img src="image\camping_on.png"></li>
			<li><img src="image\pension.png"></li>
			<li><img src="image\homestay.png"></li>
		</ul>
	</nav>
	<nav id="best_nav2">
		<ul id="camping">
			<li><img src="image\camping_best_item001.png"></li>
			<li><img src="image\camping_best_item002.png"></li>
			<li><img src="image\camping_best_item003.png" ></li>
			<li><img src="image\camping_best_item004.png" ></li>
			<li><img src="image\camping_best_item005.png" ></li>
			<li><img src="image\camping_best_item006.png" ></li>
			<li><img src="image\camping_best_item007.png" ></li>
			<li><img src="image\camping_best_item008.png" ></li>
			<li><img src="image\camping_best_item009.png" ></li>
			<li><img src="image\camping_best_item010.png" ></li>
			<li><img src="image\camping_best_item011.png" ></li>
			<li><img src="image\camping_best_item012.png" ></li>
			<li><img src="image\camping_best_item013.png" ></li>
			<li><img src="image\camping_best_item014.png" ></li>
			<li><img src="image\camping_best_item015.png" ></li>
			<li><img src="image\camping_best_item016.png" ></li>
		</ul>
		<ul id="pension">
			<li><img src="image\pension_best_item001.png" ></li>
			<li><img src="image\pension_best_item002.png" ></li>
			<li><img src="image\pension_best_item003.png" ></li>
			<li><img src="image\pension_best_item004.png" ></li>
			<li><img src="image\pension_best_item005.png" ></li>
			<li><img src="image\pension_best_item006.png" ></li>
			<li><img src="image\pension_best_item007.png" ></li>
			<li><img src="image\pension_best_item008.png" ></li>
			<li><img src="image\pension_best_item009.png" ></li>
			<li><img src="image\pension_best_item010.png" ></li>
			<li><img src="image\pension_best_item011.png" ></li>
			<li><img src="image\pension_best_item012.png" ></li>
			<li><img src="image\pension_best_item013.png" ></li>
			<li><img src="image\pension_best_item014.png" ></li>
			<li><img src="image\pension_best_item015.png" ></li>
			<li><img src="image\pension_best_item016.png" ></li>
		</ul>
		<ul id="homestay">
			<li><img src="image\homestay_best_item001.png" ></li>
			<li><img src="image\homestay_best_item002.png" ></li>
			<li><img src="image\homestay_best_item003.png" ></li>
			<li><img src="image\homestay_best_item004.png" ></li>
			<li><img src="image\homestay_best_item005.png" ></li>
			<li><img src="image\homestay_best_item006.png" ></li>
			<li><img src="image\homestay_best_item007.png" ></li>
			<li><img src="image\homestay_best_item008.png" ></li>
			<li><img src="image\homestay_best_item001.png" ></li>
			<li><img src="image\homestay_best_item002.png" ></li>
			<li><img src="image\homestay_best_item003.png" ></li>
			<li><img src="image\homestay_best_item004.png" ></li>
			<li><img src="image\homestay_best_item005.png" ></li>
			<li><img src="image\homestay_best_item006.png" ></li>
			<li><img src="image\homestay_best_item007.png" ></li>
			<li><img src="image\homestay_best_item008.png" ></li>
		</ul>
	</nav>
		<ul id="page_button">
			<li style="background-color: skyblue;"></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	<p id="item_back"><</p>
	<p id="item_next">></p>
</section>

<!-- <section id="main_market_section4">
	<ul>
		<li><img src="image\item_001.png" style="width: 200px; height: 200px;"><p class="item_name">휴대용 라이트, 1개</p><p class="item_price">6,000원</p></li>
		<li><img src="image\item_002.png" style="width: 200px; height: 200px;"><p class="item_name">휴대용 가스버너, 1개</p><p class="item_price">24,900원</p></li>
		<li><img src="image\item_003.png" style="width: 200px; height: 200px;"><p class="item_name">오로라 불멍가루, 10개</p><p class="item_price">9,900원</p></li>
		<li><img src="image\item_004.png" style="width: 200px; height: 200px;"><p class="item_name">코멧 참나무 장작10kg, 1개</p><p class="item_price">12,900원</p></li>
		<li><img src="image\item_005.png" style="width: 200px; height: 200px;"><p class="item_name">휴대용 토치 라이터, 1개</p><p class="item_price">12,700원</p></li>
		<li><img src="image\item_006.png" style="width: 200px; height: 200px;"><p class="item_name">캐리어 가방, 1개</p><p class="item_price">43,000원</p></li>
		<li><img src="image\item_007.png" style="width: 200px; height: 200px;"><p class="item_name">세면도구 세트, 1개</p><p class="item_price">4,780원</p></li>
		<li><img src="image\item_008.png" style="width: 200px; height: 200px;"><p class="item_name">침낭 매트, 1개</p><p class="item_price">37,500원</p></li>
		<li><img src="image\item_009.png" style="width: 200px; height: 200px;"><p class="item_name">코멧 아웃도어 타프, 1개</p><p class="item_price">38,980원</p></li>
		<li><img src="image\item_010.png" style="width: 200px; height: 200px;"><p class="item_name">스위스마운틴 캠핑해먹, 1개</p><p class="item_price">28,900원</p></li>
		<li><img src="image\item_011.png" style="width: 200px; height: 200px;"><p class="item_name">캠핑용 아이스박스, 1개</p><p class="item_price">15,990원</p></li>
		<li><img src="image\item_012.png" style="width: 200px; height: 200px;"><p class="item_name">폴딩 박스, 2개</p><p class="item_price">19,900원</p></li>
	</ul>
	<a href="#" onclick="return false"><h2>더 보기</h2></a>
</section> -->
</div>



</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>