<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="camping.ACC_Camping" %>
<%@ page import="vo.PageInfo" %>
<%@ page import="DTO.Bulletin_Board_Camptip" %>
<%@ page import="DAO.DBProcess_Camptip" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>

<html>
<head>
  <meta charset="utf-8">
  <title>STAY WHALE || Camp_Glam</title>
  <link rel="stylesheet" type="text/css" href="css/camp_glam_index.css">
</head>
<body>
	<jsp:useBean id="ob" class="DTO.Bulletin_Board_Camptip"> </jsp:useBean>
	<jsp:useBean id="db" class="DAO.DBProcess_Camptip"> </jsp:useBean>	
  <%
    request.setCharacterEncoding("utf-8");
    String id = (String)session.getAttribute("id"); 
    ArrayList <ACC_Camping> campList = (ArrayList<ACC_Camping>)request.getAttribute("articleList");
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
			<h1>STAY WHALE</h1>
			<p>캠핑 / 글램핑</p>
			<a href="Camp_Glam_Reserve.jsp">
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
									<input style="margin: 0px 5px 5px 0px;" type="date" id="check_in" name="check_in" min="today" />
									<input style="margin: 0px 5px 5px 0px;" type="date" id="check_out" name="check_out" min="today" />
								</div>
								<div>
								 <%-- <% out.println(campList.get(0).getAcc_picture()); %> --%>
									<button type="submit" id="date_butoon" class="reservation_button"> 날짜 검색 </button>
								</div>
							</li>
						</ul>
					</form>
					<form id="search_place" action="search_place.cp" method="post">
						<ul>
							<li>
								<div>
									<label style="margin-bottom: 5px;" for="sido1" style="margin-right:30px;">시/도</label>
									<label style="margin-bottom: 5px;" for="gugun1" >구/군</label>  
								</div>
								<div>
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
				            out.println("<a href='Camp_Glam_Reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<img src='image/"+ campList.get(i).getAcc_picture() +"' alt='이미지 준비중'>");
				            out.println("</a> </div>");
				            out.println("</div>");
				            out.println("<div>");
				            out.println("<a>"+campList.get(i).getAcc_name()+"</a>");
				            out.println("<p>"+campList.get(i).getSite_1()+"</p>");
				            out.println("<div>"+campList.get(i).getSite_2()+"</div>");
				            out.println("<div>"+campList.get(i).getDetail()+"</div>");
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
				            out.println("<a href='Camp_Glam_Reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<img src='image/"+ campList.get(i).getAcc_picture() +"' alt='이미지 준비중'>");
				            out.println("</a> </div>");
				            out.println("</div>");
				            out.println("<div>");
				            out.println("<a>"+campList.get(i).getAcc_name()+"</a>");
				            out.println("<p>"+campList.get(i).getSite_1()+"</p>");
				            out.println("<div>"+campList.get(i).getSite_2()+"</div>");
				            out.println("<div>"+campList.get(i).getDetail()+"</div>");
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
				            out.println("<a href='Camp_Glam_Reserve.cp?reg_num_c="+campList.get(i).getReg_num_c()+"'>");
				            out.println("<img src='image/"+ campList.get(i).getAcc_picture() +"' alt='이미지 준비중'>");
				            out.println("</a> </div>");
				            out.println("</div>");
				            out.println("<div>");
				            out.println("<a>"+campList.get(i).getAcc_name()+"</a>");
				            out.println("<p>"+campList.get(i).getSite_1()+"</p>");
				            out.println("<div>"+campList.get(i).getSite_2()+"</div>");
				            out.println("<div>"+campList.get(i).getDetail()+"</div>");
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
	      						<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지8.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
					          	<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지7.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
					          	<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지6.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
					          	<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지5.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
					          	<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지4.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
					          	<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지3.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
					          	<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지2.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
					          	<li>
		            				<div>
		            					<div>
		            						<a><img src="image/캠핑_오지1.png" alt="이미지 준비중"></a>
		            					</div>
		            				</div>
		            				<div class="move_main_body">
		            					<a>title</a>
		            					<p>spot</p>
					            	</div>
					          	</li>
	      					</ul>
	      				</div>
	      			</div>
	      		</div>
	      	</article>	
	      </section>
	      
	     <!-- 캠핑 팁 게시판 섹션 --> 
	      <section class="board_section">
	      	<article>
				
				<div class="board_title">Camping Tip</div>
					
				<form id="board_search" class="board_search" action="">
					<select id="search_select" class="search_select">
						<option>관련검색</option>
						<option>제목</option>
						<option>작성자</option>
					</select>	
					<input id="search_text" class="search_text" type="text" placeholder="검색">
					<button type="submit" class="search_button">검색</button>
					<!-- 게시물 작성은 회원만 넘어가도록 -->
					<% if (session.getAttribute("id") != null) { %>
					<a href="Camptip_Write.jsp" class="write_button">작성하기</a>
					<%
						} else {
					%>
					<button type="button" class="write_button" onclick="if(confirm('로그인 하세요'))location.href='Login.jsp';">작성하기</button>
					<%
						}
					%>	
					</form>
					
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
					
					<div class="board_list">
						<div class="board_main">
							<table class="board_table">
								<thead>
									<tr>
										<th style="background-color : #eeeeeee; text-align:center; width: 5%;">번호</th>
										<th style="background-color : #eeeeeee; text-align:center; width: 30%;">제목</th>
										<th style="background-color : #eeeeeee; text-align:center; width: 15%;">작성자</th>
										<th style="background-color : #eeeeeee; text-align:center; width: 10%;">유형</th>
										<th style="background-color : #eeeeeee; text-align:center;width: 20%;">작성일</th>
										<th style="background-color : #eeeeeee; text-align:center;width: 5%;">조회</th>
										<th style="background-color : #eeeeeee; text-align:center;width: 5%;">추천</th>
									</tr>
								</thead>
								<tbody id="board_list tbody">
								<%	/* 게시글 리스트 출력문 */
								/* if(){ */
									ArrayList<Bulletin_Board_Camptip> list2 = db.db_SelectList();
											//DTO 처럼 object객체 가져다 쓰려면 import해야함 >> 메소드 등은 usebean으로 가능 
									for(int i=0; i<list2.size(); i++) {
										out.println("<tr id='list_data' class='table_list' cursor: pointer; onclick=location.href='Camptip_Read.jsp?post_num="+list2.get(i).getPost_num()+"'>");
											out.println("<td>" + list2.get(i).getPost_num() + "</td>");
											out.println("<td>" + list2.get(i).getPost_title() + "</td>");
											out.println("<td>" + list2.get(i).getUser_id() + "</td>");
											out.println("<td>" + list2.get(i).getPost_category() + "</td>");
											out.println("<td>" + list2.get(i).getPost_date() + "</td>");
											out.println("<td>" + list2.get(i).getPost_readcount() + "</td>");
											out.println("<td>" + list2.get(i).getPost_like() + "</td>");
										out.println("</tr>");
									}
								/* } */
								%>
								</tbody>
							</table>
						</div>
					</div>				
				</article>
			</section>
				
		</div>
    </main>

    <!-- 푸터 영역 -->
    <jsp:include page="footer.jsp"/>
	
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33a2b44e211b174550a0f064c970415d&libraries=services"></script>
	<script src="js/camp_glam_index.js"></script>
  </body>
  
</html>
