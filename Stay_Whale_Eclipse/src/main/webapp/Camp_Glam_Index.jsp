<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.Accmodation_Camping" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
  <meta charset="utf-8">
  <title>STAY WHALE || Camp_Glam</title>
  <link rel="stylesheet" type="text/css" href="css/camp_glam_index.css">
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33a2b44e211b174550a0f064c970415d&libraries=services"></script>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
    String id = (String)session.getAttribute("id"); 
    ArrayList<Accmodation_Camping> campList = (ArrayList<Accmodation_Camping>)request.getAttribute("articleList");
    
    ArrayList<Accmodation_Camping> searchPlaceList = (ArrayList<Accmodation_Camping>)request.getAttribute("searchPlaceList");
    ArrayList<Accmodation_Camping> searchDateList = (ArrayList<Accmodation_Camping>)request.getAttribute("searchDateList");
    
    
    if(searchPlaceList != null && campList == null && searchDateList==null){
    	campList = searchPlaceList;
    }else if(searchPlaceList == null && campList == null && searchDateList != null){
    	campList = searchDateList;
    	String ss =campList.get(4).getCategory();
    	out.println(ss);
    }
    
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
    	
      	<!-- 타이틀 및 추천 상품 -->
		<div class="title">
			<h1><a href="Camp_Glam_Index.cp">STAY WHALE</a></h1>
			<p>캠핑 / 글램핑</p>
			<a href="Camp_Glam_Index.cp">
				<button class="cta_button">추천 상품 바로가기</button>
			</a>
			<div class="slider_controls">
				<button id="prevButton">이전</button>
				<button id="nextButton">다음</button>
			</div>
		</div>
	
      <!-- 조건별 검색 -->
		<div class="content">      	
	      
	      	<section class="reserve_section">
	      	
				<div class="reserve_title"> 캠핑 테마</div>
				
				<div class="reserve_content">
					<form id="search_date" action="search_date.cp" method="post">
						<ul>
							<li>
								<div>
									<label style="margin: 0px 5px 5px 0px;" for="check_in"> Check-in Date </label>
									<label style="margin: 0px 5px 5px 0px;" for="check_out"> Check-out Date </label>
								</div>
								<div>
									<input style="margin: 0px 5px 5px 0px;" type="date" id="check_in" name="check_in" min="today" pattern="\d{4}-\d{2}-\d{2}" />
									<input style="margin: 0px 5px 5px 0px;" type="date" id="check_out" name="check_out" min="today" pattern="\d{4}-\d{2}-\d{2}" />
								</div>
								<div>
									<button type="submit" id="date_butoon" class="reservation_button"> 날짜 검색 </button>
								</div>
							</li>
						</ul>
					</form>
					<form id="search_place" action="search_place.cp" method="post">
						<ul>
							<li>
								<div class="sidogugun_label">
									<label style="margin-bottom: 5px;" for="sido1" style="margin-right:30px;">시/도</label>
									<label style="margin-bottom: 5px;" for="gugun1" >구/군</label>  
								</div>
								<div class="sidogugun_select">
									<select name="sido1" id="sido1"></select>
									<select name="gugun1" id="gugun1"></select>	
								</div>
								<div>
									<button type="submit" id="place_butoon" class="reservation_button"> 지역 검색 </button>
								</div>
							</li>
						</ul>
					</form>
				</div>
				<div class="reserve_content2">
					<nav>
						<button type="button" id="btn_camping" class="spot_button" data-content-id="1">Camp</button>
		        		<button type="button" id="btn_caravan" class="spot_button" data-content-id="2">Caravan</button>
		        		<button type="button" id="btn_glamping" class="spot_button" data-content-id="3">Glamping</button>
		        		<button type="button" id="btn_map" class="spot_button" data-content-id="4">Map</button>
		        	</nav>		
				</div>
			</section>	  
			
	      <!--캠핑 테마 및 메인상품 목록 -->
	      <section class="spots_section">			
	        <div class="spot_container">
	       
				<div id="content_camping" style="display: block">
					<ul>
<% 
					int camping=0;
					for(int i=0; i<campList.size(); i++) {
						if("Camping".equals(campList.get(i).getCategory())){
				            out.println("<li>");
				            out.println("<div>");
				            out.println("<div> <input type='hidden' value='"+campList.get(i).getReg_num_c() +"'>");
				            out.println("<a href='camping_reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<img src='image/"+ campList.get(i).getAcc_picture().split(",")[0] +"' alt='이미지 준비중'>");
				            out.println("</a> </div>");
				            out.println("</div>");
				            out.println("<div>");
				            out.println("<a><h2>"+campList.get(i).getAcc_name()+"</h2></a>");
				            out.println("<p><h3>"+campList.get(i).getSite_1()+"</h3></p>");
				            out.println("<div><h3>"+campList.get(i).getSite_2()+"</h3></div>");
				            if(campList.get(i).getRating() != 0.0){
				            	out.println("<div>★"+campList.get(i).getRating()+"</div>");
				            }else{
				            	out.println("<div>평점 없음</div>");
				            }
				            out.println("<div><a href='camping_reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<button class='spots_button'>예약하기</button>");
				           	out.println("</a></div>");
				           	out.println("</div>");
				            out.println("</li>");
				            camping++;
				            if(camping==8){
				            	break;
				            }
						} 
					} 
				
%>
					</ul>
				</div>
	        	
	          	<div id="content_caravan" style="display:none">
		        	<ul>
<% 
					int caravan=0;
					for(int i=0; i<campList.size(); i++) {
						if("Caravan".equals(campList.get(i).getCategory())){
							out.println("<li>");
				            out.println("<div>");
				            out.println("<div> <input type='hidden' value='"+campList.get(i).getReg_num_c() +"'>");
				            out.println("<a href='camping_reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<img src='image/"+ campList.get(i).getAcc_picture().split(",")[0] +"' alt='이미지 준비중'>");
				            out.println("</a> </div>");
				            out.println("</div>");
				            out.println("<div>");
				            out.println("<a><h2>"+campList.get(i).getAcc_name()+"</h2></a>");
				            out.println("<p><h3>"+campList.get(i).getSite_1()+"</h3></p>");
				            out.println("<div><h3>"+campList.get(i).getSite_2()+"</h3></div>");
				            if(campList.get(i).getRating() != 0.0){
				            	out.println("<div>★"+campList.get(i).getRating()+"</div>");
				            }else{
				            	out.println("<div>평점 없음</div>");
				            }
				            out.println("<div><a href='camping_reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<button class='spots_button'>예약하기</button>");
				           	out.println("</a></div>");
				           	out.println("</div>");
				            out.println("</li>");
				            caravan++;
				            if(caravan==8){
				            	break;
				            }
						}
					}
%>
		          	</ul>
	          	</div>
	          	<div id="content_glamping" style="display:none">
		        	<ul>
<% 
					int glamping=0;
					for(int i=0; i<campList.size(); i++) {
						if("Glamping".equals(campList.get(i).getCategory())){
							out.println("<li>");
				            out.println("<div>");
				            out.println("<div> <input type='hidden' value='"+campList.get(i).getReg_num_c() +"'>");
				            out.println("<a href='camping_reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<img src='image/"+ campList.get(i).getAcc_picture().split(",")[0] +"' alt='이미지 준비중'>");
				            out.println("</a> </div>");
				            out.println("</div>");
				            out.println("<div>");
				            out.println("<a><h2>"+campList.get(i).getAcc_name()+"</h2></a>");
				            out.println("<p><h3>"+campList.get(i).getSite_1()+"</h3></p>");
				            out.println("<div><h3>"+campList.get(i).getSite_2()+"</h3></div>");
				            if(campList.get(i).getRating() != 0.0){
				            	out.println("<div>★"+campList.get(i).getRating()+"</div>");
				            }else{
				            	out.println("<div>평점 없음</div>");
				            }
				            out.println("<div><a href='camping_reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<button class='spots_button'>예약하기</button>");
				           	out.println("</a></div>");
				           	out.println("</div>");
				            out.println("</li>");
				            glamping++;
				            if(glamping==8){
				            	break;
				            }
						}
					}
%>
		          	</ul>
	          	</div >

	          	<div id="content_map" style="display:none">
	          		<input type="text" id="keyword" placeholder="장소 검색">
					<button onclick="placeSearch()">검색</button>	          		
					<div id="clickLatlng" class="map_clickLatlng"></div>
					<div id="map" class="map_container"></div>
				</div>
	          	
	      	</div>
	      </section>
	      
	      <!-- 오지 격지 캠핑 추천 섹션 -->
	     <section class="special_section">
	      	<article>
	      	
	      		<div class="specail_main">
	      			<div class="special_title">
	      				<button style="margin-right: 10px;" class="move_button"><span>☾</span></button>
	        			<h2>SPECIAL CAMPING</h2>
	        			<button style="margin-left: 10px;" class="move_button"><span>☽</span></button>
	     			</div>
	      			<div class="special_body">
	      				<div class="move_main">
	      					<ul>
							<% 	     
							int backcountry =0;
							for(int i=0; i<campList.size(); i++) {
								if("Backcountry".equals(campList.get(i).getCategory())){
									out.println("<li>");
						            out.println("<div>");
						            out.println("<div> <input type='hidden' value='"+campList.get(i).getReg_num_c() +"'>");
						            out.println("<a href='camping_reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
						            out.println("<img src='image/"+ campList.get(i).getAcc_picture() +"' alt='이미지 준비중'>");
						            out.println("</a> </div>");
						            out.println("</div>");
						            out.println("<div class='move_main_body'>");
						            out.println("<div>"+campList.get(i).getAcc_name()+"</div>");
						            out.println("<div>"+campList.get(i).getSite_1()+" "+campList.get(i).getSite_2()+"</div>");
						           	out.println("</a></div>");
						            out.println("</li>");
						            glamping++;
						            if(glamping==8){
						            	break;
						            }
								}
							}
								%>					          	
	      					</ul>
	      				</div>
	      			</div>
	      		</div>
	      	</article>	
	      </section>
	      
	     <!-- 캠핑 팁 섹션 --> 
	      <section class="board_section">
	      	<article>
				
				<div class="board_title">Camping Tip</div>
					
					<div class="board_hot">
						<ul>
							<li>
								<div>
		            				<div>
		            					<a href=""><img src="image/캠핑팁2.png" alt="이미지 준비중"></a>
		            				</div>
		            			</div>
		            			<div>
		            				<a href="">board_title</a>
		            				<p>user_id</p>
		            				<div>추천수</div>
		            				<div>조회수</div>
		            				<div><a href=""><button class="board_button">Tip Check</button></a></div>
		            			</div>
							</li>
							<li>
								<div>
		            				<div>
		            					<a href=""><img src="image/캠핑음식2.png" alt="이미지 준비중"></a>
		            				</div>
		            			</div>
		            			<div>
		            				<a href="">board_title</a>
		            				<p>user_id</p>
		            				<div>추천수</div>
		            				<div>조회수</div>
		            				<div><a href=""><button class="board_button">Tip Check</button></a></div>
		            			</div>
							</li>
							<li>
								<div>
		            				<div>
		            					<a href=""><img src="image/캠핑음식4.png" alt="이미지 준비중"></a>
		            				</div>
		            			</div>
		            			<div>
		            				<a href="">board_title</a>
		            				<p>user_id</p>
		            				<div>추천수</div>
		            				<div>조회수</div>
		            				<div><a href=""><button class="board_button">Tip Check</button></a></div>
		            			</div>
							</li>
							<li>
								<div>
		            				<div>
		            					<a href=""><img src="image/캠핑팁1.png" alt="이미지 준비중"></a>
		            				</div>
		            			</div>
		            			<div>
		            				<a href="">board_title</a>
		            				<p>user_id</p>
		            				<div>추천수</div>
		            				<div>조회수</div>
		            				<div><a href=""><button class="board_button">Tip Check</button></a></div>
		            			</div>
							</li>
							<li>
								<div>
		            				<div>
		            					<a href=""><img src="image/캠핑음식5.png" alt="이미지 준비중"></a>
		            				</div>
		            			</div>
		            			<div>
		            				<a href="">board_title</a>
		            				<p>user_id</p>
		            				<div>추천수</div>
		            				<div>조회수</div>
		            				<div><a href=""><button class="board_button">Tip Check</button></a></div>
		            			</div>
							</li>
						</ul>
					</div>							
				</article>
			</section>
				
		</div>
    </main>

    <!-- 푸터 영역 -->
    <jsp:include page="footer.jsp"/>
	<script src="js/camp_glam_index.js"></script>
  </body>
  
</html>
