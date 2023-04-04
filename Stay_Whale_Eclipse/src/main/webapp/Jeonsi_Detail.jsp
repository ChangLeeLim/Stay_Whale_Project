<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Jeonsi_Detail</title>
	<link rel="stylesheet" type="text/css" href="css/jeonsi_detail.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/jeonsi_detail.js"></script>
	
	
	
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
	<section id="main_center">
		<div class="main_center_top">
			<strong  class="main_center_text">기획전</strong>
			<ul>
			<li class="main_center_contents">
				<div class="main_center_contents_chart"></div>
				<div class="main_center_contents_chart"></div>
				<h2 style="text-align: center;">자세히보기</h2>
			</li>
			<li class="main_center_contents2">
				<div class="main_center_contents_chart"></div>
				<div class="main_center_contents_chart"></div>
				<h2 style="text-align: center;">자세히보기</h2>
			</li>
			</ul>
		</div>
		<br><br>

		<div class="main_bottom">
			<strong  class="main_bottom_text">요즘 HOT한 상품</strong>
			<div class="main_bottom_center">
				<ul>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
					<li > 전시/행사정보 및 가격</li>
				</ul>
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>

</body>
</html>