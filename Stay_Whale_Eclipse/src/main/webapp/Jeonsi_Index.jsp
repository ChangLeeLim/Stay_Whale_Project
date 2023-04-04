<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Jeonsi</title>
	<link rel="stylesheet" type="text/css" href="css/jeonsi_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/jeonsi_index.js"></script>
	
	
	
</head>
<script>
	$(function(){
		var img_page;
		var img_position = 1;

		img_page = $(".slides").children().length -2;

		$(".prev").click(function(){
			if(img_position > 1)
			{
				$(".slides").animate({
					left: "+=360px"
				});
				img_position--;
			}
		});
		$(".next").click(function(){
			if(img_position < img_page)
			{
				$(".slides").animate({
					left: "-=360px"
				});
				img_position++;
			}
		});
	});
	$(function(){
		$('.categori_icon').each(function() {

		var nowImg = $(this).find('img');  //호버한 부분의 img파일 찾기
		var srcName = nowImg.attr('src');  //호버한 부분의 이미지 주소값 src가지고오기
		var newSrc = srcName.substring(0, srcName.lastIndexOf('.'));
			//.png , .jpg 와같이 파일명 자르기. 뒤에서부터 시작해서 '.'점있는 곳 까지 컷! 

		//호버이벤트
		$(this).hover(function() { 
  		$(this).find('img').attr('src', newSrc+ '_on.' + /[^.]+$/.exec(srcName)); //hover시 _on붙이기
		}, function() {
  		$(this).find('img').attr('src', newSrc + '.' + /[^.]+$/.exec(srcName)); //hover시 _on 때기
		});


});
	});
</script>
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
<div class="sidebar">
	<ul>
	  <li class="sidebar_menu" data-scroll="#popular_magazine"><a href="#popular_magazine">인기 매거진</a></li>
	  <li  class="sidebar_menu" data-scroll="#popular_category"><a href="#popular_category">인기 카테고리</a></li>
	  <li  class="sidebar_menu" data-scroll="#popular_performance"><a href="#popular_performance">인기 공연</a></li>
	  <li  class="sidebar_menu" data-scroll="#popular_leisure"><a href="#popular_leisure">인기 레져</a></li>
	</ul>
  </div>
	<section id="main_jeonsi_section1">
	
		<nav id="nav1">
			<ul> <b>
				<li>All</li>
				<li>뮤지컬</li>
				<li>콘서트</li>
				<li>연극</li>
				<li>테마파크</li>
				<li>전시</li>
				<li>레저</li>
				<li>관람</li>
			</b>
			</ul>
		</nav>
		<nav id="nav2">
			<ul> <b>
				<li><img src="image\랭킹마크.png" id="ranking">랭킹</li>
				<li><img src="image\지역마크.png" id="ranking">지역</li>
				</b>
			</ul>
		</nav>
	</section>
	<br>
	<section id="main_jeonsi_section2">
		
		<strong style="font-size: 22px; margin-left:10px ;" id="popular_magazine"> 인기매거진</strong>
		<div id="slideShow" style="margin-top: 5px;">
			<ul class="slides">
				<li class="magazine"><img src="image\인기매거진1.png" alt=""></li>
				<li class="magazine"><img src="image\인기매거진2.png" alt=""></li>
				<li class="magazine"><img src="image\인기매거진3.png" alt=""></li>
				<li class="magazine"><img src="image\인기매거진4.png" alt=""></li>
				<li class="magazine"><img src="image\인기매거진5.png" alt=""></li>
				<li class="magazine"><img src="image\인기매거진6.png" alt=""></li>
				<li class="magazine"><img src="image\인기매거진7.png" alt=""></li>
				<li class="magazine"><img src="image\인기매거진8.png" alt=""></li>
			</ul>
			<p class="controller">
				<span class="prev" ><img src="image\arrow_left.png"></span>
				<span class="next"><img src="image\arrow_right.png"></span>
			</p>
		</div>
	</section>
	<br>

	<section id="main_jeonsi_section3">
	<strong style="font-size: 22px;" id="popular_category"> 인기카테고리</strong>
	<nav>
		<ul>
			<li><img src="image\레저티켓마크.png"><br>레저/티켓</li>
			<li style="margin-top: 8px;"><img src="image\스파워터파크마크.png"><br>스파/워터파크</li>
			<li style="margin-top: 2px;"><img src="image\스키장마크.png"><br>스키장</li>
			<li style="margin-top: 6px;"><img src="image\테마파크마크.png"><br>테마파크</li>
			<li style="margin-top: 6px;"><img src="image\전시예매마크.png"><br>전시예매</li>
			<li style="margin-top: 12px;"><img src="image\더보기마크.png"><br>더보기</li>
			<br>
		</ul>
	</nav>
	</section>
	<br>
	<section id="main_jeonsi_section4">
		<strong style="font-size: 22px;" id="popular_performance"> 인기 공연</strong><br>

		<nav>
			<p class="categori_icon" style="margin-left: 80px;"><img src="image\button_icons02.png" id="icon1"></p>
			<p class="categori_icon"><img src="image\button_icons03.png" id="icon2"></p>
			<p class="categori_icon" ><img src="image\button_icons04.png" id="icon3"></p>
			<p class="categori_icon" style="margin-right: 500px;"><img src="image\button_icons05.png" id="icon4"></p>
			<br>
			<br>
			<ul class="sangpum_detail">
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				
			</ul>
		</nav>

	</section>
	<section id="main_jeonsi_section5">
		<strong style="font-size: 22px;" id="popular_leisure"> 인기 레져</strong><br>
		<nav>
			<p class="categori_icon" style="margin-left: 80px;"><img src="image\button_icons06.png" id="icon6"></p>
			<p class="categori_icon"><img src="image\button_icons07.png" id="icon7"></p>
			<p class="categori_icon" ><img src="image\button_icons08.png" id="icon8"></p>
			<p class="categori_icon" style="margin-right: 700px;"><img src="image\button_icons09.png" id="icon9"></p>
			<br>
			<ul class="sangpum_detail2">
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				<li>상품명<br>별점:<br>가격:</li>
				
			</ul>
		</nav>

	</section>

	<jsp:include page="footer.jsp"/>

</body>
</html>