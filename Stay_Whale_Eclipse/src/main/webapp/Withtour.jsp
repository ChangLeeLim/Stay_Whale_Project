<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Withtour</title>
	<link rel="stylesheet" type="text/css" href="css/withtour.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/withtour.js"></script>
	
	
	
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
		<div id="image_main"> 메인이미지
			<div id="search_bar"> 검색바</div>
			<div id="search_filter">검색필터</div>
			<div id="button_search"> 검색버튼</div>
			<div id="button_total"> 전체보기 버튼</div>
		</div>

		<div id="bottom_frame">
			<div id="article_frame">
				<div id="bottom_article1">최신글</div>
				<div id="bottom_article2"> 테마별</div>
			</div>
			<div id="article_frame2">
				<div id="bottom_article3">리뷰</div>
			</div>

			
		</div>



	</section>












	<jsp:include page="footer.jsp"/>

</body>
</html>