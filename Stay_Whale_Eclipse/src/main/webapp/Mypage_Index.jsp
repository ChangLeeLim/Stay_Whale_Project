<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="DTO.Members" %>
<%@ page import="DAO.DBProcess_Members" %>
<%@ page import="DTO.Bulletin_Board_Camptip" %>
<%@ page import="DAO.DBProcess_Camptip" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
  <meta charset="utf-8">
  <title>STAY WHALE || MyPage</title>
  <link rel="stylesheet" type="text/css" href="css/mypage_index.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<body>
	<jsp:useBean id="ob" class="DTO.Members"> </jsp:useBean>
	<jsp:useBean id="db" class="DAO.DBProcess_Members"> </jsp:useBean>
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
	
	<main>
		<!-- title -->
		<div class="wrap_section">
			<div class="wrap_title"><h2>내 정보 관리</h2></div>
			<div class="wrap_side">
				<aside>
					<ul>
						<li data-content-id="id1" class="selected"><a href="Mypage_Index.jsp">HOME</a></li>
						<li data-content-id="id2"><a href="Mypage_Info.jsp">내정보관리</a></li>
						<li data-content-id="id3"><a href="Mypage_Reserve.jsp">예약/취소내역</a></li>
						<li data-content-id="id4"><a href="Mypage_Wishlist">위시리스트</a></li>
						<li data-content-id="id5"><a href="Mypage_Event">EVENT</a></li>
					</ul>
				</aside>
			</div>
			<!-- content -->
			<div class="wrap_content">
				<div class="wrap_1">
					<section class="info_sec">	
						<div role="dialog" class="user_info">
							<img src="image/mypage_logo.png" alt="프로필 사진">					
						</div>	        	
				        <form action="Mypage_Info.jsp" method="post">
				        <% ArrayList<Members> list = db.db_SelectMain(id);
							for(int i=0; i<list.size(); i++) {
						%>
				       		<table>
					       		<tr>
					       			<td>
					       				<label>아이디</label>
				        				<input type="text" id="user_id" name="user_id" value="<%= list.get(i).getUser_id()%>" readonly> <!-- 로그인된 ID 출력 -->
				        			</td>
				        		</tr>
				        		<tr>
				             		<td>
					        			<label>이름</label>
					        			<input type="text" id="user_name" name="user_name" value="<%= list.get(i).getName()%>" readonly>
					        		</td>
					        	</tr>
					       		<tr>
					       			<td>
					       				<label>닉네임</label>
					       				<input type="text" id="user_nickname" name="user_nickname" value="<%= list.get(i).getNickname()%>" readonly>
					       			</td>
					       		</tr>
					       		<tr>	
					       			<td>
										<label>휴대폰</label>
				        				<input type="text" id="hp1" name="hp1" value="<%= list.get(i).getHp()%>" readonly>		        					
				        			</td>
				        		</tr>
					        </table>
					        <%} %>
				        	<input type="submit" class="submit_button" value="수정하기"> <!-- 수정페이지로 가기전 비밀번호 확인 -->	
				       	</form>
					</section>
				
					<section class="pay_sec">
						<div class="box_1">
							<div class="box_1title"> 최근예약내역</div>
							<div class="box_1body"><a href="#"><img src="image/예약내역1.png" alt="이미지 준비중"></a></div>		
						</div>			
						<div class="box_1">
							<div class="box_1title"> 최근취소내역</div>
							<div class="box_1body2"><a href="#"><img src="image/예약내역2.png" alt="이미지 준비중"></a></div>
						</div>
					</section>	
				</div>	
				
				<div class="wrap_2">
					<section class="wish_sec">
						<div class="wish_sec_title">위시리스트</div>
						<div class="box_2"> <a href="#"><img src="image/예약내역3.png" alt="이미지 준비중"></a> </div>
						<div class="box_date">
							<label style="margin: 0px 5px 5px 0px;" for="check_in"> Check-in Date </label>
							<input style="margin: 0px 5px 5px 0px;" type="date" id="check_in" name="check_in">
						</div>
						<div class="box_date">
							<label style="margin: 0px 5px 5px 0px;" for="check_out"> Check-out Date </label>
							<input style="margin: 0px 5px 5px 0px;" type="date" id="check_out" name="check_out">
						</div>	
						<div class="box_2"> <a href="#"><img src="image/예약내역5.png" alt="이미지 준비중"></a> </div>
						<div class="box_date">
							<label style="margin: 0px 5px 5px 0px;" for="check_in"> Check-in Date </label>
							<input style="margin: 0px 5px 5px 0px;" type="date" id="check_in" name="check_in">
						</div>
						<div class="box_date">	
							<label style="margin: 0px 5px 5px 0px;" for="check_out"> Check-out Date </label>
							<input style="margin: 0px 5px 5px 0px;" type="date" id="check_out" name="check_out">
						</div>
					</section>
						
					<section class="board_sec">	
						<div class="wish_sec_title">최근 리뷰 / 문의 내역</div>
						<div class="box_3">
						<% ArrayList<Bulletin_Board_Camptip> list2 = db.db_SelectBoard(id);
						for(int i=0; i<list2.size(); i++) {
						%>
							<div class="board_box">
							  <table class="board">
							  	<thead>
							  		<tr>
										<th style="background-color : #eeeeeee; text-align:center; width: 30%;">제목</th>
										<th style="background-color : #eeeeeee; text-align:center; width: 15%;">유형</th>
										<th style="background-color : #eeeeeee; text-align:center; width: 20%;">작성일</th>
										<th style="background-color : #eeeeeee; text-align:center; width: 10%;">조회</th>
										<th style="background-color : #eeeeeee; text-align:center; width: 10%;">추천</th>
								  	</tr>	
							  	</thead>
							  	<tbody>
							  		<tr onclick="location.href='Camptip_Read.jsp?post_num=<%= list2.get(i).getPost_num() %>'">
							  			<td><%= list2.get(i).getPost_title() %></td>
							  			<td><%= list2.get(i).getPost_category() %></td>
							  			<td><%= list2.get(i).getPost_date() %></td>
							  			<td><%= list2.get(i).getPost_readcount() %></td>
							  			<td><%= list2.get(i).getPost_like() %></td>
								  	</tr>
								  </tbody>
								</table>
							</div>
						<% }%>
						</div>
						<div class="box_3">
							<div class="board_box">
								<div class="cs_title">1:1 문의</div>
								<div class="cs_body">
									<table class="board">
							  			<thead>
							  				<tr>
												<th style="background-color : #eeeeeee; text-align:center; width: 30%;">제목</th>
												<th style="background-color : #eeeeeee; text-align:center; width: 15%;">유형</th>
												<th style="background-color : #eeeeeee; text-align:center; width: 20%;">작성일</th>
												<th style="background-color : #eeeeeee; text-align:center; width: 10%;">조회</th>
												<th style="background-color : #eeeeeee; text-align:center; width: 10%;">추천</th>
										  	</tr>	
									  	</thead>
									  	<tbody>
									  		<tr onclick="location.href='Bulletin_Board_Inquiry.jsp'">
									  			<td></td>
									  			<td></td>
									  			<td></td>
									  			<td></td>
									  			<td></td>
										  	</tr>
										  </tbody>
									</table>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>	
		</div>		
	</main>
	
	<jsp:include page="footer.jsp"/>
	
	<script src="js/mypage_index.js"></script>
</body>
</html>