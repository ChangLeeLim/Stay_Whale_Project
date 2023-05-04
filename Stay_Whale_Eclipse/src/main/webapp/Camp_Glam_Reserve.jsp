<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*" %>
<%@ page import="vo.Camping_ALL" %>
<%@ page import="vo.Bulletin_Board_Review" %>
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
    
    ArrayList<Object> articleList = (ArrayList<Object>)request.getAttribute("articleList");
    
 	// 캠프 리스트 꺼내오기
    ArrayList<Camping_ALL> campList = (ArrayList<Camping_ALL>) articleList.get(0);
    // 리뷰 리스트 꺼내오기
    ArrayList<Bulletin_Board_Review> reviewList = (ArrayList<Bulletin_Board_Review>) articleList.get(1);
    
    String st="";
	st = campList.get(0).getAcc_picture();
	String[] stlist = st.split(",");    
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
				
					<div class="main_image">
					<% 
					out.println("<div><img id='selected_image' class='selected_image' src='image/"+ stlist[0] +"' alt='이미지 준비중'></div>");
  					%>	
					</div>
					<div class="image_list">
						<ul>
							<li>
					  		<% 					  		
					  		for(int i=0;i<stlist.length;i++){
					        out.println("<img class='list_image' src='image/"+ stlist[i] +"' alt='이미지 준비중'>");
					  		}
					  		%>
					  		</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="top_right">
				<div>
					<div class="top_right_name">
						<h1><% out.println(campList.get(0).getAcc_name()); %></h1>
					</div>
					<div class="top_right_location">
  						<h3><% out.println(campList.get(0).getSite_1() + " " + campList.get(0).getSite_2() + " " + campList.get(0).getLocation()); %></h3>
					</div>
					<div class="top_right_detail">
						캠핑장 설명<br>
						<% out.println(campList.get(0).getDetail()); %>
					</div>
					<div class="top_right_any">
						캠핑장 지원 서비스<br/>
						<% out.println(campList.get(0).getRoom_detail());%>
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="contant_nav">
			<button type="button" id="reserve" class="nav_button" data-content-id="1">객실 안내 / 예약</button>
			<button type="button" id="infomation" class="nav_button" data-content-id="2">숙소 정보</button>
			<button type="button" id="review" class="nav_button" data-content-id="3">리 뷰</button>
		</div>
      <!-- 객실 안내 / 예약 출력 -->
		<div class="content">
      		<section id="room_section" class="room_section" style="display: block">
        		<div class="room_title">
        			<h2>객실 정보</h2>
        		</div>
        		<div class="room_content">
        		
	        		<div class="room_container">
			        	<ul>
							<%
							DecimalFormat df = new DecimalFormat("#,###");

							for(int i=0; i<campList.size(); i++) {
							    int price = campList.get(i).getPrice();
							    String formattedPrice = df.format(price);
							%>
							
							<li>
							    <div>
							        <div><img src="image/<%=campList.get(i).getFacility_picture()%>" alt="이미지 준비중"></div>
							    </div>
							    <div>
							        <div><b><%=campList.get(i).getFacility_name()%></b></div>
							        <div><b><%=formattedPrice%>원</b></div>
							        <div>
							            <a href="camping_payment.cp?facility_num_c=<%=campList.get(i).getFacility_num_c()%>&price=<%=campList.get(i).getPrice()%>">
							                <button class="reserve_button">예약하기</button>
							            </a>
							        </div>
							    </div>
							</li>
							<%
							}
							%>					 
						</ul>
			       	</div>
			     </div>
			</section>
			
			<section id="camping_info" class="camping_info" style="display:none">
				<div class="camping_info_title">
        			<h2>캠핑장 정보</h2>
        		</div>
				<div class="camping_infomation">
					<ul>
						<li class="infomation_left">	
				    		<div><h3>기본정보</h3></div><br/>
					        <div><b>입실 : 15:00 | 퇴실 : 12:00<br/> 22시 이후 입실 시 사전문의 (필수)<br/>무료 Wi-Fi<br/>전 객실 금연<br/>주차 가능<br/>캠핑장 픽업 (사전예약 및 문의필수)</b></div><br/>
					        <div><b>숙박일 기준 8일전 : 100% 환불<br/> 숙박일 기준 7~5일전 : 90%<br/> 환불 숙박일 기준 4일전 : 80%<br/> 환불 숙박일 기준 3일전 : 70%<br/>
					        환불 숙박일 기준 2일전 : 50%<br/> 환불 숙박일 기준 1일전 : 30%<br/> 환불 숙박일 당일 및 No-show : 환불불가<br/> 취소, 환불 시 수수료가 발생할 수 있습니다.</b></div><br/>
				        </li>
			       		<li class="infomation_right">
			       			<div><h3>업체정보</h3></div><br/>
				       		<div>상호명 : <% out.println(campList.get(0).getAcc_name());%></div>
					        <div>주소 : <% out.println(campList.get(0).getSite_1()+" "+campList.get(0).getSite_2()+" "+campList.get(0).getLocation());%></div>
					        <div>전화번호 : <% out.println(campList.get(0).getTel_no());%></div>
					        <div>E-MAIL : <% out.println(campList.get(0).getEmail());%></div>
					        <div class="infomation_map">찾아오시는 길 추가예정</div>
			       		</li>
			       	</ul>
			     </div>
				
			</section>
			
			<section id="review_info" class="review_info" style="display:none">
				<div class="review_info_title">
        			<h2>캠핑장 리뷰</h2>
        		</div>
        		<div class="review_infomation">
        			<ul>
        			<% for(int i=0; i<reviewList.size(); i++) { %>
        				<li>
		        			<div class="review_div1"><strong>
		        				작성자 <% out.println(reviewList.get(i).getUser_id());%>&nbsp; 
		        				★<% out.println(reviewList.get(i).getPost_rating());%>&nbsp; 
								<% out.println(reviewList.get(i).getPost_date().toString().substring(0, 10)); %> &nbsp; 
		        				</strong>
		        			</div>
		        			<div class="review_div2">
		        				<% out.println(reviewList.get(i).getPost_title());%>
		        			</div>
		        			<div class="review_div3">
		        				<img alt="이미지 준비중" src="CampingUpload/<% out.println(reviewList.get(i).getPost_file());%>">
							</div>
		        			<div class="review_div4">
		        				<% out.println(reviewList.get(i).getPost_body());%><br/><br/>
		        			</div>
        				</li>
        				<% } %>
        			</ul>	
        		</div>
			</section>
				
		</div> 
    </main>

    <!-- 푸터 영역 -->
    <jsp:include page="footer.jsp"/>
    <!-- 스크립트 -->
    <script type="text/javascript" src="js/camp_glam_reserve.js"></script>
  
  </body>
</html>
