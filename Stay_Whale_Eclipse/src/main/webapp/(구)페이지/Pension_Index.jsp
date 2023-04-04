<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Pension</title>
	<link rel="stylesheet" type="text/css" href="css/pension_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/pension_index.js"></script>
	
	
	
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

	<section>
		<div class="top_info_wrap">
			<nav>
				<ul class="theme_list">
					<li>아이콘1</li>
					<li>아이콘2</li>
					<li>아이콘3</li>
					<li>아이콘4</li>
					<li>아이콘5</li>
					<li>아이콘6</li>
					<li>아이콘7</li>
					<li>아이콘8</li>
					<li>아이콘9</li>
					<li>아이콘10</li>
				</ul>
			</nav>
		</div>
		<div class="map_wrap">
			<div class="map">지도</div>
			<ul>
				<li>숙소1</li>
				<li>숙소2</li>
				<li>숙소3</li>
				<li>숙소4</li>
				<li>숙소5</li>
			</ul>
		</div>
		<div class="map_search_wrap">
			<div id="search_text" class="text1">여행지</div>
			<div id="search_text" class="text2">입실 날짜</div>
			<div id="search_text" class="text3">퇴실 날짜</div>
			<div id="search_text" class="text4">확인</div>
			<div id="search_text" class="text5">상세검색</div>
		</div>
		<div class="event_info_wrap">
			<div class="event_main">끝나가는 행사</div>
			<ul>
				<li>진행중인 행사</li>
				<li>진행중인 행사</li>
				<li>진행중인 행사</li>
				<li>진행중인 행사</li>
			</ul>
		</div>
	</section>

	<jsp:include page="footer.jsp"/>
</body>
</html>