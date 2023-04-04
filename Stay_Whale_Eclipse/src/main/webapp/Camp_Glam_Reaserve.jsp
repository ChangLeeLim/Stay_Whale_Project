<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8");%>
<html>
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
    <!-- 메인 영역 -->
    <main>
      <!-- 타이틀과 메시지 -->
      <div class="title">
        <h1>STAY WHALE</h1>
        <p>캠핑 / 글램핑</p>
        <a href="Camp_Glam_Reserve.html">
          <button class="cta_button">추천상품_바로가기</button>
        </a>
        <div class="slider_controls">
          <button id="prevButton"><<</button>
          <button id="nextButton">>></button>
        </div>
      </div>

      <!-- 예약하기 -->
      <section class="reservation">
        <h2>날짜로 알아보기</h2>
        <form id="search_date">
          <label for="check_in">Check-in Date :</label>
          <input type="date" id="check_in" name="check_in">
          <label for="check_out">Check-out Date :</label>
          <input type="date" id="check_out" name="check_out">
          <button type="submit" id="date_butoon" class="reservation_button"> 
          날짜 기준 검색 
          </button>
        </form>
      </section>

      <!-- 인기 캠핑장 목록 -->
      <section class="popular_spots">
        <h2>인기 테마 캠핑장</h2>
        <div class="spot_container">
          <div class="spot_card">
            <img src="바다뷰_이미지1.jpg" alt="오션뷰_알아보기">
            <h3>With Ocean</h3>
            <p>오션뷰를 바라볼 수 있는 캠핑장으로, 파도 소리와 함께 여유로운 휴가를 보낼 수 있습니다.</p>
            <a href="Camp_Glam_Reserve.html">
              <button class="spot_button">알아보기</button>
            </a>
          </div>
          <div class="spot_card">
            <img src="산속_이미지1.jpg" alt="산속_알아보기">
            <h3>In the Mountains</h3>
            <p>자연과 함께하는 힐링 캠핑장으로, 시끄러운 도시에서 벗어나 푸른 자연을 만끽하세요.</p>
            <a href="Camp_Glam_Reserve.html">
              <button class="spot_button">알아보기</button>
            </a>
          </div>
          <div class="spot_card">
            <img src="리버뷰_이미지1.jpg" alt="리버뷰_알아보기">
            <h3>With River</h3>
            <p>강을 바라보며 캠핑을 즐길 수 있는 캠핑장으로, 바다와는 또 다른 자연에서 힐링하세요.</p>
            <a href="Camp_Glam_Reserve.html">
              <button class="spot_button">알아보기</button>
            </a>
          </div>
          <div class="spot_card">
            <img src="카라반_이미지1.jpg" alt="카라반_알아보기">
            <h3>Caravan</h3>
            <p>카라반에서 캠핑을 즐길 수 있는 캠핑장으로, 카라반 특유의 묘미를 느껴보세요.</p>
            <a href="Camp_Glam_Reserve.html">
              <button class="spot_button">알아보기</button>
            </a>
          </div>
        </div>
      </section>
    </main>

    <!-- 푸터 영역 -->
    <jsp:include page="footer.jsp"/>
    <!-- 스크립트 링크부분-->
    <script type="text/javascript" src="Camp_Glam_Index2.js"></script>
  
  </body>
</html>
