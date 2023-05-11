<!DOCTYPE html>
<%@page import="vo.PageInfo"%>
<%@page import="vo.HomeStayBean"%>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>

<%
	ArrayList<HomeStayBean> homestayList = (ArrayList<HomeStayBean>)request.getAttribute("homestayList");

	

	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE || HomeStay</title>
	<link rel="stylesheet" type="text/css" href="css/homestay_index.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/homestay_index.js"></script>
	
</head>
<style>
.filter-container {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: none;
  z-index:1100;
}

.filter-content {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  padding: 20px;
  z-index:1200;
}
body.modal-open {
  overflow: hidden;
}
	</style>
<script>

</script>
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
	
	<!-- 생성할 새로운 div 요소 -->
<div class="filter-container">
  <div class="filter-content">
    <h2>Filter Options</h2>
    <ul>
      <li>Option 1</li>
      <li>Option 2</li>
      <li>Option 3</li>
      <li>Option 4</li>
    </ul>
    <button class="filter-close-btn">Close</button>
  </div>
</div>


<div id="banner">
	
	<ul>
		<!-- <li><img src="image\homestay_banner5.jpg"><div class="leftwrap"></div><div class="innerwrap">테스트1</div><div class="rightwrap"></div></li>
		<li><img src="image\homestay_banner6.jpg"><div class="leftwrap"></div><div class="innerwrap">테스트2</div><div class="rightwrap"></div></li>
		<li><img src="image\homestay_banner3.jpg"><div class="leftwrap"></div><div class="innerwrap">테스트3</div><div class="rightwrap"></div></li>
		<li><img src="image\homestay_banner4.jpg"><div class="leftwrap"></div><div class="innerwrap">테스트4</div><div class="rightwrap"></div></li> -->
		
		<li><img src="image\homestay_banner5.jpg"><div class="innerwrap"><div class="textwrap"></div><span class="text1">이달의 호캉스</span><span class="text2">라한 셀렉트 경주</span><span class="text3">호텔패스 단독 특전</span></div></li>
		<li><img src="image\homestay_banner6.jpg"><div class="innerwrap"><div class="textwrap"></div><span class="text1">이달의 호캉스</span><span class="text2">라한 셀렉트 경주</span><span class="text3">호텔패스 단독 특전</span></div></li>
		<li><img src="image\homestay_banner3.jpg"><div class="innerwrap"><div class="textwrap"></div><span class="text1">이달의 호캉스</span><span class="text2">라한 셀렉트 경주</span><span class="text3">호텔패스 단독 특전</span></div></li>
		<li><img src="image\homestay_banner4.jpg"><div class="innerwrap"><div class="textwrap"></div><span class="text1">이달의 호캉스</span><span class="text2">라한 셀렉트 경주</span><span class="text3">호텔패스 단독 특전</span></div></li>
	</ul>
	<!-- <div class="textwrap"></div> -->
	<div class="leftwrap"></div>
	<div class="rightwrap"></div>
</div>


	<section id="main_homestay_section1">
		<!-- <h1>홈스테이</h1> -->
		<div>
		<!-- <h1 style="float: left; line-height: 60px; font-family: 'Noto Sans KR', sans-serif; font-size: 40px; color: gray;">홈스테이</h1> -->
			<ul>
				<!--<li>검색(돋보기)</li>-->
				<li style="height: 40px;"><form action="" class="search-bar" style="padding: 0px">
	<input type="search" name="search" id="search" pattern=".*\S.*" required placeholder="">
	<button class="search-btn" type="submit">
		<span>Search</span>
	</button>
<p style="vertical-align: center; font-family: 'Noto Sans KR', sans-serif; font-weight: bold; line-height: 40px; margin-left: -10px; margin-right: 15px; font-size: 20px; cursor: pointer;">검색</p></form></li>
				<li style="margin-left: 10px; margin-right: 20px;"><img src="image/filter2.png" style="width: 40px; height: 40px;" id="filter-btn"></li>
			</ul>
		</div>
	</section>

	<section id="main_homestay_section2">
		<nav>
			<ul>
				<li class='select'><div><img src="image/add_icon2.png"></div><p style="text-align: center;">전체</p></li>
				<li><div><img src="image/private_room3.png"></div><p style="text-align: center;">개인실</p></li>
				<li><div><img src="image/countryside3.png"></div><p style="text-align: center;">시골</p></li>
				<li><div><img src="image/hanok3.png"></div><p style="text-align: center;">한옥</p></li>
				<li><div><img src="image/national_park3.png"></div><p style="text-align: center;">국립공원</p></li>
				<li><div><img src="image/good_view3.png"></div><p style="text-align: center;">좋은 전망</p></li>
				<li><div><img src="image/beach3.png"></div><p style="text-align: center;">해변가</p></li>
			</ul>
		</nav>
	</section>

	<section id="main_homestay_section3">
		
			<ul>
			<%
				for(int i = 0; i < homestayList.size(); i++)
				{
					String imglist = homestayList.get(i).getAcc_picture();
					String[] imglists = imglist.split(",");
					
					out.println("<li><div class='airbnbimg'><img src='image/"+imglists[0]+"'></div>");
					out.println("<input type='text' name='airbnbnum' class=airbnbnum' value='"+homestayList.get(i).getReg_num_a()+"' hidden>");
					out.println("<div class='airbnblocation'><h3>"+homestayList.get(i).getAcc_name()+"</h3></div>");
					out.println("<div class='airbnbdetail'>"+homestayList.get(i).getLocation()+"</div>");
					out.println("<div class='airbnbprice'>"+homestayList.get(i).getPrice2()+"원(1박 기준)</div>");
					out.println("<div class='airbnbrating'><h4>★ 없음</h4></div></li>");
				}
			%>
			</ul>
	</section>
	<a href="#" onclick="return false" id="more"><p style="width:1280px; margin: 0px auto; font-size: 25px; text-align: center;" >더 보기</p></a>
	<input type="text" value=<%=nowPage %> id="page" hidden/>

	<jsp:include page="footer.jsp"/>

</body>
</html>