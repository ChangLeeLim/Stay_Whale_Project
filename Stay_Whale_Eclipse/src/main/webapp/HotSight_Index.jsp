<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || HotSight</title>
	<link rel="stylesheet" type="text/css" href="css/hotsight_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/hotsight_index.js"></script>
	
	
	
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
	<div class="top_info_nav">
		<div>
		<nav>
			<ul class="top_info_left"> <b>
				<li>All</li>
				<li>서울</li>
				<li>강원도</li>
				<li>부산</li>
				<li>전라도</li>
				<li>제주도</li>
			</b>
			</ul>
		</nav>
	</div>
	<div class="top_info_right">
		<nav id="nav2">
			<ul> <b>
				<li><img src="image\랭킹마크.png" id="ranking">랭킹</li>
				<li><img src="image\지역마크.png" id="ranking">지역</li>
				</b>
			</ul>
		</nav>
	</div>
</div>
<br>
<div class="main_top">
	<h2>지역별 명소</h2>	
</div>
<br>
<div class="main_center">
		<div class="main_center_li" style=" margin-left: 150px;"> 
		<div class="main_center_li_li"> </div> <h2 style="line-height:50px ; text-align: center;"> 명소 바로가기</h2></div>
		<div class="main_center_li"> 
		<div class="main_center_li_li"> </div> <h2 style="line-height:50px ; text-align: center;"> 명소 바로가기</h2></div>
		<div class="main_center_li" > 
		<div class="main_center_li_li"> </div> <h2 style="line-height:50px ; text-align: center;"> 명소 바로가기</h2></div>

		<div class="main_center_liright" style=" margin-left: 155px;" > 
		<div class="main_center_li_liright"> </div> <h2 style="line-height:50px ; text-align: center;"> 명소 바로가기</h2></div>
		<div class="main_center_liright" > 
		<div class="main_center_li_liright"> </div> <h2 style="line-height:50px ; text-align: center;"> 명소 바로가기</h2></div>
		
</div>	
</section>










	<jsp:include page="footer.jsp"/>
</body>
</html>