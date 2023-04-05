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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/withtour.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/withtour.css">
	
	
	
	
	
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

		<div id="topWrap">
			<div id="topCont">
				<div id="userInfo">
				
					<div id="profilePic" class="cercle"></div>
						<div id="nickWrap">
							<div id="nickName">
								<p>Sam Smith Unholy</p>
				
							</div>
							<div id="follwerBtn">팔로우</div>
							<div id="others"></div>
							<div id="userStatus">
								<ul>
									<li>jdj881204</li>
									<li>0명 팔로우</li>
									<li>20명의 팔로워</li>	
								</ul>
							</div>
					
					
						</div>
					<div id="currentActivity">
						<ul>
							<li> 게시글 0개</li>
							<li> 업로드한 사진 0개</li>
							<li> 리뷰 0개</li>
							<li> 다이어리 1개</li>
						</ul>
					
					</div>
				</div>
			</div>
		</div>
		
		<div id="top_menuWrap">
			<div id="menuBar">
				<ul>
					<li>정보</li>
					<li>팔로우</li>
					<li>그룹</li>
					<li>사진</li>
					<li>메세지</li>
				</ul>
			</div>
		</div>

	<section id="section1">
		<div id="introWrap">
			<div id="introTitleWrap">
				<p>준비중인 일정</p>
				<div id="writeBtn"></div>
			</div>
				
			<textarea id="introCont"></textarea>
			<input type="button" value="확인" class="introBtn" id="confirm">
			<input type="button" value="취소" class="introBtn"id="cancel">
		</div>
		
		</section>
		
		<section id="section2">
		<div id="activityWrap">
			<div id="cont_titleWrap1">
				<p id="cont_title1">활동내역(대시보드)</p>
			</div>
			<div id="activityCont">
				<div id="pictureWrap">
					<div>
						<p>사진</p>
						<p>더보기</p>
					</div>
					<div id="picture">
						<div style="background-image: url('image/pic1.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic2.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic3.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic4.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic5.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic1.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic6.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic7.jpg'); background-position: center center; background-size: cover;"></div>
						<div style="background-image: url('image/pic1.jpg'); background-position: center center; background-size: cover;"></div>
						
					</div>
				</div>
				
				
				<div id="rightCont">
					<div id="hotelReview">
						<div>
							<p>작성한 리뷰</p>
							<p>더보기</p>
						</div>
						<div id="hotelReviewCont">
							<ul>
								<li>제목</li>
								<li>작성일</li>
								<li>조회수</li>
							</ul>
							<ul>
								<li>제주도 한달살기 후기.</li>
								<li>2023.12.12</li>
								<li>10</li>
							</ul>
							<ul>
								<li>제주도 한달살기 후기.</li>
								<li>2023.12.12</li>
								<li>10</li>
							</ul>
							<ul>
								<li>제주도 한달살기 후기.</li>
								<li>2023.12.12</li>
								<li>10</li>
							</ul>
							<ul>
								<li>제주도 한달살기 후기.</li>
								<li>2023.12.12</li>
								<li>10</li>
							</ul>
							
						</div>
						
					</div>
					
					
						<div id="alarm">
							<p>상태알림</p>
							<div id="container">
							<div class="toggle-switch">
								<input type="checkbox" id="chkTog4">
								<label for="chkTog4">
									<span class="toggle-track"></span>
								</label>
								</div>
							</div>
								
							<div id="alarmCont">
								<ul>
									<li>가입일</li>
									<li>2023.01.20</li>
								</ul>
								<ul>
									<li>이메일</li>
									<li>jdj881204@naver.com</li>
								</ul>
								
								<ul>
									<li>받은 메세지</li>
									<li>0건</li>
								</ul>
							
							</div>
				
							
						</div>	
						
						
				</div>
				
				<div id="bottomCont">
					<div id="diary">
						<div id="diaryTitle">
							<p>작성한 Diary</p>
							<p>더보기</p>
						</div>
						<div id="diaryCont">
							<div>
								<ul>
									<li>사진</li>
									<li>신나는 강원도 여행 나와함께1</li>
									<li>2023.12.12</li>
									<li>조회수 21</li>
									
								</ul>
							</div>
							<div>
								<ul>
									<li>사진</li>
									<li>신나는 강원도 여행 나와함께 </li>
									<li>2023.12.12</li>
									<li>조회수 21</li>
									
								</ul>
							</div>
							<div>
								<ul>
									<li>사진</li>
									<li>신나는 강원도 여행 나와함께짜 </li>
									<li>2023.12.12</li>
									<li>조회수 21</li>
									
								</ul>	
							</div>
				
						</div>
						
				
					</div>
					<div id="followeralarm">
						<div id="followeralarmTitle">
							<p>그룹현황</p>
						</div>
						<div id="followeralarmCont">
							<div>
								<ul>
									<li>d</li>
									<li>weojfwioejf</li>
									<li>여행준비중</li>
								</ul>
							</div>
							<div>
								<ul>
									<li>d</li>
									<li>weojfwioejf</li>
									<li>여행준비중</li>
								</ul>
							</div>
							<div>
								<ul>
									<li>d</li>
									<li>weojfwioejf</li>
									<li>여행준비중</li>
								</ul>
							</div>
							<div>
								<ul>
									<li>d</li>
									<li>weojfwioejf</li>
									<li>여행준비중</li>
								</ul>
							</div>
							<div>
								<ul>
									<li>d</li>
									<li>weojfwioejf</li>
									<li>여행준비중</li>
								</ul>
							</div>
							<div>
								<ul>
									<li>d</li>
									<li>weojfwioejf</li>
									<li>여행준비중</li>
								</ul>
							</div>
							<div>
								<ul>
									<li>d</li>
									<li>weojfwioejf</li>
									<li>여행준비중</li>
								</ul>
							</div>
						
						</div>
			
					</div>
							
				</div>
				
				 
			</div>
		</div>
		

		


	</section>












	<jsp:include page="footer.jsp"/>

</body>
</html>