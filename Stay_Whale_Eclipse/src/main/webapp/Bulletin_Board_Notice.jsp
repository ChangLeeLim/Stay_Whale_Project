<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ page import="java.util.ArrayList"%>
     <%@ page import="DTO.Bulletin_Board" %>
     <%@ page import="DAO.Dataprocess" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>STAY WHALE</title>

	<link rel="stylesheet" type="text/css" href="css/bulletin_board_notice.css"><!--※css파일 맞는걸로 수정 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="js/bulletin_board_notice.js"></script>
	
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
<div class="background" style="display: flex; align-items: center;">
  <p style="width: 1280px; margin: auto; font-family: 'Noto Sans KR', sans-serif; font-size: 60px; color: white; font-weight: bold; text-shadow: 2px 2px 0 #000000;" >공지사항</p>
</div>
<!-- -2px -2px 0 #0000ff, 2px -2px 0 #0000ff, -2px 2px 0 #0000ff,  -->

<!-- <div class="commulist">
<ul>
<li>공지사항</li>
<li>이벤트</li>
<li>자주 묻는 질문</li>
<li>1:1 문의</li>
<li>약관 및 정책</li>
</ul>
</div>-->
<ul class="tab-bar">
  <li data-num="1" class="tab wave dark">공지사항</li>
  <!-- <li data-num="2" class="tab wave dark">이벤트</li> -->
  <li data-num="3" class="tab wave dark">자주 묻는 질문</li>
  <!--<li data-num="4" class="tab wave dark">1:1 문의</li>-->
  <li data-num="5" class="tab wave dark">약관 및 정책</li>
  <li class="indicator"></li>
</ul>

    <!-- <section class="article-list table-common con">
        <table border="1" style="width: 1280px; margin:0 auto;">
            <thead>
                <tr>
                    <th class="col1">번호</th>
                    <th class="col2h">제목</th>
                    <th class="col3">작성자</th>
                    <th class="col4">작성일</th>
                </tr>
            </thead>
            <tbody>
                <!--  <tr>
                    <td class="col1">내용1</td>
                    <td class="col2">내용2</td>
                    <td class="col3">내용3</td>
                    <td class="col4">내용4</td>
                </tr>-->
                <%/* 
    	Dataprocess dp = new Dataprocess();
		ArrayList<Bulletin_Board> boardList = dp.boardList();
		
		for(int i = 0; i < boardList.size(); i++)
		{
			out.println("<tr>");
			out.println("<td class='col1'>" + boardList.get(i).getPost_num() + "</td>");
			out.println("<td class='col2'>" + boardList.get(i).getPost_title() + "</td>");
			out.println("<td class='col3'>" + boardList.get(i).getUser_id() + "</td>");
			out.println("<td class='col4'>" + boardList.get(i).getPost_date() + "</td>");
			out.println("</tr>");
		}*/
	%>
            </tbody>
        </table>
    </section>
<!--  <div class="board">
  <table class="boardlist" border="1">
    <tr>
      <th class="col1">번호</th>
      <th class="col2ex">제목</th>
      <th class="col3">작성자</th>
      <th class="col4">작성일</th>
    </tr>
    <%/* 
    	Dataprocess dp = new Dataprocess();
		ArrayList<Bulletin_Board> boardList = dp.boardList();
		
		for(int i = 0; i < boardList.size(); i++)
		{
			out.println("<tr>");
			out.println("<td class='col1'>" + boardList.get(i).getPost_num() + "</td>");
			out.println("<td class='col2'>" + boardList.get(i).getPost_title() + "</td>");
			out.println("<td class='col3'>" + boardList.get(i).getUser_id() + "</td>");
			out.println("<td class='col4'>" + boardList.get(i).getPost_date() + "</td>");
			out.println("</tr>");
		}*/
	%>
  </table>-->
 
  <!-- <section class="con" style="display: flex; justify-content: flex-end; width:1280px; padding: 20px 0px;">
    
    	<button type="button" class='custom-btn btn-3'><span>글쓰기</span></button>
    
	</section> -->
<!--  </div>-->

<h1 style="text-align: center; vertical-align: center; width: 600px; height: 600px; margin: 0px auto;">준비 중입니다.</h1>





<jsp:include page="footer.jsp"/>
</body>
</html>