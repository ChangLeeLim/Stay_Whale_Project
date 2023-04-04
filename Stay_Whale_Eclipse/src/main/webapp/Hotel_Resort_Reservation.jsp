<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || Hotel Resort Reservation</title>
	<link rel="stylesheet" type="text/css" href="css/hotel_resort_reservation.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/hotel_resort_reservation.js"></script>
	
	
	
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
				<div class="top_info_left">
					<nav>
						<ul>
							<li class="main_photo">사진1</li>
							<div class="sub_photo_list">
								<li class="sub_photo">사진2</li>
								<li class="sub_photo">사진3</li>
								<li class="sub_photo">사진4</li>
								<li class="sub_photo">사진5</li>
							</div>
						</ul>
					</nav>
				</div>
				<div class="top_info_right">
					<nav>
						<ul>
							<li class="sub_conten1">5성급</li>
							<li class="sub_conten2">호텔명</li>
							<li class="sub_conten3">찜</li>
							<br>
							<li class="sub_conten4">평점</li>
							<br>
							<li class="sub_conten5">주소</li>
							<br>
						</ul>
						<textarea class="sub_conten6">호텔 소개</textarea>
					</nav>
				</div>
			</div>
			<div class="center_info_wrap">
				<div class="center_btlist">
					<nav>
						<ul>
							<a href="Hotel_Resort_Reservation.html"><li>객실안내</li></a>
							<a href="Hotel_Resort_Reservation2.html"><li>숙소정보</li></a>
							<a href="Hotel_Resort_Review.html"><li>Review</li></a>
						</ul>
					</nav>
				</div>
				<div class="center_info_calen">
					<div class="center_info_cal">
						<div><b>날짜</div>
							<form>
								  <select name="날짜 / 달력" >
								    <option value="none">날짜 선택</option>
								  </select>
							</form>
						</div>
					</div>
				</div>
				<div class="bot_info_wrap">
					<div class="bot_info_box">
						<ul>
							<li class="bot_photo">사진</li>
							<li class="bot_name">방 이름</li>
							<li class="bot_price">가격</li>
							<li class="bot_won">330,000</li>
							<li class="bot_roominfo">객실 상세 정보 확인</li>
							<li class="bot_roominfobt">정보확인</li>
							<li class="bot_resev">예약</li>
						</ul>
					</div>
					<div class="bot_info_box">
						<ul>
							<li class="bot_photo">사진</li>
							<li class="bot_name">방 이름</li>
							<li class="bot_price">가격</li>
							<li class="bot_won">330,000</li>
							<li class="bot_roominfo">객실 상세 정보 확인</li>
							<li class="bot_roominfobt">정보확인</li>
							<li class="bot_resev">예약</li>
						</ul>
					</div>
					<div class="bot_info_box">
						<ul>
							<li class="bot_photo">사진</li>
							<li class="bot_name">방 이름</li>
							<li class="bot_price">가격</li>
							<li class="bot_won">330,000</li>
							<li class="bot_roominfo">객실 상세 정보 확인</li>
							<li class="bot_roominfobt">정보확인</li>
							<li class="bot_resev">예약</li>
						</ul>
					</div>
				</div>
		</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>