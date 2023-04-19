<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="camping.Room_Info_Camping" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
  <meta charset="utf-8">
  <title>STAY WHALE || Camp_Glam</title>
  <link rel="stylesheet" type="text/css" href="css/camp_glam_reserve.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33a2b44e211b174550a0f064c970415d"></script>
</head>
<body>
 <%
    request.setCharacterEncoding("utf-8");
    String id = (String)session.getAttribute("id");
    String reg_num_c = request.getParameter("reg_num_c");
    ArrayList <Room_Info_Camping> roomList = (ArrayList<Room_Info_Camping>)request.getAttribute("roomList");
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

    <!-- 메인 -->
    <main>
    	
      	<!-- accmodation_camping 출력 -->
		<div class="top">
			<div class="top_left">
				<div>
				
					<div>
						<ul>
							<li>
							
							</li>
						</ul>
					</div>
					<div>
						<ul>
							<li>
							
							</li>
						</ul>
					</div>
					
				</div>
			</div>
			
			<div class="top_right">
				<div>
					<div></div>
					<div></div>
					<div></div>
				</div>
			</div>
		</div>
		<div>
			<button><span>객실 안내 / 예약</span></button>
			<button><span>숙소 정보</span></button>
			<button><span>리 뷰</span></button>
		</div>
      <!-- room_info_camping 출력 -->
		<div class="content">
      		<section class="room_section">
        		<div class="room_title">
        			<h2>객실 정보</h2>
        		</div>
        		<div class="room_content">
        		
	        		<div class="room_container">
			        	<ul>
<% 
					for(int i=0; i<roomList.size(); i++) {
				            out.println("<li>");
				            out.println("<div>");
				            out.println("<div><img src='image/"+ roomList.get(i).getFacility_picture() +"' alt='이미지 준비중'></div>");
				            out.println("</div>");
				            out.println("<div>");
				            out.println("<div>"+roomList.get(i).getFacility_name()+"</div>");
				            out.println("<div>"+roomList.get(i).getPrice()+"</div>");
				            out.println("<div>"+roomList.get(i).getDetail_r()+"</div>");
				            out.println("<div>"+roomList.get(i).getStandard_amount()+"</div>");
				            out.println("<div>");
				            out.println("<a href='camping_payment.cp?facility_num_c="+roomList.get(i).getFacility_num_c()+"&price="+roomList.get(i).getPrice()+"'>");
				            out.println("<button class='reserve_button'>예약하기</button></a></div>");
				            out.println("</div>");
				            out.println("</li>");
					} 
%>
						</ul>
			       	</div>
			     </div>
			</section>
				
		</div> 
    </main>

    <!-- 푸터 영역 -->
    <jsp:include page="footer.jsp"/>
    <!-- 스크립트 -->
    <script type="text/javascript" src="camp_glam_reserve.js"></script>
  
  </body>
</html>
